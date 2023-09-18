import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'luasController.dart';

class PersegiPanjangPage extends StatefulWidget {
  const PersegiPanjangPage({super.key});

  @override
  State<PersegiPanjangPage> createState() => _PersegiPanjangPageState();
}

class _PersegiPanjangPageState extends State<PersegiPanjangPage> {
  Color buttonColor = Color(0xFF1E005F);
  final LuasController controller = Get.put(LuasController());

  TextEditingController _panjangCtr = TextEditingController();
  TextEditingController _lebarCtr = TextEditingController();

  @override
  void dispose() {
    _panjangCtr.dispose();
    _lebarCtr.dispose();
    super.dispose();
  }

  Widget _inputField(TextEditingController ctr, String label) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextField(
        controller: ctr,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))
        ],
        decoration: InputDecoration(
          labelText: label,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: buttonColor,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: buttonColor,
            ),
          ),
        ),
      ),
    );
  }

  Widget _bodyContainer() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _inputField(_panjangCtr, "Panjang"),
          SizedBox(height: 16.0),
          _inputField(_lebarCtr, "Lebar"),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              controller.luasPersegiPanjang(
                  double.parse(_panjangCtr.text), double.parse(_lebarCtr.text));
            },
            style: ElevatedButton.styleFrom(
              primary: buttonColor,
              onPrimary: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: Text(
                'Hitung Luas',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
          SizedBox(height: 16.0),
          Obx(
            () => Text(
              'Luas: ${controller.hasilLuasPersegiPanjang.value} cm²',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Kalkulator Luas Persegi Panjang',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: _bodyContainer(),
    );
  }
}
