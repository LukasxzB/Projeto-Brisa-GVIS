///
/// O DTO [LoginDTO] é um objeto que representa o retorno da API de login. (/autenticacao)
///
class LoginDTO {
  final String token;
  final String usuario;
  final String nome;
  final String email;
  final bool ativo;
  final int id;

  const LoginDTO({
    required this.token,
    required this.usuario,
    required this.nome,
    required this.email,
    required this.ativo,
    required this.id,
  });

  factory LoginDTO.fromJson(Map<String, dynamic> json) {
    return LoginDTO(
      token: json['token'],
      usuario: json['usuario'],
      nome: json['nome'],
      email: json['email'],
      ativo: json['ativo'],
      id: json['id'],
    );
  }
}
