import 'package:flutter/material.dart';
import 'package:trabalho2/models/character.dart';
import 'package:trabalho2/ui/pages/detalhes_page.dart';

class CriarLista extends StatelessWidget {
  final Character character;

  const CriarLista(this.character, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: GestureDetector(
        child: Card(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Image.network(
                  character.imagem(),
                  width: 100,
                  height: 100,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.network(
                      'https://conceptwindows.com.au/wp-content/uploads/no-profile-pic-icon-27.png',
                      width: 100,
                      height: 100,
                      fit: BoxFit.contain,
                    );
                  },
                ),
                Expanded(
                  child: Text(
                    character.nome,
                    style: const TextStyle(fontSize: 22),
                  ),
                ),
                const Icon(Icons.arrow_forward_ios),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetalhesPage(character),
            ),
          );
        },
      ),
    );
  }
}
