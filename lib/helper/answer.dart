import 'package:tareaapi/domain/entities/respuesta.dart';
import 'package:dio/dio.dart';

class ApiAnswer{
  final String url = "https://fakestoreapi.com/products";
  final _dio = Dio();

  Future<Respuesta> getRespuesta() async{
    final response = await _dio.get(url);
    final respuestaApi = Respuesta.fromJson(response.data);
    return respuestaApi;
  }
}