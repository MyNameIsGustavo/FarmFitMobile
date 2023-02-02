import 'dart:convert';

import 'package:farmfitmobile/pages/contants.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:intl/intl.dart';
import 'package:farmfitmobile/pages/proximas_temperaturas.dart';
import 'package:farmfitmobile/services/previsao_service.dart';
import 'package:farmfitmobile/models/previsao_hora.dart';
import 'package:flutter/foundation.dart';
import 'package:farmfitmobile/pages/painelhumidade.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

String temperature = "temp";

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
        cabecalho(),
        Padding(padding: EdgeInsets.all(10)),
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

Future<void> getWeather() async {
  try {
    final uri = Uri.parse(
        "http://api.openweathermap.org/data/2.5/weather?q=Sorocaba&units=metric&appid=410e55f7cd4e665ba787426f0022ea6d");
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      temperature = data["main"]["temp"].toString();
      print("A temperatura em Sorocaba é de $temperature graus Celsius.");
    } else {
      print("Erro ao obter dados do clima");
    }
  } catch (e) {
    print("Erro ao fazer a requisição: $e");
  }
 

}




int? test = 0;

class cabecalho extends StatefulWidget {
  int? selecionado = 0;
  cabecalho({this.selecionado});
  @override
  State<cabecalho> createState() => _cabecalhoState();
}

class _cabecalhoState extends State<cabecalho> {
  int? selectedCategory = 0;

  List<String> categories = ["Clima", "Umidade do solo"];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 60,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => buildCategory(index, context),
        ),
      ),
    );
  }

  Padding buildCategory(int index, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: GestureDetector(
        onTap: (() {
          setState(() {
            selectedCategory = index;
            if (selectedCategory == 1) {
              selectedCategory = 1;
              
                Navigator.popAndPushNamed(context, "painelhumidade");
             
            } else if (selectedCategory == 2) {
              Navigator.popAndPushNamed(context, "/");
            } else {
              Navigator.popAndPushNamed(context, "painel");
            }
          });
        }),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              categories[index],
              style: Theme.of(context).textTheme.headline5?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: index == selectedCategory
                        ? kTextColor
                        : Colors.black.withOpacity(0.4),
                  ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
              height: 6,
              width: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: index == selectedCategory
                    ? kSecondaryColor
                    : Colors.transparent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class dados extends StatefulWidget {
  const dados({Key? key}) : super(key: key);
  @override
  State<dados> createState() => _dadosState();
}

class _dadosState extends State<dados> {
  late List<PrevisaoHora> ultimasPrevisoes;
  @override
  void initState() {
    super.initState();
    PrevisaoService service = PrevisaoService();
    ultimasPrevisoes = service.recuperarUltimasPrevisoes();
    getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(padding: EdgeInsets.all(20)),
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
          Padding(padding: EdgeInsets.all(10)),
          Text(
            "A temperatura atual de Sorocaba é de:",
            style: TextStyle(
              fontSize: 19,
              fontFamily: 'Inter',
              color: Colors.black,
            ),
          ),
          Container(
            height: 40,
            width: 100,
            child: Center(
              child: Text(
                "$temperature ºC",
                style: TextStyle(
                  fontSize: 19,
                  fontFamily: 'Inter',
                  color: Colors.black,
                ),
              ),
            ),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          ),
          Container(child: ProximasTemperaturas(previsoes: ultimasPrevisoes)),
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
            selectedIndex: 1,
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
