import 'dart:convert';

import 'package:http/http.dart' as http;

class ClienteHttp {
  // lembrar de baixar a dependencia http 1.2.1 -> no site pub.dev
  Future<List<dynamic>> getJson(String link) async {

    var response = await http.get(Uri.parse(link));
    var result = json.decode(response.body);

    return result['results'];
  }
  
}

