import 'package:flutter/material.dart';

void main() => runApp(MeuApp());

class MeuApp extends StatefulWidget {
  @override
  MeuFormulario createState() {
    return MeuFormulario();
  }
}

class MeuFormulario extends State<MeuApp> {
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Exemplo de formulário'),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(15),
            child: Form(
              key: _formkey,
              child: meuFormularioUI(),
            ),
          ),
        ),
      ),
    );
  }
}

Widget meuFormularioUI() {
  return Column(
    children: [
      Text('Meu formulário'),
      TextFormField(
        decoration: InputDecoration(hintText: 'Nome'),
        maxLength: 50,
      )
    ],
  );
}
