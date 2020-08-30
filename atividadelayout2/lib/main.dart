import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Construindo layouts"),
        ),
        body: layout(),
      ),
    );
  }
}

Widget layout() {
  return Column(
    children: [
      icons(),
      Expanded(flex: 5, child: logo()),
      Expanded(flex: 5, child: content()),
    ],
  );
}

Widget icons() {
  return Row(
    children: [
      Expanded(child: Icon(Icons.home)),
      Expanded(child: Icon(Icons.access_time)),
      Expanded(child: Icon(Icons.account_balance)),
      Expanded(child: Icon(Icons.add_a_photo)),
    ],
  );
}

Widget logo() {
  return Container(
    child: Image.network(
      'https://i.imgur.com/3dLXpS6.png',
      width: 300,
    ),
  );
}

Widget content() {
  return Container(
    padding: EdgeInsets.all(10),
    color: Colors.blue,
    child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text('Exemplo de Layout Flutter',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
      Align(
          alignment: Alignment.bottomRight,
          child: Text(
            'Desenvolvidor por Renato Marques',
            style:
                TextStyle(color: Colors.red[900], fontWeight: FontWeight.bold),
          )),
    ]),
  );
}
