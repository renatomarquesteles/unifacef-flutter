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
  String nome;
  String cpf;
  double salario;
  double decimoTerceiro;
  double impostoRetidoSalario;
  double impostoRetidoDecimoTerceiro;
  double totalImposto = 0;
  double totalRetido = 0;
  double valorAPagar = 0;
  String mensagem = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(title: new Text("Calcular Imposto de Renda")),
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
    Image.network(
      'https://i.imgur.com/hQuJdP3.jpg',
      width: 300,
    ),
    TextFormField(
        decoration: InputDecoration(labelText: "Nome:"),
        maxLength: 50,
        onSaved: (String val) {
          meuFormulario.setState(() {
            meuFormulario.nome = val;
          });
        }),
    TextFormField(
        decoration: InputDecoration(labelText: "CPF:"),
        maxLength: 14,
        onSaved: (String val) {
          meuFormulario.setState(() {
            meuFormulario.cpf = val;
          });
        }),
    TextFormField(
        decoration: InputDecoration(labelText: "Salário mensal (R\$):"),
        maxLength: 7,
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
        onSaved: (String val) {
          meuFormulario.setState(() {
            meuFormulario.salario = double.parse(val);
          });
        }),
    TextFormField(
        decoration: InputDecoration(labelText: "Valor 13º (R\$):"),
        maxLength: 7,
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
        onSaved: (String val) {
          meuFormulario.setState(() {
            meuFormulario.decimoTerceiro = double.parse(val);
          });
        }),
    TextFormField(
        decoration: InputDecoration(
            labelText: "Imposto total retido no salário mensal (R\$):"),
        maxLength: 7,
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
        onSaved: (String val) {
          meuFormulario.setState(() {
            meuFormulario.impostoRetidoSalario = double.parse(val);
          });
        }),
    TextFormField(
        decoration: InputDecoration(labelText: "Imposto retido no 13º (R\$):"),
        maxLength: 7,
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
        onSaved: (String val) {
          meuFormulario.setState(() {
            meuFormulario.impostoRetidoDecimoTerceiro = double.parse(val);
          });
        }),
    RaisedButton(
        child: Text("Calcular"),
        onPressed: () {
          meuFormulario.formKey.currentState.save();

          var rendaAnual =
              (meuFormulario.salario * 12) + meuFormulario.decimoTerceiro;

          if (rendaAnual > 55976.16) {
            meuFormulario.setState(() {
              meuFormulario.totalImposto = rendaAnual * 0.275;
            });
          } else if (rendaAnual > 45012.61) {
            meuFormulario.setState(() {
              meuFormulario.totalImposto = rendaAnual * 0.225;
            });
          } else if (rendaAnual > 33919.81) {
            meuFormulario.setState(() {
              meuFormulario.totalImposto = rendaAnual * 0.15;
            });
          } else if (rendaAnual > 22847.77) {
            meuFormulario.setState(() {
              meuFormulario.totalImposto = rendaAnual * 0.075;
            });
          } else {
            meuFormulario.totalImposto = 0;
          }

          meuFormulario.setState(() {
            meuFormulario.totalRetido =
                (meuFormulario.impostoRetidoSalario * 12) +
                    meuFormulario.impostoRetidoDecimoTerceiro;
            meuFormulario.valorAPagar =
                meuFormulario.totalImposto - meuFormulario.totalRetido;
          });

          if (meuFormulario.valorAPagar > 0) {
            meuFormulario.setState(() {
              meuFormulario.mensagem =
                  "O cidadão deverá pagar R\$${meuFormulario.valorAPagar.abs().toStringAsFixed(2)}";
            });
          } else {
            meuFormulario.setState(() {
              meuFormulario.mensagem =
                  "O cidadão deverá restituir R\$${meuFormulario.valorAPagar.abs().toStringAsFixed(2)}";
            });
          }

          meuFormulario.scaffoldKey.currentState.showSnackBar(
            SnackBar(
              content: Text("Imposto calculado com sucesso!"),
            ),
          );
        }),
    Text(
        "Valor Total de imposto de renda durante um ano: R\$${meuFormulario.totalImposto.toStringAsFixed(2)}"),
    Text(
        "Valor Total de imposto de renda retido na fonte: R\$${meuFormulario.totalRetido.toStringAsFixed(2)}"),
    Text("${meuFormulario.mensagem}"),
  ]);
}
