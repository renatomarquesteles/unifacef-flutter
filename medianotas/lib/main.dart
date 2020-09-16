import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MeuApp());

class MeuApp extends StatefulWidget {
  @override
  MeuFormulario createState() {
    return MeuFormulario();
  }
}

class MeuFormulario extends State<MeuApp> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(title: new Text("Exemplo de Formulário")),
            body: SingleChildScrollView(
                child: Container(
              margin: new EdgeInsets.all(15.0),
              child: Form(
                  key: _formKey,
                  child: MeuFormularioUI(_scaffoldKey, _formKey)),
            ))));
  }
}

Widget MeuFormularioUI(var _scaffoldKey, var _formKey) {
  var _nome;
  var _nota1;
  var _nota2;

  return Column(children: [
    Text("Meu Formulário"),
    TextFormField(
        decoration: InputDecoration(labelText: "Nome:"),
        maxLength: 50,
        onSaved: (String val) {
          _nome = val;
        }),
    TextFormField(
        decoration: InputDecoration(labelText: "Nota 1:"),
        maxLength: 3,
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
        onSaved: (String val) {
          _nota1 = double.parse(val);
        }),
    TextFormField(
        decoration: InputDecoration(labelText: "Nota 2:"),
        maxLength: 3,
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
        onSaved: (String val) {
          _nota2 = double.parse(val);
        }),
    RaisedButton(
        child: Text("Calcular"),
        onPressed: () {
          _formKey.currentState.save();

          var media = (_nota1 + _nota2) / 2;
          var situacao = "";
          if (media >= 6) {
            situacao = "aprovado";
          } else {
            situacao = "reprovado";
          }

          _scaffoldKey.currentState.showSnackBar(SnackBar(
              content: Text(
                  "Olá ${_nome}, você foi ${situacao} com média ${media}")));
        })
  ]);
}
