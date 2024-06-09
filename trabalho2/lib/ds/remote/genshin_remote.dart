import 'package:trabalho2/models/character.dart';
import 'package:trabalho2/services/cliente_http.dart';
import '../../config.dart';

class GenshinRemote {
  final _clienteHttp = ClienteHttp();

  Future<List<Character>> get() async {
    final lista = await _clienteHttp.getJson(linkAPI);

    List<Character> characters = [];
    for (var id in lista) {
      try {
        var details = await _clienteHttp.getJson('$linkAPI/$id');

        // Verifique se a resposta contém um campo de erro
        if (details != null && !details.containsKey("error")) {
          characters.add(Character(
            nome: details["name"] ?? '',
            titulo: details["title"] ?? '',
            visao: details["vision"] ?? '',
            arma: details["weapon"] ?? '',
            genero: details["gender"] ?? '',
            nacao: details["nation"] ?? '',
            raridade: details["rarity"] ?? 0,
            id: details["id"] ?? '',
          ));
        } else {
          characters.add(Character(
            nome: id,
            titulo: '',
            visao:'',
            arma: '',
            genero: '',
            nacao:'',
            raridade: 0,
            id: id,
          ));
        }
      } catch (e) {
        print('Failed to load details for character ID: $id, error: $e');
      }
    }
    return characters;
  }
}
