import 'package:flutter/material.dart';
import 'package:gvis_mobilidade/src/app_dto/establishment/establishment_dto.dart';
import 'package:gvis_mobilidade/src/features/establishment/pages/establishment_form_page.dart';
import 'package:gvis_mobilidade/src/utils/app_database/app_database.dart';
import 'package:gvis_mobilidade/src/utils/app_navigator/app_navigator.dart';
import 'package:gvis_mobilidade/src/utils/debouncer/debounder.dart';
import 'package:path/path.dart';
import 'package:rxdart/rxdart.dart';

class EstablishmentListingBloc {
  static final _instance = EstablishmentListingBloc._constructor();
  factory EstablishmentListingBloc() => _instance;
  EstablishmentListingBloc._constructor();

  final _filterTextStream = BehaviorSubject<String?>.seeded(null);
  Stream<String?> get filterTextStream => _filterTextStream.stream;
  Function(String?) get filterTextStreamSinkAdd => _filterTextStream.sink.add;

  final _establishmentsListStream =
      BehaviorSubject<List<EstablishmentDTO>?>.seeded(null);

  final _filteredEstablishments =
      BehaviorSubject<List<EstablishmentDTO>?>.seeded(null);
  Stream<List<EstablishmentDTO>?> get filteredEstablishmentsStream =>
      _filteredEstablishments.stream;

  final Debouncer _filterDebouncer = Debouncer(milliseconds: 500);

  bool _checkFilter(String? establishmentText, String? filter) {
    String finalEstablishment = (establishmentText ?? "").toLowerCase();
    String finalFilter = (filter ?? "").toLowerCase();
    return finalEstablishment.contains(finalFilter);
  }

  void runFilter() {
    String text = _filterTextStream.valueOrNull ?? "";
    debugPrint('valor: $text');
    final list = _establishmentsListStream.value;
    final filteredList = list?.where((establishment) {
      bool containsName = _checkFilter(establishment.nomeFantasia, text);
      bool containsCpfCnpj = _checkFilter(establishment.cpfCnpj, text);
      return containsCpfCnpj || containsName;
    }).toList();

    _filteredEstablishments.add(filteredList);
  }

  Future<void> getEstablishmentListFromDB() async {
    _filterTextStream.sink.add("");
    final establishments = await AppDatabase.establishmnet.getAll();
    _establishmentsListStream.add(establishments);
    _filteredEstablishments.add(establishments);
    _filterDebouncer.run(runFilter);
  }

  void onCreateNewEstablishment(BuildContext context) {
    AppNavigator.push(context, (ctx) => const EstablishmentForm());
  }
}
