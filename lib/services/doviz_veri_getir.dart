import 'package:html/parser.dart';
import 'package:http/http.dart' as http;

class DovizVeri {
  List<Map<String, dynamic>> dovizVerileriListe = [];
  List<dynamic> jsonDovizListe = [];
  List<dynamic> jsonDovizImageListe = [];
  Future<List<Map<String, dynamic>>> getDovizVeri() async {
    final response =
        await http.get(Uri.parse("https://www.haberler.com/finans/doviz/"));

    if (response.statusCode == 200) {
      var document = parse(response.body);
      var dovizVerileri = document.getElementsByClassName(
          "col33 col40-md col100-xs boxStyle hbFinanceSidebar");

      for (var a in dovizVerileri) {
        var image1 = a.querySelectorAll("td");
        for (var b in image1) {
          var image2 = b.querySelectorAll("img");
          for (var c in image2) {
            jsonDovizImageListe
                .add('https://www.haberler.com${c.attributes['src']}');
          }
        }
      }

      for (var i in dovizVerileri) {
        var td = i.querySelectorAll("td");

        for (var tds in td) {
          jsonDovizListe.add(tds.text.trim());
          if (jsonDovizListe.length == 5) {
            Map<String, dynamic> kur = {
              'Hisse': jsonDovizListe[0],
              'Yön': jsonDovizImageListe.removeAt(0),
              'Son': jsonDovizListe[2],
              'Fark': jsonDovizListe[3],
              'Saat': jsonDovizListe[4],
            };
            dovizVerileriListe.add(kur);
            jsonDovizListe.clear();
          }

          print(dovizVerileriListe);
          print(jsonDovizImageListe);
        }
      }
      return dovizVerileriListe;
    } else if (response.statusCode != 200) {
      return [];
    } else {
      print("İşlem uzun sürdü bu yüzden veriler yüklenemedi");
      return [];
    }
  }
}
