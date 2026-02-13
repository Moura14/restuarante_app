import 'package:app_restaurantes/features/restaurantes/presentation/bloc/restaurante_bloc.dart';
import 'package:app_restaurantes/features/restaurantes/presentation/bloc/restaurante_event.dart';
import 'package:app_restaurantes/features/restaurantes/presentation/pages/restaurantes_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/restaurantes/data/datasource/restaurante_remote_datasource.dart';
import 'features/restaurantes/data/repositories/restaurante_respositorie.dart';
import 'features/restaurantes/domain/usecases/restaurante_usecase.dart';
import 'features/restaurantes/presentation/bloc/restaurante_bloc.dart';
import 'features/restaurantes/presentation/bloc/restaurante_event.dart';
import 'features/restaurantes/presentation/pages/restaurantes_page.dart';

void main() {
  final client = http.Client();
  final remoteDatasource = RestauranteRemoteDatasource(client: client);
  final repository = RestauranteRespositorieImpl(
    remoteDatasource: remoteDatasource,
  );
  final useCase = RestauranteUseCase(repository: repository);

  runApp(MyApp(useCase: useCase));
}

class MyApp extends StatelessWidget {
  final RestauranteUseCase useCase;
  const MyApp({super.key, required this.useCase});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          RestauranteBloc(useCase: useCase)..add(const LoadRestaurantes()),
      child: MaterialApp(title: 'Restaurantes', home: RestaurantListPage()),
    );
  }
}


