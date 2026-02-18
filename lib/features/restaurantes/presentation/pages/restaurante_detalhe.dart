
import 'package:app_restaurantes/features/restaurantes/presentation/bloc/restaurante_bloc.dart';
import 'package:app_restaurantes/features/restaurantes/presentation/bloc/restaurante_event.dart';
import 'package:app_restaurantes/features/restaurantes/presentation/bloc/restaurante_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RestaurantDetailsPage extends StatefulWidget {
  const RestaurantDetailsPage({super.key, required this.id});

  final int id;


  

  @override
  State<RestaurantDetailsPage> createState() => _RestaurantDetailsPageState();
}

class _RestaurantDetailsPageState extends State<RestaurantDetailsPage> {

  @override
  void initState() {
    super.initState();
    print('ID recebido: ${widget.id}');
    context.read<RestauranteBloc>().add(LoadRestauranteById(widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Restaurante'),
        centerTitle: true,
      ),
      body: BlocBuilder<RestauranteBloc, RestauranteState>(
        builder: (context, state){
          if(state is RestauranteLoading){
            return const Center(child: CircularProgressIndicator());
          }
          if(state is RestauranteError){
            return Center(child: Text(state.message));
          }
          if(state is RestaurantLodadeById){
            if (state.restaurante.isEmpty) {
              return const Center(child: Text('Restaurante não encontrado'));
            }
            final restaurant = state.restaurante.first; // Assuming one restaurant
            return SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// NOME
                       Text(
                        restaurant.restaurantName,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                        
                      const SizedBox(height: 8),
                  
                      Text(
                        'Nome: ${restaurant.restaurantName}',
                        style: TextStyle(fontSize: 16),
                      ),
                        
                      const SizedBox(height: 8),
                        
                      /// ENDEREÇO
                      Text(
                        'Endereço: ${restaurant.address}',
                        style: TextStyle(fontSize: 16),
                      ),
                        
                      const SizedBox(height: 12),
                        
                      /// ESTACIONAMENTO
                      if (restaurant.parkingLot) ...[
                        Row(
                          children: const [
                            Icon(Icons.local_parking, color: Colors.green),
                            SizedBox(width: 6),
                            Text(
                              'Possui estacionamento',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                      ],
            
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
          }
          return const SizedBox.shrink();
        },
      
      ),
    );
  }
}

