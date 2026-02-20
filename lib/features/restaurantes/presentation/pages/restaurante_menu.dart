import 'package:app_restaurantes/features/restaurantes/presentation/bloc/restaurante_bloc.dart';
import 'package:app_restaurantes/features/restaurantes/presentation/bloc/restaurante_event.dart';
import 'package:app_restaurantes/features/restaurantes/presentation/bloc/restaurante_state.dart';
import 'package:app_restaurantes/features/restaurantes/presentation/widgets/menu_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_restaurantes/main.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key, required this.id});

  final int id;

  @override
  State<MenuPage> createState() => _MenuPageState();

 
}

class _MenuPageState extends State<MenuPage> with RouteAware {

  @override
  void initState() {
    super.initState();
    context.read<RestauranteBloc>().add( LoadRestauranteMenu(widget.id));
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
    // Reload the menu
    context.read<RestauranteBloc>().add(LoadRestauranteMenu(widget.id));
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