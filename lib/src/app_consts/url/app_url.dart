///
/// [AppUrl] é um enum que contém todos os links gerais utilizados dentro do aplicativo.
/// Os links de servidores são gerenciados pelo app_server_key.
///

enum AppUrl {
  termsOfUse('https://revvisadev.g-visa.com.br/termos.html');

  final String urlPath;
  const AppUrl(this.urlPath);
}
