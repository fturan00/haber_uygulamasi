import 'package:flutter/material.dart';
import 'package:haber_uygulamasi/services/deprem_veri_getir.dart';

class DepremEkrani extends StatefulWidget {
  const DepremEkrani({
    super.key,
  });

  @override
  State<DepremEkrani> createState() => _DepremEkraniState();
}

class _DepremEkraniState extends State<DepremEkrani> {
  late Future<List<Map<String, dynamic>>> futureDepremList;

  late Color baslikrengi;

  @override
  void initState() {
    super.initState();
    futureDepremList = DepremVeri().getDepremVeri();
  }

  @override
  Widget build(BuildContext context) {
    baslikrengi = const Color(0xffA65FD1);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Son Depremler"),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: futureDepremList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                Map<String, dynamic> deprem = snapshot.data![index];
                return Card(
                  child: ExpansionTile(
                    title: Row(
                      children: [
                        Text(
                          deprem['Ülke'],
                          style:
                              TextStyle(
                                color: baslikrengi, fontSize: 18),
                        ),
                        const Text("-"),
                        Text(
                          deprem['İl'],
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    subtitle: Text(
                      deprem['Tarih'],
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Konum: ",
                                  style: TextStyle(color: baslikrengi),
                                ),
                                Text(deprem['Ülke'] +
                                    '/' +
                                    deprem['İl'] +
                                    '/' +
                                    deprem['İlçe'] +
                                    '/' +
                                    deprem['Köy'])
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Büyüklük: ",
                                  style: TextStyle(color: baslikrengi),
                                ),
                                Text(deprem['Büyüklük']),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Enlem: ",
                                  style: TextStyle(color: baslikrengi),
                                ),
                                Text(deprem['Enlem']),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Boylam: ",
                                  style: TextStyle(color: baslikrengi),
                                ),
                                Text(deprem['Boylam']),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Derinlik: ",
                                  style: TextStyle(color: baslikrengi),
                                ),
                                Text(deprem['Derinlik']),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Tip: ",
                                  style: TextStyle(color: baslikrengi),
                                ),
                                Text(deprem['Tip']),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Diğer: ",
                                  style: TextStyle(color: baslikrengi),
                                ),
                                Text(deprem['Diğer']),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Hata: ${snapshot.error}'));
          } else {
            return const Center(child: Text('Veri Yok.'));
          }
        },
      ),
    );
  }
}
