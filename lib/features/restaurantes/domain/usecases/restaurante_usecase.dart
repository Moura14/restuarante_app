
import 'package:app_restaurantes/features/restaurantes/data/repositories/restaurante_respositorie.dart';
import 'package:app_restaurantes/features/restaurantes/data/models/restaurante_model.dart';

class RestauranteUseCase {
  

  final RestauranteRespositorie repository;

  RestauranteUseCase({required this.repository});

  Future<List<RestaurantModel>> getRestaurante() async {
    return await repository.getRestaurante();
  }

}