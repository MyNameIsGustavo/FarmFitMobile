import 'dart:ui';
import 'package:farmfitmobile/pages/loginScreen.dart';
import 'package:flutter/material.dart';

class formulario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: conteudoFormulario(),
    );
  }
}

class conteudoFormulario extends StatefulWidget {
  const conteudoFormulario({super.key});
  @override
  State<conteudoFormulario> createState() => _conteudoFormularioState();
}

class _conteudoFormularioState extends State<conteudoFormulario> {
  String? nome = "";
  String? sobrenome = "";
  String? email = "";
  String? senha = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blue, Color.fromARGB(255, 0, 85, 155)])),
        padding: EdgeInsets.only(
          left: 25,
          right: 25,
        ),
        child: ListView(
          children: <Widget>[
            SizedBox(
              width: 350,
              height: 350,
              child: Image.asset("assets/Cadastramento.png"),
            ),
            Padding(
                padding: EdgeInsets.only(
              bottom: 20,
            )),
            TextField(
              onChanged: (inputNome) {
                email = inputNome;
              },
              decoration: InputDecoration(
                hintText: "Linus",
                prefixIcon:
                    Icon(Icons.assignment_ind_outlined, color: Colors.black),
                labelText: "Nome:",
                labelStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontFamily: 'Inter',
                ),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(
              bottom: 20,
            )),
            TextField(
              onChanged: (inputSobrenome) {
                sobrenome = inputSobrenome;
              },
              decoration: InputDecoration(
                hintText: "Linus Torvald",
                prefixIcon: Icon(Icons.assignment_turned_in_outlined,
                    color: Colors.black),
                labelText: "Sobrenome:",
                labelStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontFamily: 'Inter',
                ),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(
              bottom: 20,
            )),
            TextField(
              onChanged: (inputEmail) {
                email = inputEmail;
              },
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "Fit@gmail.com",
                prefixIcon: Icon(Icons.mail_outline, color: Colors.black),
                labelText: "Email:",
                labelStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontFamily: 'Inter',
                ),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(
              bottom: 20,
            )),
            TextField(
              onChanged: (inputSenha) {
                senha = inputSenha;
              },
              obscureText: true,
              decoration: InputDecoration(
                hintText: "@Cristiano12345",
                prefixIcon: Icon(Icons.password_outlined, color: Colors.black),
                labelText: "Senha:",
                labelStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontFamily: 'Inter',
                ),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(
              bottom: 25,
            )),
            TextButton(
              onPressed: () {},
              child: Text("Cadastrar",
                  style: TextStyle(color: Colors.white, fontSize: 18)),
              style: TextButton.styleFrom(
                fixedSize: Size(200, 33),
                backgroundColor: Color.fromARGB(255, 48, 172, 255),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

/*
class conteudoFormulario extends StatefulWidget {
  const conteudoFormulario({super.key});

  @override
  State<conteudoFormulario> createState() => _conteudoFormularioState();
}

class _conteudoFormularioState extends State<conteudoFormulario> {
  String? nome = "";
  String? sobrenome = "";
  String? cpf = "";
  String? email = "";
  String? senha = "";
  String? validaSenha = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue,
              Color.fromARGB(255, 5, 99, 177),
            ]),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(padding: EdgeInsets.only(left: 20, right: 20)),
          TextField(
            onChanged: (inputNome) {
              nome = inputNome;
            },
            decoration: InputDecoration(
                labelText: "Digite o seu nome: ",
                hintText: "Cristiano",
                labelStyle: TextStyle(
                    fontSize: 18, color: Colors.white, fontFamily: 'Inter'),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder()),
          ),
          Padding(
              padding: EdgeInsets.only(
            bottom: 25,
          )),
          TextField(
            onChanged: (inputSobrenome) {
              sobrenome = inputSobrenome;
            },
            decoration: InputDecoration(
                labelText: "Digite o seu sobrenome: ",
                hintText: "Cristiano Silva",
                labelStyle: TextStyle(
                    fontSize: 18, color: Colors.white, fontFamily: 'Inter'),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder()),
          ),
          Padding(
              padding: EdgeInsets.only(
            bottom: 25,
          )),
          TextField(
            onChanged: (inputcpf) {
              sobrenome = inputcpf;
            },
            decoration: InputDecoration(
                labelText: "Digite o seu CPF: ",
                hintText: "000.000.000-00",
                labelStyle: TextStyle(
                    fontSize: 18, color: Colors.white, fontFamily: 'Inter'),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder()),
          ),
          Padding(
              padding: EdgeInsets.only(
            bottom: 25,
          )),
          TextField(
            onChanged: (inputEmail) {
              email = inputEmail;
            },
            decoration: InputDecoration(
                labelText: "Digite o seu email: ",
                hintText: "cristiano.silva@gmail.com",
                labelStyle: TextStyle(
                    fontSize: 18, color: Colors.white, fontFamily: 'Inter'),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder()),
          ),
          Padding(
              padding: EdgeInsets.only(
            bottom: 25,
          )),
          TextField(
            onChanged: (inputSenha) {
              senha = inputSenha;
            },
            obscureText: true,
            decoration: InputDecoration(
                labelText: "Crie sua senha: ",
                hintText: "@Cristiano123",
                labelStyle: TextStyle(
                    fontSize: 18, color: Colors.white, fontFamily: 'Inter'),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder()),
          ),
          Padding(
              padding: EdgeInsets.only(
            bottom: 25,
          )),
          TextField(
            onChanged: (inputValidaSenha) {
              validaSenha = inputValidaSenha;
            },
            obscureText: true,
            decoration: InputDecoration(
                labelText: "Valide sua senha: ",
                labelStyle: TextStyle(
                    fontSize: 18, color: Colors.white, fontFamily: 'Inter'),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder()),
          ),
          Padding(
              padding: EdgeInsets.only(
            bottom: 20,
          )),
          TextButton(
              onPressed: () {
                if (validaSenha != senha) {
                  print("As senhas não são iguais");
                } else {
                  Navigator.popAndPushNamed(context, "/");
                }
              },
              child: Text("Cadastrar",
                  style: TextStyle(color: Colors.white, fontSize: 18)),
              style: TextButton.styleFrom(
                fixedSize: Size(200, 50),
                backgroundColor: Color.fromARGB(255, 0, 183, 255),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
              ))
        ],
      ),
    );
  }
}
*/
