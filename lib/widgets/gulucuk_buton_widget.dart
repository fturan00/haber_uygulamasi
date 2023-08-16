import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class GulucukButonWidget extends StatefulWidget {
  const GulucukButonWidget({super.key});

  @override
  State<GulucukButonWidget> createState() => _GulucukButonWidgetState();
}

class _GulucukButonWidgetState extends State<GulucukButonWidget> {
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
                Icons.sentiment_very_satisfied,
                size: boyut,
                color: Colors.green,
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
