import 'package:app_restaurantes/features/restaurantes/presentation/bloc/restaurante_bloc.dart';
import 'package:app_restaurantes/features/restaurantes/presentation/bloc/restaurante_state.dart';
import 'package:app_restaurantes/features/restaurantes/presentation/pages/restaurante_detalhe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RestaurantListPage extends StatelessWidget {
  const RestaurantListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurantes'),
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
          if(state is RestauranteLoaded){
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
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
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
                              style: TextStyle(
                                color: Colors.grey[600],
                              ),
                            ),
            
                            const SizedBox(height: 10),
            
                            /// RATING + ENTREGA
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 18,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  restaurant.type
                                      .toString(),
                                ),
            
                                const SizedBox(width: 16),
                            
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
          }
           return const Center(child: Text("Nenhum restaurante encontrado"));
      
        },
       
      ),
    );
  }
}
