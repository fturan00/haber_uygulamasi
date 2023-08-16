import 'package:flutter/material.dart';
import 'package:haber_uygulamasi/services/doviz_veri_getir.dart';

class DovizEkrani extends StatefulWidget {
  const DovizEkrani({super.key});

  @override
  State<DovizEkrani> createState() => _DovizEkraniState();
}

class _DovizEkraniState extends State<DovizEkrani> {
  late Future<List<Map<String, dynamic>>> dovizVeriListe;

  late Color baslikRengi;

  @override
  void initState() {
    super.initState();
    dovizVeriListe = DovizVeri().getDovizVeri();
  }

  Widget build(BuildContext context) {
    baslikRengi = Color(0xffA65FD1);
    return Scaffold(
        appBar: AppBar(
          title: Text("Doviz Verileri"),
        ),
        body: FutureBuilder<List<Map<String, dynamic>>>(
          future: dovizVeriListe,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  Map<String, dynamic> doviz = snapshot.data![index];
                  return Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 251, 249, 243),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 8,
                              spreadRadius: 1,
                              offset: Offset(6, 6)),
                        ]),
                    margin: EdgeInsets.all(8),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            doviz['Hisse'],
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                          Image.network(
                            doviz['Yön'],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Fiyat: ",
                                  style: TextStyle(
                                      color: baslikRengi,
                                      fontWeight: FontWeight.bold)),
                              Text(doviz['Son']),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Fark: ",
                                  style: TextStyle(
                                      color: baslikRengi,
                                      fontWeight: FontWeight.bold)),
                              Text(doviz['Fark']),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Saat: ",
                                  style: TextStyle(
                                      color: baslikRengi,
                                      fontWeight: FontWeight.bold)),
                              Text(doviz['Saat']),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('hata: ${snapshot.error}'));
            } else {
              return Center(child: Text('veri gelmedi.'));
            }
          },
        ));
  }
}
