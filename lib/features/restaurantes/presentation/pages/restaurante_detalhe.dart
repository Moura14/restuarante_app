
import 'package:app_restaurantes/features/restaurantes/presentation/bloc/restaurante_bloc.dart';
import 'package:app_restaurantes/features/restaurantes/presentation/bloc/restaurante_event.dart';
import 'package:app_restaurantes/features/restaurantes/presentation/bloc/restaurante_state.dart';
import 'package:app_restaurantes/features/restaurantes/presentation/pages/restaurante_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_restaurantes/main.dart';

class RestaurantDetailsPage extends StatefulWidget {
  const RestaurantDetailsPage({super.key, required this.id});

  final int id;


  

  @override
  State<RestaurantDetailsPage> createState() => _RestaurantDetailsPageState();
}

class _RestaurantDetailsPageState extends State<RestaurantDetailsPage> with RouteAware {

  @override
  void initState() {
    super.initState();
    print('ID recebido: ${widget.id}');
    context.read<RestauranteBloc>().add(LoadRestauranteById(widget.id));
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
    // Reload the restaurant details
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
          if(state is RestaurantLoadedById){
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
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MenuPage(id: restaurant.restaurantID),
                            ),
                          );
                        }, 
                        label: Text('Ver Cardápio', style: const TextStyle(color: Colors.white)),
                        icon: Icon(Icons.menu_book, color: Colors.white),
                )]),
            )],
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

