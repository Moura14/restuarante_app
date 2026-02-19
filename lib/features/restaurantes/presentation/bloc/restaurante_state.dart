import 'package:app_restaurantes/features/restaurantes/data/models/restaurante_menu_model.dart';
import 'package:equatable/equatable.dart';
import 'package:app_restaurantes/features/restaurantes/data/models/restaurante_model.dart';

abstract class RestauranteState extends Equatable {
  const RestauranteState();

  @override
  List<Object?> get props => [];
}

class RestauranteInitial extends RestauranteState {}

class RestauranteLoading extends RestauranteState {}

class RestauranteLoaded extends RestauranteState {
  final List<RestaurantModel> restaurante;

  const RestauranteLoaded(this.restaurante);

  @override
  List<Object?> get props => [restaurante];
}

class RestaurantLoadedById extends RestauranteState {
  final List<RestaurantModel> restaurante;

  const RestaurantLoadedById(this.restaurante);

  @override
  List<Object?> get props => [restaurante];
}

class RestaurantMenuLoaded extends RestauranteState {
  final List<RestauranteMenuModel> menu;

  const RestaurantMenuLoaded(this.menu);

  @override
  List<Object?> get props => [menu];
}

class RestauranteError extends RestauranteState {
  final String message;

  const RestauranteError(this.message);

  @override
  List<Object?> get props => [message];
}
