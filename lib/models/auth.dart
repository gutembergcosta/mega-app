import 'dart:ffi';

class Auth {
  String? email;
  String? token;
  String? nome;
  String? tipo;
  String? senha;
  int? id;


  Auth({
    this.email, 
    this.token,
    this.id,
    this.nome,
    this.tipo,
    this.senha,
  });

  // Método para converter um objeto User em um mapa
  Map<String, Object?> toMap() {
    return {
      'id': id,
      'token': token,
      'email': email,
      'nome': nome,
      'tipo': tipo,
    };
  }

  factory Auth.fromJson(Map<String, dynamic> json) {
    return Auth(
      id: json['userData']['id'],
      email: json['userData']['email'],
      nome: json['userData']['nome'],
      tipo: json['userData']['tipo'],
      token: json['token'],
    );
  }
}
