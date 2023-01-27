import 'package:farmfitmobile/pages/formsScreen.dart';
import 'package:flutter/material.dart';
import 'package:farmfitmobile/pages/loginScreen.dart';
import 'package:farmfitmobile/pages/formsScreen.dart';

void main() {
  runApp(
    Aplicativo(),
  );
}

class Aplicativo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => loginScreen(),
        "formulario": (context) => formulario(),
      },
    );
  }
}
