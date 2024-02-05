import 'package:flutter/foundation.dart';
import 'package:gvis_mobilidade/src/app_consts/database/app_database_tablename.dart';
import 'package:gvis_mobilidade/src/app_dto/questionnaire/questionnaire_category_dto.dart';
import 'package:gvis_mobilidade/src/app_dto/questionnaire/questionnaire_chapter_dto.dart';
import 'package:gvis_mobilidade/src/app_dto/questionnaire/questionnaire_dto.dart';
import 'package:gvis_mobilidade/src/app_dto/questionnaire/questionnaire_question_answers_dto.dart';
import 'package:gvis_mobilidade/src/app_dto/questionnaire/questionnaire_question_dto.dart';
import 'package:gvis_mobilidade/src/app_dto/questionnaire/questionnaire_question_option_dto.dart';
import 'package:gvis_mobilidade/src/app_dto/questionnaire/questionnaire_question_receipt.dart';
import 'package:gvis_mobilidade/src/app_dto/questionnaire/questionnaire_question_receipt_question_dto.dart';
import 'package:gvis_mobilidade/src/app_dto/questionnaire/questionnaire_question_reference_dto.dart';
import 'package:gvis_mobilidade/src/app_dto/questionnaire/questionnaire_question_single_answer_dto.dart';
import 'package:gvis_mobilidade/src/utils/app_database/interfaces/app_repository_batch.dart';
import 'package:sqflite/sqflite.dart';

class QuestionnaireRepository implements AppRepositoryBatch<QuestionnaireDTO> {
  static const String tableName = AppDatabaseTablename.questionnaire;
  final Database _database;

  QuestionnaireRepository({required Database database}) : _database = database;

  @override
  void deleteByIdBatch(Batch batch, int id) async {
    batch.delete(tableName, where: 'codigoQuestionario = ?', whereArgs: [id]);
  }

