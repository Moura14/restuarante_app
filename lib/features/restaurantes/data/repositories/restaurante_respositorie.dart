import 'package:app_restaurantes/features/restaurantes/data/datasource/restaurante_remote_datasource.dart';
import 'package:app_restaurantes/features/restaurantes/data/models/restaurante_model.dart';

abstract class RestauranteRespositorie {
  Future<List<RestaurantModel>> getRestaurante();
  Future<List<RestaurantModel>> getRestauranteById({required int id});
  Future<List<RestaurantModel>> getRestauranteByName({required String name});
}

class RestauranteRespositorieImpl implements RestauranteRespositorie {

  final RestauranteRemoteDatasource remoteDatasource;

  RestauranteRespositorieImpl({required this.remoteDatasource});

  @override
  Future<List<RestaurantModel>> getRestaurante() async {
    return await remoteDatasource.getRestaurante();
  }

  @override
  Future<List<RestaurantModel>> getRestauranteById({required int id}) async {
    return await remoteDatasource.getRestauranteById(id: id);
  }

   @override
  Future<List<RestaurantModel>> getRestauranteByName({required String name}) async {
    return await remoteDatasource.getRestauranteByName(name: name);
  }
}


