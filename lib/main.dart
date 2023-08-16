import 'package:flutter/material.dart';
import 'package:haber_uygulamasi/pages/anasayfa.dart';
import 'package:haber_uygulamasi/providers/tema_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => TemaProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final temaDegeri = Provider.of<TemaProvider>(context);

    return MaterialApp(
        theme: ThemeData(
            brightness: Brightness.light,
            textTheme:
                const TextTheme(titleLarge: TextStyle(color: Colors.black)),
            appBarTheme: const AppBarTheme(backgroundColor: Color(0xffA65FD1)),
            iconTheme: const IconThemeData(color: Colors.black),
            bottomAppBarTheme:
                const BottomAppBarTheme(color: Color(0xffA65FD1))),
        darkTheme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: Color(0xff601390)),
          textTheme: const TextTheme(
            titleLarge: TextStyle(color: Colors.white38),
          ),
          bottomAppBarTheme: const BottomAppBarTheme(color: Color(0xff601390)),
          iconTheme: const IconThemeData(color: Colors.white),
          brightness: Brightness.dark,
        ),
        themeMode: temaDegeri.koyuTema ? ThemeMode.dark : ThemeMode.light,
        home: const Anasayfa());
  }
}
