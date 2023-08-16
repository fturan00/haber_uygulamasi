import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class LikeButonWidget extends StatefulWidget {
  const LikeButonWidget({super.key});

  @override
  State<LikeButonWidget> createState() => _LikeButonWidgetState();
}

class _LikeButonWidgetState extends State<LikeButonWidget> {
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
      ),
    );
  }
}
