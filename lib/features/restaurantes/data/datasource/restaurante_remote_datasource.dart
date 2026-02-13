import 'dart:io';
import 'dart:convert';

import 'package:app_restaurantes/features/restaurantes/data/models/restaurante_model.dart';
import 'package:http/http.dart' as http;

class RestauranteRemoteDatasource {


  final http.Client client;

  RestauranteRemoteDatasource({required this.client});


  Future<List<RestaurantModel>> getRestaurante() async {
    try {
      final response = await client
          .get(
            Uri.parse('https://fakerestaurantapi.runasp.net/api/Restaurant'),
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
          )
          .timeout(
            const Duration(seconds: 30),
            onTimeout: () => throw HttpException('Timeout na requisição'),
          );

      print('Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);
        if (jsonList.isNotEmpty) {
          return jsonList.map((json) => RestaurantModel.fromJson(json)).toList();
        } else {
          throw HttpException('Nenhum restaurante encontrado');
        }
      } else {
        throw HttpException('Erro na requisição: ${response.statusCode}');
      }
    } on HttpException {
      rethrow;
    } catch (e) {
      throw HttpException('Erro na requisição: $e');
    }
  }



}