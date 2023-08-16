import 'dart:convert';

import 'package:haber_uygulamasi/models/json_fotoveri_model.dart';
import 'package:http/http.dart' as http;

Future<List<FotoVeriModel>> veriGetirFoto() async {
  final responsefoto =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

  if (responsefoto.statusCode == 200) {
    Iterable jsonResponse = jsonDecode(responsefoto.body);
    List<FotoVeriModel> fotoList = List<FotoVeriModel>.from(
        jsonResponse.map((model) => FotoVeriModel.fromJson(model)));
    return fotoList;
  } else {
    throw Exception("Error");
  }
}
