import 'package:flutter/material.dart';

class HaberDetay extends StatefulWidget {
  final String imageUrl;
  const HaberDetay({super.key, required this.imageUrl});

  @override
  State<HaberDetay> createState() => _HaberDetayState();
}

class _HaberDetayState extends State<HaberDetay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              Hero(
                  tag: widget.imageUrl,
                  child: Container(
                      width: 180,
                      height: 400,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(widget.imageUrl),
                            fit: BoxFit.cover),
                      )))
            ],
          )
        ],
      ),
    );
  }
}
