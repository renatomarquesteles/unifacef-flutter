import 'package:flutter/material.dart';

void main() {runApp(MaterialApp(
	title: 'Navegação Básica',
	 theme: ThemeData(
	   primarySwatch: Colors.red
         ),
         home: Login(),
      )
    );
}



class Login extends StatefulWidget {
  @override
  FormularioLogin createState() {
    return FormularioLogin();
  }
}

class FormularioLogin extends State<Login> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String email = "";
  String senha = "";
  var contexto;
  
  @override
  Widget build(BuildContext context) {
    contexto = context;
    return MaterialApp(
        home: Scaffold(
            key: scaffoldKey,
            appBar: AppBar(title: new Text("Login")),
            body: SingleChildScrollView(
                child: Container(
              margin: new EdgeInsets.all(15.0),
              child: Form(
                  key: formKey,
                  child: FormularioLoginUI(this)),
            ))));
  }
}

Widget FormularioLoginUI(var meuFormulario) {


  return Column(children: [
    Text("Sistema de Navegação Flutter"),
    TextFormField(
        decoration: InputDecoration(labelText: "E-mail:"),
        onSaved: (String val) {
          meuFormulario.setState(() {
            meuFormulario.email = val;
          });
        }),
    TextFormField(
        decoration: InputDecoration(labelText: "Senha:"),
        onSaved: (String val) {
           meuFormulario.setState(() {
            meuFormulario.senha = val;
          });
        }),
    RaisedButton(
        child: Text("Calcular"),
        onPressed: () {
          meuFormulario.formKey.currentState.save();

          
          
          if (meuFormulario.email == "admin@gmail.com" && 
             meuFormulario.senha == "123") {
            
            Navigator.push(
              meuFormulario.contexto,
MaterialPageRoute(builder: (context) => Menu())); 
            
            
          } else {
              meuFormulario.scaffoldKey.currentState.showSnackBar(SnackBar(
              content: Text(
                  "Usuário ou senha inválidos")));
          }
           

        }
      )
  ]);
}











class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Menu'),),
      body: Center(
        child: RaisedButton(
          child: Text('Abrir rota(tela)'),
          onPressed: () {
            Navigator.push(
              context,
MaterialPageRoute(builder: (context) => SegundaRota()),
            );
          },        ),       ),     );   }   }



class SegundaRota extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Segunda Rota (tela)"),),
      body: Center(
        child: RaisedButton(
          onPressed: () { 
            Navigator.pop(context);
          },
          child: Text('Retornar !'),
        ),
      ),
    );
  }
}

