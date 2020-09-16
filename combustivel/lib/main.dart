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
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int distancia;
  double precoEtanol;
  double precoGasolina;
  double gastoEtanol = 0;
  double gastoGasolina = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(title: new Text("Exemplo de Formulário")),
        body: SingleChildScrollView(
          child: Container(
            margin: new EdgeInsets.all(15.0),
            child: Form(key: formKey, child: meuFormularioUI(this)),
          ),
        ),
      ),
    );
  }
}

Widget meuFormularioUI(var meuFormulario) {
  return Column(children: [
    Text("Gastos com Combustível"),
    TextFormField(
        decoration: InputDecoration(labelText: "Distância (km):"),
        maxLength: 3,
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
        onSaved: (String val) {
          meuFormulario.setState(() {
            meuFormulario.distancia = int.parse(val);
          });
        }),
    TextFormField(
        decoration: InputDecoration(labelText: "Preço Etanol:"),
        maxLength: 4,
        keyboardType: TextInputType.number,
        onSaved: (String val) {
          meuFormulario.setState(() {
            meuFormulario.precoEtanol = double.parse(val);
          });
        }),
    TextFormField(
        decoration: InputDecoration(labelText: "Preço Gasolina:"),
        maxLength: 4,
        keyboardType: TextInputType.number,
        onSaved: (String val) {
          meuFormulario.setState(() {
            meuFormulario.precoGasolina = double.parse(val);
          });
        }),
    RaisedButton(
        child: Text("Calcular"),
        onPressed: () {
          meuFormulario.formKey.currentState.save();

          meuFormulario.setState(() {
            meuFormulario.gastoEtanol =
                meuFormulario.distancia / 9 * meuFormulario.precoEtanol;
            meuFormulario.gastoGasolina =
                meuFormulario.distancia / 11 * meuFormulario.precoGasolina;
          });

          meuFormulario.scaffoldKey.currentState.showSnackBar(SnackBar(
              content: Text(
                  "Valor gasto com etanol: R\$${meuFormulario.gastoEtanol.toStringAsFixed(2)}. Valor gasto com gasolina: R\$${meuFormulario.gastoGasolina.toStringAsFixed(2)}")));
        }),
    Text(
        "Valor gasto com Etanol R\$${meuFormulario.gastoEtanol.toStringAsFixed(2)}"),
    Text(
        "Valor gasto com Gasolina R\$${meuFormulario.gastoGasolina.toStringAsFixed(2)}"),
  ]);
}
