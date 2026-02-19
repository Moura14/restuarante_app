import 'package:app_restaurantes/features/restaurantes/data/models/restaurante_model.dart';
import 'package:bloc/bloc.dart';
import 'package:app_restaurantes/features/restaurantes/domain/usecases/restaurante_usecase.dart';
import 'package:app_restaurantes/features/restaurantes/presentation/bloc/restaurante_event.dart';
import 'package:app_restaurantes/features/restaurantes/presentation/bloc/restaurante_state.dart';

class RestauranteBloc extends Bloc<RestauranteEvent, RestauranteState> {
  final RestauranteUseCase useCase;

  RestauranteBloc({required this.useCase}) : super(RestauranteInitial()) {
    on<LoadRestaurantes>(_onLoadRestaurantes);
    on<LoadRestauranteById>(_onLoadRestauranteById);
    on<LoadRestauranteByName>(_onLoadRestauranteByName);
  }

  Future<void> _onLoadRestaurantes(
      LoadRestaurantes event, Emitter<RestauranteState> emit) async {
    emit(RestauranteLoading());
    try {
      final restaurante = await useCase.getRestaurante();
      emit(RestauranteLoaded(restaurante));
    } catch (e) {
      emit(RestauranteError(e.toString()));
    }
  }

  Future<void> _onLoadRestauranteById(
      LoadRestauranteById event, Emitter<RestauranteState> emit) async {
    emit(RestauranteLoading());
    try {
      final restaurante = await useCase.getRestauranteById(id: event.id);
      emit(RestaurantLoadedById(restaurante));
    } catch (e) {
      emit(RestauranteError(e.toString()));
    }
  
      }
    
    Future<void> _onLoadRestauranteByName(
        LoadRestauranteByName event, Emitter<RestauranteState> emit) async {
      emit(RestauranteLoading());
      try {
        final restaurante = await useCase.getRestauranteByName(name: event.name);
        emit(RestauranteLoaded(restaurante));
      } catch (e) {
        emit(RestauranteError(e.toString()));
      }
    }
      
      }