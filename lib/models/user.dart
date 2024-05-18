class User {
  final int? id;
  final String nome;
  final String info;
  final String texto;

  User({
    this.id, 
    required this.nome, 
    required this.info,
    required this.texto
  });

  // Método para converter um objeto User em um mapa
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'info': info,
      'texto': texto,
    };
  }

  // Método para converter um mapa em um objeto User
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      nome: map['nome'],
      info: map['info'],
      texto: map['texto'],
    );
  }
}
