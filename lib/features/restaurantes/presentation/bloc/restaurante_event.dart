import 'package:equatable/equatable.dart';

abstract class RestauranteEvent extends Equatable {
  const RestauranteEvent();

  @override
  List<Object?> get props => [];
}

class LoadRestaurantes extends RestauranteEvent {
  const LoadRestaurantes();
}

class LoadRestauranteById extends RestauranteEvent {
  final int id;

  const LoadRestauranteById(this.id);

  @override
  List<Object?> get props => [id];
}

class LoadRestauranteByName extends RestauranteEvent {
  final String name;

  const LoadRestauranteByName(this.name);

  @override
  List<Object?> get props => [name];
}

class LoadRestauranteMenu extends RestauranteEvent {
  final int id;

  const LoadRestauranteMenu(this.id);

  @override
  List<Object?> get props => [id];
}
