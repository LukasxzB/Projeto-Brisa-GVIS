///
/// [AppServerKey] é uma classe de enum que contém as chaves e url
/// dos servidores da aplicação.
///
enum AppServerKey {
  demo('demo', 'https://demonstracao.g-visa.com.br/seam/resource/rest');

  final String serverKey, serverBaseUrl;
  const AppServerKey(this.serverKey, this.serverBaseUrl);
}
