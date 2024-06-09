import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trabalho2/models/character.dart';

class DetalhesPage extends StatelessWidget {
  final Character character;

  const DetalhesPage(this.character, {super.key});
  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(character.nome, style: TextStyle(color: Colors.amber.shade500)),
          backgroundColor: Colors.lightBlue
        ),
        body: ListView(
          children: [
            Center(
              child: Image.network(
                character.imagem(),
                fit: BoxFit.cover,
                height: 200,
                width: 200,
              ),
            ),
            SizedBox(height: 16),
            _buildDetalhe('Título', character.titulo),
            _buildDetalhe('Visão', character.visao),
            _buildDetalhe('Arma', character.arma),
            _buildDetalhe('Gênero', character.genero),
            _buildDetalhe('Nação', character.nacao),
            _buildDetalhe('Raridade', character.raridade.toString() + ' estrelas'),
          ],
        ),
      ),
    );
  }
  Widget _buildDetalhe(String titulo, String valor) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              titulo,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(valor),
          ),
        ],
      ),
    );
  }
}
