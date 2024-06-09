import 'dart:convert';
import 'package:http/http.dart' as http;

class ClienteHttp {
  Future<dynamic> getJson(String link) async {
    var response = await http.get(Uri.parse(link));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
