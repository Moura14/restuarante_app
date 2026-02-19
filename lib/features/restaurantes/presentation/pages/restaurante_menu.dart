import 'package:app_restaurantes/features/restaurantes/presentation/bloc/restaurante_bloc.dart';
import 'package:app_restaurantes/features/restaurantes/presentation/bloc/restaurante_event.dart';
import 'package:app_restaurantes/features/restaurantes/presentation/bloc/restaurante_state.dart';
import 'package:app_restaurantes/features/restaurantes/presentation/widgets/menu_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key, required this.id});

  final int id;

  @override
  State<MenuPage> createState() => _MenuPageState();

 
}

class _MenuPageState extends State<MenuPage> {

  @override
  void initState() {
    super.initState();
    context.read<RestauranteBloc>().add( LoadRestauranteMenu(widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cardápio do Restaurante'),
        centerTitle: true,
      ),
      body: BlocBuilder<RestauranteBloc, RestauranteState>(
        builder: (context, state) {
          if(state is RestauranteLoading){
            return const Center(child: CircularProgressIndicator());
          }
          if(state is RestauranteError){
            return Center(child: Text(state.message));
          }
          if (state is RestaurantMenuLoaded) {
            return ListView.builder(
              itemCount: state.menu.length,
              itemBuilder: (context, index){
                return MenuCardWidget(
                  image: state.menu[index].imageUrl,
                  name: state.menu[index].itemName,
                  description: state.menu[index].itemDescription,
                  price: state.menu[index].itemPrice.toString(),
                );
              });
  }         return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

}