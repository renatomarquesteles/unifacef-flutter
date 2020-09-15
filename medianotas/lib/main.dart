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
  String nome, nota1, nota2;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Média de notas'),
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
      Text('Preencha o Formulário'),
      TextFormField(
        decoration: InputDecoration(hintText: 'Nome do aluno'),
        maxLength: 50,
        onSaved: (String val) {
          nome = val;
        },
      ),
      TextFormField(
        decoration: InputDecoration(hintText: 'Nota P1'),
        keyboardType: TextInputType.phone,
        maxLength: 4,
        onSaved: (String val) {
          nota1 = val;
        },
      ),
      TextFormField(
        decoration: InputDecoration(hintText: 'Nota P2'),
        keyboardType: TextInputType.phone,
        maxLength: 4,
        onSaved: (String val) {
          nota2 = val;
        },
      ),
      SizedBox(height: 15.0),
      RaisedButton(
        onPressed: _sendForm,
        child: Text('Calcular média'),
      )
    ],
  );
}

_sendForm() {
  print($nota1 + $nota2 / 2);
}
