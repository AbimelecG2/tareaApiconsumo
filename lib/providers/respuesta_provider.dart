import 'package:flutter/material.dart';
import 'package:tareaapi/domain/entities/respuesta.dart';
import 'package:tareaapi/helper/answer.dart';

class RespuestaProvider extends ChangeNotifier {
  final _ApiAnswer = ApiAnswer();
  Respuesta mensaje = Respuesta(
      title: 'Olla', price: '12', image: 'https://...', category: 'Cocina');

  Future<void> loadRespuesta() async {
    await Future.delayed(const Duration(seconds: 10));
    mensaje = await _ApiAnswer.getRespuesta();
    notifyListeners();
  }
}
