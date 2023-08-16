import 'package:flutter/material.dart';
import 'package:haber_uygulamasi/providers/tema_provider.dart';
import 'package:provider/provider.dart';

class OrnekSwitch extends StatelessWidget {
  const OrnekSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    bool koyuTema = context.watch<TemaProvider>().koyuTema;

    return Switch(
      onChanged: (value) {
        Provider.of<TemaProvider>(context, listen: false).temaGecis();
      },
      value: koyuTema,
    );
  }
}
