import 'dart:ui';
import 'package:farmfitmobile/pages/contants.dart';
import 'package:farmfitmobile/pages/proximas_temperaturas.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter/material.dart';

class homescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return appbar();
  }
}

class conteudopagina1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(padding: EdgeInsets.all(10)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Seja bem vindo, ",
                style: TextStyle(
                    fontSize: 19, fontFamily: 'Inter', color: Colors.white),
              ),
            ),
            Padding(padding: EdgeInsets.all(1)),
            Text(
              "Agricultor!",
              style: TextStyle(
                  fontSize: 19,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
        Padding(padding: EdgeInsets.all(5)),
        Container(
          height: 120,
          width: 170,
          decoration: BoxDecoration(
            color: Color(0xFF64B0FD),
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage("images/logoFarmFit.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(padding: EdgeInsets.all(10)),
        Container(
          width: 320,
          child: Text(
            "   O nosso projeto tem como propósito ajudar os pequenos agricultores, através da capitação da água de chuva e automatizar a irrigação conforme a humidade do solo de suas plantações. Através disso, o agricultor poderá observar diversos tipos de dados neste aplicativo, como a humidade do solo de sua plantação e clima da região.",
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 19,
              fontFamily: 'Inter',
              color: Colors.white,
            ),
          ),
        ),
        Container(
          height: 220,
          width: 350,
          margin: EdgeInsets.symmetric(
              horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage("images/maquete.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}

class appbar extends StatefulWidget {
  @override
  State<appbar> createState() => _appbarState();
}

class _appbarState extends State<appbar> {
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
          ),
        ),
      ),
      backgroundColor: Color(0xFF035AA6),
      body: conteudopagina1(),
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
