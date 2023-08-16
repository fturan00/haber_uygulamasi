import 'package:flutter/material.dart';

class TemaProvider with ChangeNotifier {
  bool _koyuTema = false;
  bool get koyuTema => _koyuTema;

  void temaGecis() {
    _koyuTema = !_koyuTema;
    notifyListeners();
  }
}
