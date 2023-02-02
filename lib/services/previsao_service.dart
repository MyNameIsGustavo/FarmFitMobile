import 'package:farmfitmobile/models/previsao_hora.dart';

class PrevisaoService {
  List<PrevisaoHora> recuperarUltimasPrevisoes() {
    return [
      PrevisaoHora('08:00', 'Parcialmente nublado', 6, 18),
      PrevisaoHora('10:00', 'Nublado', 19, 20),
      PrevisaoHora('15:00', 'Ensolarado', 1, 27),
      PrevisaoHora('16:00', 'Chuvoso', 12, 20),
    ];
  }
}

