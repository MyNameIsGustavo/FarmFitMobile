import 'package:farmfitmobile/pages/formsScreen.dart';
import 'package:farmfitmobile/pages/homescreen.dart';
import 'package:farmfitmobile/pages/painel.dart';
import 'package:farmfitmobile/pages/painelhumidade.dart';
import 'package:farmfitmobile/pages/time.dart';
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
        "homescreen": (context) => homescreen(),
        "painel": (context) => painel(),
        "painelhumidade": (context) => painelhumidade(),
        "time": (context) => homescreentime(),
      },
    );
  }
}
