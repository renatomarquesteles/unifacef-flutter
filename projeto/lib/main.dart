import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override // Sobrescrever um método do StetelessWidget
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Construindo layouts"),
        ),
        body: lista(),
      ),
    );
  }
}

Widget meuLayoutWidget() {
  return Padding(
      padding: const EdgeInsets.only(left: 20, top: 10, right: 0, bottom: 0),
      child: Text("Olá, Flutter!"));
}

Widget meuLayoutWidget2() {
  return Align(
    alignment: Alignment.center,
    child: Text("Olá, Flutter!", style: TextStyle(fontSize: 30)),
  );
}

Widget meuLayoutWidget3() {
  return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(10),
      alignment: Alignment.topCenter,
      width: 200,
      height: 100,
      decoration:
          BoxDecoration(color: Colors.redAccent[400], border: Border.all()),
      child: Text("Olá, Flutter!", style: TextStyle(fontSize: 20)));
}

Widget lista() {
  return Row(children: [meuLayoutWidget3(), outroWidget()]);
}

Widget outroWidget() {
  return Container(
      width: 150,
      height: 100,
      decoration: BoxDecoration(color: Colors.purple, border: Border.all()),
      child: Text("Olá, Flutter!", style: TextStyle(fontSize: 20)));
}
