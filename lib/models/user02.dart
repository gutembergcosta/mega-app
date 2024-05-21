class User02 {
  int? id;
  String? nome;
  String? info;
  String? texto;

  User02({
    this.id, 
    this.nome, 
    this.info,
    this.texto
  });

  // Método para converter um objeto User em um mapa
  Map<String, Object?> toMap() {
    return {
      'id': id,
      'nome': nome,
      'info': info,
      'texto': texto,
    };
  }

}
