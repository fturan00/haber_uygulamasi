/*import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/haber_veri_model.dart';

Future<List<HaberVeriModel>> haberGetir() async {
  final response = await http
      .get(Uri.parse('http://10.0.2.2:44333/HaberGetir'));

  if (response.statusCode == 200) {
    print(response.body);
    return jsonDecode(response.body);
  } else {
    throw Exception("hata");
  }
}
*/