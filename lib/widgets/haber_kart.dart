import 'package:flutter/material.dart';
import 'package:haber_uygulamasi/widgets/uzgun_buton_widget.dart';

import '../models/json_fotoveri_model.dart';
import '../pages/haberdetay.dart';
import 'begeni_buton_widget.dart';
import 'gulucuk_buton_widget.dart';

class KartYapisi extends StatelessWidget {
 final FotoVeriModel fotoVeri;
  const KartYapisi({
    Key? key, required this.fotoVeri,
    
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
      child: Material(
        color: Colors.blueAccent,
        child: Container(
          width: 500,
          height: 250,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.black,
              )),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => HaberDetay(
                              imageUrl: fotoVeri.url,
                          )));
                },
                child: Hero(
                  tag: fotoVeri.url,
                  child: Stack(
                    children: [
                      SizedBox(
                        width: 500,
                        height: 180,
                        child: Image.network(
                          fotoVeri.thumbnailUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          child: Text(
                            fotoVeri.title,
                            style: const TextStyle(
                                backgroundColor:
                                    Color.fromARGB(179, 199, 188, 188)),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.bottomRight,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    LikeButonWidget(),
                    GulucukButonWidget(),
                    UzgunButonWidget(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}