  @override
  void insertOrUpdateBatch(Batch batch, QuestionnaireDTO model) async {
    // insere o questionário
    batch.insert(
      tableName,
      model.toDatabase(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    // insere os capítulos
    model.capitulos?.forEach((chapter) {
      batch.insert(
        AppDatabaseTablename.questionnaireChapter,
        chapter.toDatabase(model.codigoQuestionario),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );

      // insere as categorias
      chapter.categorias?.forEach((category) {
        batch.insert(
          AppDatabaseTablename.questionnaireCategory,
          category.toDatabase(chapter.codigoCapitulo),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );

        // insere as perguntas
        category.perguntas?.forEach((question) {
          batch.insert(
            AppDatabaseTablename.questionnaireQuestion,
            question.toDatabase(category.codigoCategoria),
            conflictAlgorithm: ConflictAlgorithm.replace,
          );

          // insere as opções
          question.perguntaOpcoes?.forEach((option) {
            batch.insert(
              AppDatabaseTablename.questionnaireQuestionOption,
              option.toDatabase(question.codigoPergunta),
              conflictAlgorithm: ConflictAlgorithm.replace,
            );
          });

          // insere as avaliações
          question.avaliacoesRespostas?.forEach((answer) {
            batch.insert(
              AppDatabaseTablename.questionnaireQuestionAnswers,
              answer.toDatabase(),
              conflictAlgorithm: ConflictAlgorithm.replace,
            );

            // insere as respostas
            answer.respostasPerguntas?.forEach((singleAnswer) {
              batch.insert(
                AppDatabaseTablename.questionnaireQuestionSingleAnswer,
                singleAnswer.toDatabase(),
                conflictAlgorithm: ConflictAlgorithm.replace,
              );
            });
          });

          // insere as comprovações
          question.comprovacoes?.forEach((receipt) {
            batch.insert(
              AppDatabaseTablename.questionnaireReceipt,
              receipt.toDatabase(),
              conflictAlgorithm: ConflictAlgorithm.replace,
            );

            batch.insert(
              AppDatabaseTablename.questionnaireReceiptQuestion,
              {'id': receipt.id, 'codigoPergunta': question.codigoPergunta},
            );
          });

          // insere as referências
          question.referencias?.forEach((reference) {
            batch.insert(
              AppDatabaseTablename.questionnaireReference,
              reference.toDatabase(),
              conflictAlgorithm: ConflictAlgorithm.replace,
            );

            batch.insert(
              AppDatabaseTablename.questionnaireQuestionReference,
              {
                'codigoReferencia': reference.codigoReferencia,
                'codigoPergunta': question.codigoPergunta
              },
            );
          });
        });
      });
    });
  }

  @override
  Future<bool> deleteById(int id) async {
    int rows = await _database.delete(
      tableName,
      where: 'codigoQuestionario = ?',
      whereArgs: [id],
    );

    return rows > 0;
  }

  @override
  Future<QuestionnaireDTO?> getById(int codigoQuestionario) async {
    List<Map<String, dynamic>> questionnaires = await _database.query(
      tableName,
      where: 'codigoQuestionario = ?',
      whereArgs: [codigoQuestionario],
    );

    if (questionnaires.isEmpty) {
      debugPrint('Questionário não encontrado');
      return null;
    }

    QuestionnaireDTO questionnaire =
        QuestionnaireDTO.fromDatabase(questionnaires.first, null);

    // pega os capitulos
    List<Map<String, dynamic>> chapters = await _database.query(
      AppDatabaseTablename.questionnaireChapter,
      where: 'codigoQuestionario = ?',
      whereArgs: [codigoQuestionario],
    );

    List<QuestionnaireChapterDTO> chaptersList = [];

    for (var chapter in chapters) {
      var tempChapter = QuestionnaireChapterDTO.fromDatabase(chapter, null);

      // pega as categorias
      List<Map<String, dynamic>> categories = await _database.query(
        AppDatabaseTablename.questionnaireCategory,
        where: 'codigoCapitulo = ?',
        whereArgs: [tempChapter.codigoCapitulo],
      );

      List<QuestionnaireCategoryDTO> categoriesList = [];
      for (var category in categories) {
        var tempCategory =
            QuestionnaireCategoryDTO.fromDatabase(category, null);

        // pega as perguntas
        List<Map<String, dynamic>> questions = await _database.query(
          AppDatabaseTablename.questionnaireQuestion,
          where: 'codigoCategoria = ?',
          whereArgs: [tempCategory.codigoCategoria],
        );

        List<QuestionnaireQuestionDTO> questionsList = [];
        for (var question in questions) {
          var tempQuestion = QuestionnaireQuestionDTO.fromDatabase(
              question, null, null, null, null);

          // pega as opções
          List<Map<String, dynamic>> options = await _database.query(
            AppDatabaseTablename.questionnaireQuestionOption,
            where: 'codigoPergunta = ?',
            whereArgs: [tempQuestion.codigoPergunta],
          );

          List<QuestionnaireQuestionOptionDTO> optionsList = [];
          for (var option in options) {
            optionsList.add(
              QuestionnaireQuestionOptionDTO.fromDatabase(option),
            );
          }

          //pega as comprovações (tabela de união)
          List<Map<String, dynamic>> receiptsNumbers = await _database.query(
            AppDatabaseTablename.questionnaireReceiptQuestion,
            where: 'codigoPergunta = ?',
            whereArgs: [tempQuestion.codigoPergunta],
          );

          List<QuestionnaireQuestionReceiptQuestionDTO> receiptsList = [];
          for (var receipt in receiptsNumbers) {
            receiptsList.add(
              QuestionnaireQuestionReceiptQuestionDTO.fromDatabase(receipt),
            );
          }

          //pega as comprovações
          List<Map<String, dynamic>> receipts = await _database.query(
            AppDatabaseTablename.questionnaireReceipt,
            where: 'id IN (${receiptsList.map((e) => e.id).join(',')})',
          );

          List<QuestionnaireQuestionReceiptDTO> receiptsDTOList = [];
          for (var receipt in receipts) {
            receiptsDTOList.add(
              QuestionnaireQuestionReceiptDTO.fromDatabase(receipt),
            );
          }

          //pega as referencias (tabela de união)
          List<Map<String, dynamic>> referencesNumbers = await _database.query(
            AppDatabaseTablename.questionnaireQuestionReference,
            where: 'codigoPergunta = ?',
            whereArgs: [tempQuestion.codigoPergunta],
          );

          List<QuestionnaireQuestionReferenceDTO> referencesList = [];
          for (var reference in referencesNumbers) {
            referencesList.add(
              QuestionnaireQuestionReferenceDTO.fromDatabase(reference),
            );
          }

          //pega as referencias
          List<Map<String, dynamic>> references = await _database.query(
            AppDatabaseTablename.questionnaireReference,
            where:
                'codigoReferencia IN (${referencesList.map((e) => e.codigoReferencia).join(',')})',
          );

          List<QuestionnaireQuestionReferenceDTO> referencesDTOList = [];
          for (var reference in references) {
            referencesDTOList.add(
              QuestionnaireQuestionReferenceDTO.fromDatabase(reference),
            );
          }

          // pega o conjunto de resposta
          List<Map<String, dynamic>> answers = await _database.query(
            AppDatabaseTablename.questionnaireQuestionAnswers,
            where: 'codigoPergunta = ?',
            whereArgs: [tempQuestion.codigoPergunta],
          );

          List<QuestionnaireQuestionAnswersDTO> answersList = [];
          for (var ans in answers) {
            var tempAns =
                QuestionnaireQuestionAnswersDTO.fromDatabase(ans, null);

            // pega as respostas
            List<Map<String, dynamic>> singleAnswers = await _database.query(
              AppDatabaseTablename.questionnaireQuestionSingleAnswer,
              where: 'codigoAvaliacaoResposta = ?',
              whereArgs: [tempAns.codigoAvaliacaoResposta],
            );

            List<QuestionnaireQuestionSingleAnswerDTO> singleAnswersList = [];
            for (var singleAns in singleAnswers) {
              singleAnswersList.add(
                QuestionnaireQuestionSingleAnswerDTO.fromDatabase(singleAns),
              );
            }

            tempAns.setRespostasPerguntas(singleAnswersList);
            answersList.add(tempAns);
          }

          // define os valores da pergunta
          tempQuestion.setReferencias(referencesDTOList);
          tempQuestion.setComprovacoes(receiptsDTOList);
          tempQuestion.setPerguntaOpcoes(optionsList);
          tempQuestion.setAvaliacoesRespostas(answersList);
          questionsList.add(tempQuestion);
        }

        //define os valores da categoria
        tempCategory.setPerguntas(questionsList);
        categoriesList.add(tempCategory);
      }
      tempChapter.setCategorias(categoriesList);
      chaptersList.add(tempChapter);
    }

    questionnaire.setCapitulos(chaptersList);
    return questionnaire;
  }
}
