import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:farmfitmobile/models/previsao_hora.dart';
import 'package:http/http.dart' as http;

class ProximasTemperaturas extends StatelessWidget {
  final List<PrevisaoHora> previsoes;

  const ProximasTemperaturas({super.key, required this.previsoes});

  Card criarCardPrevisao(int i) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage('images/${previsoes[i].numeroIcone}.png')),
          Padding(padding: EdgeInsets.all(2)),
          Text(previsoes[i].horario),
          Padding(padding: EdgeInsets.all(2)),
          Text('${previsoes[i].temperatura.toStringAsFixed(0)} ºC'),
          Padding(padding: EdgeInsets.all(5)),
          Text(previsoes[i].descricao),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: previsoes.length,
        shrinkWrap: true,
        itemBuilder: (context, i) {
          return criarCardPrevisao(i);
        },
      ),
    );
  }
}


