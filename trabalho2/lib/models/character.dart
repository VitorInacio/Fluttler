class Character {
  String nome;
  String titulo;
  String visao;
  String arma;
  String genero;
  String nacao;
  int raridade;
  String id;

  Character({
    required this.nome,
    required this.titulo,
    required this.visao,
    required this.arma,
    required this.genero,
    required this.nacao,
    required this.raridade,
    required this.id,
  });

  String imagem() {
    return 'https://genshin.jmp.blue/characters/$id/icon';
  }
}
