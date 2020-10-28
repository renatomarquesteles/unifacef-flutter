import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navegação Básica',
    theme: ThemeData(primarySwatch: Colors.red),
    home: Login(),
  ));
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
              child: Form(key: formKey, child: FormularioLoginUI(this)),
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
        child: Text("Entrar"),
        onPressed: () {
          meuFormulario.formKey.currentState.save();

          if (meuFormulario.email == "admin@gmail.com" &&
              meuFormulario.senha == "123") {
            Navigator.push(meuFormulario.contexto,
                MaterialPageRoute(builder: (context) => Menu()));
          } else {
            meuFormulario.scaffoldKey.currentState.showSnackBar(
                SnackBar(content: Text("Usuário ou senha inválidos")));
          }
        })
  ]);
}

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
      ),
      body: Center(
        child: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text('Quem sou eu?'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuemSouEu()),
                );
              },
            ),
            RaisedButton(
              child: Text('Qual o meu curso?'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Curso()),
                );
              },
            ),
            RaisedButton(
              child: Text('Qual a minha universidade?'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Universidade()),
                );
              },
            ),
          ],
        )),
      ),
    );
  }
}

class QuemSouEu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quem sou eu?"),
      ),
      body: Center(
        child: Column(
          children: [
            Image.network(
                'https://miro.medium.com/max/360/0*1SkS3mSorArvY9kS.jpg'),
            RaisedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Retornar !'),
            ),
          ],
        ),
      ),
    );
  }
}

class Curso extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meu curso"),
      ),
      body: Center(
        child: Column(
          children: [
            Image.network(
                'https://ww2.inf.ufg.br/files/uploads/es/logoesvertical.png'),
            RaisedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Retornar !'),
            ),
          ],
        ),
      ),
    );
  }
}

class Universidade extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Minha Universidade"),
      ),
      body: Center(
        child: Column(
          children: [
            Image.network(
                'https://www.unifacef.com.br/wp-content/uploads/2015/04/Uni_FACEF_MUNICIPAL.png'),
            RaisedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Retornar !'),
            ),
          ],
        ),
      ),
    );
  }
}

