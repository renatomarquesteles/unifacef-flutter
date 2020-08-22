import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Desenvolvimento Mobile II"),
        ),
        body: lista(),
      ),
    );
  }
}

Widget lista() {
  return Container(
      margin: EdgeInsets.all(20),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [unifacef(), curso(), nome(), nascimento(), email()]));
}

Widget unifacef() {
  return Container(
    alignment: Alignment.center,
    decoration: BoxDecoration(color: Colors.blue[900], border: Border.all()),
    child: Text("Uni-FACEF",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 30, color: Colors.white)),
  );
}

Widget curso() {
  return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(border: Border.all()),
      child: Text(
        "Sistemas de Informação/Engenharia de Software",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20),
      ));
}

Widget nome() {
  return Container(
      margin: EdgeInsets.only(top: 20),
      child: Text("Renato Marques Teles",
          textAlign: TextAlign.left, style: TextStyle(fontSize: 16)));
}

Widget nascimento() {
  return Align(
      alignment: Alignment.centerRight,
      child: Text("26/12/1995",
          textAlign: TextAlign.right, style: TextStyle(fontSize: 16)));
}

Widget email() {
  return Align(
      alignment: Alignment.center,
      child:
          Text("renatomarquesteles@gmail.com", style: TextStyle(fontSize: 12)));
}
