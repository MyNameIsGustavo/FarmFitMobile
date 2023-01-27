import 'dart:ui';

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
          TextField(
            onChanged: (inputNome) {
              nome = inputNome;
            },
            obscureText: true,
            decoration: InputDecoration(
                labelText: "Digite o seu nome: ",
                hintText: "Cristiano",
                labelStyle: TextStyle(
                    fontSize: 18, color: Colors.white, fontFamily: 'Inter'),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder()),
          ),
          TextField(
            onChanged: (inputSobrenome) {
              sobrenome = inputSobrenome;
            },
            obscureText: true,
            decoration: InputDecoration(
                labelText: "Digite o seu sobrenome: ",
                hintText: "Cristiano Silva",
                labelStyle: TextStyle(
                    fontSize: 18, color: Colors.white, fontFamily: 'Inter'),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder()),
          ),
          TextField(
            onChanged: (inputSobrenome) {
              sobrenome = inputSobrenome;
            },
            obscureText: true,
            decoration: InputDecoration(
                labelText: "Digite o seu CPF: ",
                hintText: "000.000.000-00",
                labelStyle: TextStyle(
                    fontSize: 18, color: Colors.white, fontFamily: 'Inter'),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder()),
          ),
          TextField(
            onChanged: (inputSobrenome) {
              sobrenome = inputSobrenome;
            },
            obscureText: true,
            decoration: InputDecoration(
                labelText: "Digite o seu email: ",
                hintText: "cristiano.silva@gmail.com",
                labelStyle: TextStyle(
                    fontSize: 18, color: Colors.white, fontFamily: 'Inter'),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder()),
          ),
        ],
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          onChanged: (inputNome) {
            nome = inputNome;
          },
          obscureText: true,
          decoration: InputDecoration(
              labelText: "Digite o seu nome: ",
              hintText: "Agricultor Silva",
              labelStyle: TextStyle(
                  fontSize: 18, color: Colors.white, fontFamily: 'Inter'),
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder()),
        )
      ],
    );
  }
}
*/