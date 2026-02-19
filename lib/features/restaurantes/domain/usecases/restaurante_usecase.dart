
import 'package:app_restaurantes/features/restaurantes/data/models/restaurante_menu_model.dart';
import 'package:app_restaurantes/features/restaurantes/data/repositories/restaurante_respositorie.dart';
import 'package:app_restaurantes/features/restaurantes/data/models/restaurante_model.dart';

class RestauranteUseCase {
  

  final RestauranteRespositorie repository;

  RestauranteUseCase({required this.repository});

  Future<List<RestaurantModel>> getRestaurante() async {
    return await repository.getRestaurante();
  }

  Future<List<RestaurantModel>> getRestauranteById({required int id}) async {
    return await repository.getRestauranteById(id: id);
  }

  Future<List<RestaurantModel>> getRestauranteByName({required String name}) async {
    return await repository.getRestauranteByName(name: name);
  }

  Future<List<RestauranteMenuModel>> getRestauranteMenu({required int id}) async {
    return await repository.getRestauranteMenu(id: id);
  }



}