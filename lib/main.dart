import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();
  String _result = "";

  void _calculateSum() {
    final String num1Text = _num1Controller.text;
    final String num2Text = _num2Controller.text;

    if (num1Text.isNotEmpty && num2Text.isNotEmpty) {
      final double num1 = double.tryParse(num1Text) ?? 0;
      final double num2 = double.tryParse(num2Text) ?? 0;
      setState(() {
        _result = (num1 + num2).toString();
      });
    } else {
      setState(() {
        _result = "Veuillez entrer des nombres valides.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ma Calculatrice"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _num1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Premier nombre",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _num2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Deuxième nombre",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _calculateSum,
              child: Text("Calculer"),
            ),
            SizedBox(height: 16),
            Text(
              "Le résultat est : $_result",
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
