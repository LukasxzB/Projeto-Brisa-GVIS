///
/// [AppServerEndpoint] é um enum que contém todas os links de endpoints de um servidor.
/// Por exemplo: '/autenticacao' é o endpoint para a autenticação de um usuário.
///

enum AppServerEndpoint {
  login('/autenticacao'),
  evaluations('/avaliacoes'),
  establishments('/estabelecimentos'),
  questionnaires('/questionarios');

  final String urlPath;
  const AppServerEndpoint(this.urlPath);
}
