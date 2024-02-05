///
/// [AppHttpResponse] é uma classe genérica de modelo para uma resposta HTTP, onde <T> é o tipo de dado retornado pela requisição.
/// A classe é composta por:
/// - [success] que indica se a requisição foi bem sucedida ou não.
/// - [data] que é o dado retornado pela requisição.
/// - [errorMessage] que é a mensagem de erro retornada pela requisição.
/// [data] e [errorMessage] são opcionais, pois uma requisição pode ser bem sucedida
/// e não retornar nenhum dado, ou pode ser mal sucedida e não retornar nenhuma mensagem de erro.
///

class AppHttpResponse<T> {
  final bool success;
  final T? data;
  final String? errorMessage;

  AppHttpResponse({
    required this.success,
    this.data,
    this.errorMessage,
  });
}
