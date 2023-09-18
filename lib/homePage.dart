import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:tugas_bangun_datar/Segitiga.dart';
import 'package:tugas_bangun_datar/belahKetupat.dart';
import 'package:tugas_bangun_datar/persegi.dart';
import 'package:tugas_bangun_datar/persegiPanjang.dart';
import 'package:tugas_bangun_datar/segiLima.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF1E005F),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  Color iconColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Color(0xFF1E005F),
        animationDuration: Duration(milliseconds: 600),
        index: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          Image.asset('assets/persegi.png'),
          Image.asset('assets/persegi-panjang.png'),
          Image.asset('assets/segitiga.png'),
          Image.asset('assets/segi-lima.png'),
          Image.asset('assets/belah-ketupat.png')
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          PersegiPage(),
          PersegiPanjangPage(),
          SegitigaPage(),
          SegiLimaPage(),
          BelahKetupatPage()
        ],
      ),
    );
  }
}
