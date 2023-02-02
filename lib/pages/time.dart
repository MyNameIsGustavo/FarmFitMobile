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
            "Nosso time!",
            style: TextStyle(
                fontSize: 25,
                fontFamily: 'Inter',
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
        Padding(padding: EdgeInsets.all(10)),
        Center(
          child: Container(
            height: 220,
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
                icon: Icons.analytics_outlined,
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
