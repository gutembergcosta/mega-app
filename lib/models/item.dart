class Item {
  int? id;
  String? nome;
  String? info;
  String? texto;

  Item({this.id, this.nome, this.info, this.texto});

  // Método para converter um objeto User em um mapa
  Map<String, Object?> toMap() {
    return {
      'id': id,
      'nome': nome,
      'info': info,
      'texto': texto,
    };
  }

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      nome: json['nome'],
      info: json['info'],
      texto: json['texto'],
    );
  }
}
