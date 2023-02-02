import 'dart:ui';
import 'package:farmfitmobile/pages/contants.dart';
import 'package:farmfitmobile/pages/proximas_temperaturas.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter/material.dart';

class homescreentime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return appbartime();
  }
}

class conteudotime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(padding: EdgeInsets.all(10)),
        Container(
          child: Text(
            "Equipe de desenvolvedores.",
            style: TextStyle(
                fontSize: 25,
                fontFamily: 'Inter',
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
       
        Center(
          child: Container(
            height: 200,
            width: 350,
            margin: EdgeInsets.symmetric(
                horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage("images/nossotime.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      
        Container(
          child: Text(
            "Agradecimentos.",
            style: TextStyle(
                fontSize: 25,
                fontFamily: 'Inter',
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
        Container(
          width: 320,
          child: Text(
            "   Primeiramente, gostaríamos de parabenizar todos os professores, instrutores e profissionais do FIT, que sempre nos auxiliaram, repassaram diversos conhecimentos na área de tecnologia e o principal, nos deram sede de aprendizado. Nestas quatro semanas, aprendemos sobre tecnologias, como o Flutter, um framework maravilhoso, que foi utilizado para realizar este aplicativo. Também, estudamos sobre cloud e IoT, onde aplicamos ambos em nosso projeto, sendo assim uma incrível experiência que levaremos para nossas vidas.",
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 19,
              fontFamily: 'Inter',
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

class appbartime extends StatefulWidget {
  @override
  State<appbartime> createState() => _appbartimeState();
}

class _appbartimeState extends State<appbartime> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: GNav(
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.grey,
            gap: 8,
            padding: EdgeInsets.all(16),
            tabs: [
              GButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, "homescreen");
                },
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                active: true,
                onPressed: () {
                  Navigator.popAndPushNamed(context, "painel");
                },
                icon: Icons.analytics,
                text: 'Painel',
              ),
              GButton(
                icon: Icons.group,
                text: 'Time',
                onPressed: () {
                  Navigator.popAndPushNamed(context, "time");
                },
              ),
            ],
            selectedIndex: 2,
          ),
        ),
      ),
      backgroundColor: Color(0xFF035AA6),
      body: conteudotime(),
      appBar: AppBar(
        elevation: 0,
        title: Center(
          child: Text(
            "FarmFit.",
            style: TextStyle(fontSize: 25),
          ),
        ),
        backgroundColor: Colors.black,
      ),
    );
  }
}
