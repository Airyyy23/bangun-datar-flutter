import 'dart:math';

import 'package:get/get.dart';

class LuasController extends GetxController {
  final hasilLuasPersegi = RxDouble(0.0);
  final hasilLuasPersegiPanjang = RxDouble(0.0);
  final hasilLuasSegitiga = RxDouble(0.0);
  final hasilLuasSegiLima = RxDouble(0.0);
  final hasilLuasBelahKetupat = RxDouble(0.0);

  luasPersegi(double sisi) {
    hasilLuasPersegi.value = sisi * sisi;
  }

  luasPersegiPanjang(double panjang, double lebar) {
    hasilLuasPersegiPanjang.value = panjang * lebar;
  }

  luasSegitiga(double alas, double tinggi) {
    hasilLuasSegitiga.value = 0.5 * alas * tinggi;
  }

  luasSegiLima(double sisi) {
    num numer = 5 * pow(sisi, 2);
    double denom = 4 * sqrt(5 - 2 * sqrt(5));
    hasilLuasSegiLima.value = numer / denom;
  }

  luasBelahKetupat(double diagonal1, double diagonal2) {
    hasilLuasBelahKetupat.value = (diagonal1 * diagonal2) / 2;
  }
}
