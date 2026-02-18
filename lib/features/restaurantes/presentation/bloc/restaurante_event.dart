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
