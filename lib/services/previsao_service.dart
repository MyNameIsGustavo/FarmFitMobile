import 'package:farmfitmobile/models/previsao_hora.dart';

class PrevisaoService {
  List<PrevisaoHora> recuperarUltimasPrevisoes() {
    return [
      PrevisaoHora('15:00', 'Ensolarado', 1, 32),
      PrevisaoHora('08:00', 'Parcialmente nublado', 6, 20),
      PrevisaoHora('11:00', 'quentao', 1, 32),
      PrevisaoHora('11:00', 'quentao', 1, 32),
      PrevisaoHora('11:00', 'quentao', 1, 32),
      PrevisaoHora('11:00', 'quentao', 1, 32),
    ];
  }
}

