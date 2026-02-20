import 'package:app_restaurantes/features/restaurantes/presentation/bloc/restaurante_bloc.dart';
import 'package:app_restaurantes/features/restaurantes/presentation/bloc/restaurante_event.dart';
import 'package:app_restaurantes/features/restaurantes/presentation/bloc/restaurante_state.dart';
import 'package:app_restaurantes/features/restaurantes/presentation/pages/restaurante_detalhe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_restaurantes/main.dart';

class RestaurantListPage extends StatefulWidget {
   RestaurantListPage({super.key});

  

  @override
  State<RestaurantListPage> createState() => _RestaurantListPageState();
}

class _RestaurantListPageState extends State<RestaurantListPage> with RouteAware {

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    print('Iniciando RestaurantListPage');
    // Load is already done in main.dart
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    MyApp.routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void dispose() {
    MyApp.routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPopNext() {
    // Called when the route above this one is popped, i.e., when coming back
    super.didPopNext();
    // Reload the restaurants to refresh the list
    context.read<RestauranteBloc>().add(const LoadRestaurantes());
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
             Expanded(
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Pesquisar por nome ou categoria',
                  prefixIcon: const Icon(Icons.search),
                  contentPadding: const EdgeInsets.only(top: 12, bottom: 12, left: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                onChanged: (value) {
                  print('Valor digitado: $value');
                  if (value.isEmpty) {
                    context.read<RestauranteBloc>().add(const LoadRestaurantes());
                  } else {
                    context.read<RestauranteBloc>().add(LoadRestauranteByName(value));
                  }
                
                },
              ),
             )
          ],
        ),
    ),
    body: BlocBuilder<RestauranteBloc, RestauranteState>(
        builder: (context, state) {
          if (state is RestauranteLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is RestauranteError) {
            return Center(child: Text(state.message));
          }
          if (state is RestauranteLoaded) {
            return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: state.restaurante.length,
            itemBuilder: (context, index) {
              final restaurant = state.restaurante[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 16),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(16), 
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RestaurantDetailsPage(
                          id: restaurant.restaurantID,
                        ),
                      ),
                    );
                  },
            
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /// NOME
                              Text(
                                restaurant.restaurantName,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
            
                              const SizedBox(height: 6),
            
                              /// CATEGORIA
                              Text(
                                restaurant.address,
                                style: TextStyle(color: Colors.grey[600]),
                              ),
            
                              const SizedBox(height: 10),
            
                              /// RATING + ENTREGA
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on,
                                    color: Colors.green,
                                    size: 18,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(restaurant.type.toString()),
            
                                  const SizedBox(width: 16),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
                        );
          }
          return const Center(child: Text("Nenhum restaurante encontrado"));
        },
      )
    );
  }
}
