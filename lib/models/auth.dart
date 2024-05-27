import 'dart:ffi';

class Auth {
  String? email;
  String? senha;
  String? token;
  Int? id;

  Auth({
    this.email, 
    this.senha,
    this.token,
    this.id,
  });

  // Método para converter um objeto User em um mapa
  Map<String, Object?> toMap() {
    return {
      'id': id,
      'token': token,
      'email': email,
      'senha': senha
    };
  }

  factory Auth.fromJson(Map<String, dynamic> json) {
    return Auth(
      id: json['id'],
      token: json['token'],
      email: json['email'],
      senha: json['senha'],
    );
  }
}
