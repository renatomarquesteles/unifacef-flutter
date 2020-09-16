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
                child: MeuFormularioUI(_scaffoldKey, _formKey)
              ),
            ))
      )
    );
    
    
  }
}

Widget MeuFormularioUI(var _scaffoldKey, var _formKey) {
  var _nome;
  var _idade;
  
  return Column(children: [
    Text("Meu Formulário"),
    TextFormField(
      decoration: InputDecoration(labelText: "Nome:"),
      maxLength: 50,
      onSaved: (String val) {
        _nome = val;
      }
    ),
    TextFormField(
      decoration: InputDecoration(labelText: "Idade:"),
      maxLength: 3,
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
      onSaved: (String val) {
        _idade = val;
      }
    ),
    RaisedButton(
      child: Text("Calcular"),
      onPressed: () {
         _formKey.currentState.save();
         _scaffoldKey.currentState.showSnackBar(
          SnackBar(
            content: Text("Olá ${_nome}, você tem ${_idade} anos")
          )
        );

      }
    )
  ]);
}
