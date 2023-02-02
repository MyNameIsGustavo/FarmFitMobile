import 'package:flutter/material.dart';
import 'package:farmfitmobile/pages/formsScreen.dart';

class loginScreen extends StatelessWidget {
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
            colors: [
              Color.fromARGB(255, 35, 123, 206),
              Color.fromARGB(255, 13, 56, 138),
            ],
          ),
        ),
        padding: EdgeInsets.only(
          top: 60,
          left: 35,
          right: 35,
        ),
        child: ListView(
          children: <Widget>[
            Container(
              width: 188,
              height: 252,
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
            Padding(padding: EdgeInsets.all(50)),
            TextField(
              onChanged: (inputEmail) {
                email = inputEmail;
              },
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "Fit@gmail.com",
                prefixIcon: Icon(Icons.mail_outline, color: Colors.white),
                labelText: "Email:",
                labelStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontFamily: 'Inter',
                ),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
              ),
            ),
            Padding(padding: EdgeInsets.all(25)),
            TextField(
              onChanged: (inputSenha) {
                senha = inputSenha;
              },
              obscureText: true,
              decoration: InputDecoration(
                  labelText: "Senha:",
                  hintText: "123",
                  prefixIcon:
                      Icon(Icons.password_outlined, color: Colors.white),
                  labelStyle: TextStyle(
                      fontSize: 18, color: Colors.white, fontFamily: 'Inter'),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white))),
            ),
            Padding(padding: EdgeInsets.all(25)),
            TextButton(
              onPressed: () {
                if (email == "adm" && senha == "adm")
                  Navigator.popAndPushNamed(context, "homescreen");
                else
                  print("Usuário ou senha incorretos.");
              },
              child: Text("Login",
                  style: TextStyle(color: Colors.white, fontSize: 18)),
              style: TextButton.styleFrom(
                fixedSize: Size(200, 50),
                backgroundColor: Color.fromARGB(255, 0, 183, 255),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(
              top: 25,
            )),
            
          ],
        ),
      ),
    );
  }
}
