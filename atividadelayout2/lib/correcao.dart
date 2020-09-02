import 'package:flutter/material.dart';

void main() => runApp(MeuApp());

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Exemplo de layout")),
        body: body(),
      ),
    );
  }
}

Widget body() {
  return Column(
    children: [
      icones(),
      Expanded(child: imagem()),
      Expanded(child: exemplo()),
      desenvolvedor(),
    ],
  );
}

Widget icones() {
  return Row(
    children: [
      Expanded(child: Icon(Icons.home)),
      Expanded(child: Icon(Icons.access_time)),
      Expanded(child: Icon(Icons.account_balance)),
      Expanded(child: Icon(Icons.add_a_photo)),
    ],
  );
}

Widget imagem() {
  return Container(
    child: Image(
      image: AssetImage('assets/unifacef.png'),
    ),
  );
}

Widget exemplo() {
  return Container(
    child: Text(
      'Exemplo de Layout Flutter',
      style: TextStyle(fontSize: 40),
      textAlign: TextAlign.center,
    ),
    decoration: BoxDecoration(color: Colors.blue),
    alignment: Alignment.topCenter,
  );
}

Widget desenvolvedor() {
  return Container(
    alignment: Alignment.bottomRight,
    child: Text(
      'Desenvolvido por Renato',
      style: TextStyle(color: Colors.red, fontSize: 16),
    ),
  );
}
