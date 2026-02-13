import 'package:app_restaurantes/features/restaurantes/data/models/restaurante_model.dart';
import 'package:bloc/bloc.dart';
import 'package:app_restaurantes/features/restaurantes/domain/usecases/restaurante_usecase.dart';
import 'package:app_restaurantes/features/restaurantes/presentation/bloc/restaurante_event.dart';
import 'package:app_restaurantes/features/restaurantes/presentation/bloc/restaurante_state.dart';

class RestauranteBloc extends Bloc<RestauranteEvent, RestauranteState> {
  final RestauranteUseCase useCase;

  RestauranteBloc({required this.useCase}) : super(RestauranteInitial()) {
    on<LoadRestaurantes>(_onLoadRestaurantes);
  }

  Future<void> _onLoadRestaurantes(
      LoadRestaurantes event, Emitter<RestauranteState> emit) async {
    emit(RestauranteLoading());
    try {
      final restaurantes = await useCase.getRestaurante();
      emit(RestauranteLoaded(restaurantes));
    } catch (e) {
      emit(RestauranteError(e.toString()));
    }
  }
}