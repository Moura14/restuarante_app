import 'package:flutter/material.dart';

class RestaurantDetailsPage extends StatefulWidget {
  const RestaurantDetailsPage({super.key});

  @override
  State<RestaurantDetailsPage> createState() => _RestaurantDetailsPageState();
}

class _RestaurantDetailsPageState extends State<RestaurantDetailsPage> {
  final List<Map<String, dynamic>> restaurants = [
    {
      "name": "Burger House",
      "description": "Os melhores hambúrgueres artesanais da cidade.",
      "address": "Rua A, 123",
      "phone": "(61) 99999-1111",
    },
    {
      "name": "Pizza Prime",
      "description": "Pizza italiana no forno a lenha.",
      "address": "Av. Central, 456",
      "phone": "(61) 98888-2222",
    },
    {
      "name": "Sushi World",
      "description": "Comida japonesa premium.",
      "address": "Rua B, 789",
      "phone": "(61) 97777-3333",
    },
  ];

  Map<String, dynamic>? selectedRestaurant;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalhes do Restaurante"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 220,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: restaurants.length,
              itemBuilder: (context, index) {
                final restaurant = restaurants[index];

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedRestaurant = restaurant;
                    });
                  },
                  child: Container(
                    width: 180,
                    margin: const EdgeInsets.all(10),
                    child: Card(
                      child: Column(
                        children: [
                          FlutterLogo(size: 120),
                          const SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              restaurant["name"],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          const Divider(),
          Expanded(
            child: selectedRestaurant == null
                ? const Center(
                    child: Text(
                      "Selecione um restaurante",
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [

                        /// IMAGEM
                        Image.network(
                          selectedRestaurant!["image"],
                          height: 220,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),

                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [

                              /// NOME
                              Text(
                                selectedRestaurant!["name"],
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 12),

                              /// DESCRIÇÃO
                              Text(
                                selectedRestaurant![
                                    "description"],
                                style:
                                    const TextStyle(fontSize: 16),
                              ),

                              const SizedBox(height: 20),

                              /// ENDEREÇO
                              Row(
                                children: [
                                  const Icon(Icons.location_on),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      selectedRestaurant![
                                          "address"],
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 12),

                              /// TELEFONE
                              Row(
                                children: [
                                  const Icon(Icons.phone),
                                  const SizedBox(width: 8),
                                  Text(
                                    selectedRestaurant![
                                        "phone"],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
