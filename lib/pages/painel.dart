import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:intl/intl.dart';

class painel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return appbar();
  }
}

class conteudopainel extends StatelessWidget {
  String cdate1 = DateFormat("EEEEE, dd, yyyy").format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(padding: EdgeInsets.all(40)),
        Expanded(
          child: Stack(
            children: [
              SizedBox(
                height: 670,
                width: double.infinity,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(30)),
              SizedBox(
                height: 41,
                width: double.infinity,
                child: Container(
                  child: Center(
                    child: Text(
                      cdate1,
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontFamily: 'Inter',
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                ),
              ),
              
              dados(),
            ],
          ),
        ),
      ],
    );
  }
}
class dados extends StatefulWidget {
  @override
  State<dados> createState() => _dadosState();
}

class _dadosState extends State<dados> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(padding: EdgeInsets.all(25)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.cloud_circle,
                size: 70,
              ),
              Text(
                "Clima",
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                  fontFamily: 'Inter',
                ),
              ),
            ],
          ),
          Container(
            child: Icon(Icons.cloudy_snowing),
          ),
          Container(),
        ],
      ),
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
                onPressed: () {
                  Navigator.popAndPushNamed(context, "painel");
                },
                icon: Icons.charging_station,
                text: 'Painel',
              ),
              GButton(
                icon: Icons.charging_station,
                text: 'Painel',
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Color(0xFF035AA6),
      body: conteudopainel(),
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
