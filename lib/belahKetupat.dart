import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'luasController.dart';

class BelahKetupatPage extends StatefulWidget {
  const BelahKetupatPage({Key? key}) : super(key: key);

  @override
  State<BelahKetupatPage> createState() => _BelahKetupatPageState();
}

class _BelahKetupatPageState extends State<BelahKetupatPage> {
  Color buttonColor = Color.fromARGB(255, 30, 0, 95);
  final LuasController controller = Get.put(LuasController());

  TextEditingController _diagonal1Ctr = TextEditingController();
  TextEditingController _diagonal2Ctr = TextEditingController();

  @override
  void dispose() {
    _diagonal1Ctr.dispose();
    _diagonal2Ctr.dispose();
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
          _inputField(_diagonal1Ctr, "Diagonal 1"),
          SizedBox(height: 16.0),
          _inputField(_diagonal2Ctr, "Diagonal 2"),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              controller.luasBelahKetupat(double.parse(_diagonal1Ctr.text),
                  double.parse(_diagonal2Ctr.text));
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
              'Luas: ${controller.hasilLuasBelahKetupat.value} cm²',
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
          'Kalkulator Luas Belah Ketupat',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: _bodyContainer(),
    );
  }
}
