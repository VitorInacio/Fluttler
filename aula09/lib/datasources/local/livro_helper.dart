class LivroHelper {
  static const createSql = '''
    CREATE TABLE IF NOT EXISTS TbLivro (
      codigo INTEGER PRIMARY KEW AUTOINCREMENT,
      nome TEXT,
      preco REAL,
      editora INTEGER,
      FORENG KEW (editora) REFERENCES TbEditora(codigo)
    )
  ''';
}