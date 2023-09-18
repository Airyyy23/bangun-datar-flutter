import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'luasController.dart';

class SegiLimaPage extends StatefulWidget {
  const SegiLimaPage({Key? key}) : super(key: key);

  @override
  State<SegiLimaPage> createState() => _SegiLimaPageState();
}

class _SegiLimaPageState extends State<SegiLimaPage> {
  Color buttonColor = Color(0xFF1E005F);
  final LuasController controller = Get.put(LuasController());

  TextEditingController _sisiCtr = TextEditingController();

  @override
  void dispose() {
    _sisiCtr.dispose();
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
          _inputField(_sisiCtr, "Sisi"),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              controller.luasSegiLima(double.parse(_sisiCtr.text));
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
              'Luas: ${controller.hasilLuasSegiLima.value} cm²',
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
          'Kalkulator Luas Persegi',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: _bodyContainer(),
    );
  }
}
