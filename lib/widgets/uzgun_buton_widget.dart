import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class UzgunButonWidget extends StatefulWidget {
  const UzgunButonWidget({super.key});

  @override
  State<UzgunButonWidget> createState() => _UzgunButonWidgetState();
}

class _UzgunButonWidgetState extends State<UzgunButonWidget> {
  bool begendiMi = false;
  int begeniSayisi = 0;
  @override
  Widget build(BuildContext context) {
    const double boyut = 25;

    return OutlinedButton(
      onPressed: () {},
      child: LikeButton(
          size: boyut,
          isLiked: begendiMi,
          likeCount: begeniSayisi,
          onTap: (isLiked) async {
            setState(() {
              begendiMi = !begendiMi;
              if (begendiMi == true) {
                begeniSayisi += 1;
              } else {
                begeniSayisi -= 1;
              }
            });
            return (isLiked);
          },
          likeBuilder: (bool isLiked) {
            if (begendiMi == true) {
              return const Icon(
                Icons.sentiment_dissatisfied_rounded,
                size: boyut,
                color: Colors.red,
              );
            } else {
              return const Icon(
                Icons.sentiment_neutral,
                size: boyut,
                color: Color(0xffA65FD1),
              );
            }
          }),
    );
  }
}
