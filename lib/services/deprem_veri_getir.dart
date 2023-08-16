import 'package:html/parser.dart';
import 'package:http/http.dart' as http;

class DepremVeri {
  List<Map<String, dynamic>> depremverileriListe = [];
  Future<List<Map<String, dynamic>>> getDepremVeri() async {
    List<dynamic> jsonVeriListe = [];
    final response = await http.get(
      Uri.parse("https://www.haberler.com/son-depremler/"),
    );

    if (response.statusCode == 200) {
      var document = parse(response.body);
      var depremVerileri = document.querySelectorAll("tbody tr");

      for (var i in depremVerileri) {
        var tds = i.querySelectorAll("td");
        for (var td in tds) {
          jsonVeriListe.add(td.text.trim());
        }

        if (jsonVeriListe.length == 11) {
          Map<String, dynamic> depremVeri = {
            'Tarih': jsonVeriListe[0],
            'Ülke': jsonVeriListe[1],
            'Büyüklük': jsonVeriListe[2],
            'İl': jsonVeriListe[3],
            'İlçe': jsonVeriListe[4],
            'Köy': jsonVeriListe[5],
            'Diğer': jsonVeriListe[6],
            'Enlem': jsonVeriListe[7],
            'Boylam': jsonVeriListe[8],
            'Derinlik': jsonVeriListe[9],
            'Tip': jsonVeriListe[10],
          };

          depremverileriListe.add(depremVeri);
          jsonVeriListe.clear();
        }
      }
      print(depremverileriListe);
      return depremverileriListe;
    } else if (response.statusCode != 200) {
      return [];
    } else {
      print("İşlem uzun sürdü bu yüzden veriler yüklenemedi");
      return [];
    }
  }
}
