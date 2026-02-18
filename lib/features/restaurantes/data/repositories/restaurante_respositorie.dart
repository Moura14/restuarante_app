import 'package:app_restaurantes/features/restaurantes/data/datasource/restaurante_remote_datasource.dart';
import 'package:app_restaurantes/features/restaurantes/data/models/restaurante_model.dart';

abstract class RestauranteRespositorie {
  Future<List<RestaurantModel>> getRestaurante();
  Future<List<RestaurantModel>> getRestauranteById({required int id});
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
}


