import 'package:flutter/material.dart';
import 'package:haber_uygulamasi/widgets/switch_widget.dart';

class AyarlarDrawer extends StatefulWidget {
  const AyarlarDrawer({super.key});

  @override
  State<AyarlarDrawer> createState() => _AyarlarDrawerState();
}

class _AyarlarDrawerState extends State<AyarlarDrawer> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: SafeArea(
        child: Drawer(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  "Uygulama ismi ve logosu",
                  style: TextStyle(fontSize: 25),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text(
                      "Koyu Tema",
                      style: TextStyle(fontSize: 18),
                    ),
                    OrnekSwitch(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
