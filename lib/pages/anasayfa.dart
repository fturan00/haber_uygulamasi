import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:haber_uygulamasi/models/corousel_link.dart';
import 'package:haber_uygulamasi/models/json_fotoveri_model.dart';
import 'package:haber_uygulamasi/pages/deprem.dart';
import 'package:haber_uygulamasi/pages/doviz.dart';
import 'package:haber_uygulamasi/services/ornek_json_veri_foto.dart';
import 'package:haber_uygulamasi/widgets/haber_kart.dart';
import 'ayarlar.dart';
import 'profil.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});
  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  late Future<List<FotoVeriModel>> futurefotoListesi;

  @override
  void initState() {
    super.initState();
    futurefotoListesi = veriGetirFoto();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<FotoVeriModel>>(
      future: futurefotoListesi,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<FotoVeriModel> fotoList = snapshot.data!;
          return Scaffold(
            drawer: const AyarlarDrawer(),
            appBar: AppBar(
              title: const Text("Haber Uygulaması"),
              bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(1.0),
                  child: Container(
                    height: 1.3,
                  )),
              elevation: 30,
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 27,
                    width: 30,
                    child: InkWell(
                      onTap: () async {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const DepremEkrani()));
                      },
                      child: Image.asset("assets/fotograflar/earthquake.png",
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            body: ListView(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: CarouselSlider.builder(
                    itemCount: imagelinks.length,
                    itemBuilder: (context, index, realIdx) {
                      return Center(
                          child: Image.network(
                        imagelinks[index],
                        fit: BoxFit.fill,
                        width: 500,
                      ));
                    },
                    options: CarouselOptions(
                        autoPlay: true,
                        aspectRatio: 1.6,
                        enlargeCenterPage: true,
                        enlargeStrategy: CenterPageEnlargeStrategy.zoom),
                  ),
                ),
                KartYapisi(fotoVeri: fotoList[0]),
                KartYapisi(fotoVeri: fotoList[1]),
                KartYapisi(fotoVeri: fotoList[2]),
                KartYapisi(fotoVeri: fotoList[3]),
              ],
            ),
            bottomNavigationBar: BottomAppBar(
              elevation: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon:
                        const Icon(Icons.newspaper_sharp, color: Colors.white),
                  ),
                  IconButton(
                    onPressed: () {
                       {
                      Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const DovizEkrani()));
                      }
                    },
                    icon: const Icon(Icons.attach_money),
                    color: Colors.white,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.sunny),
                      color: Colors.white),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ProfilEkrani()));
                      },
                      icon: const Icon(Icons.person_outline_outlined,
                          color: Colors.white)),
                ],
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return const Center(child: Text("An error occurred"));
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
