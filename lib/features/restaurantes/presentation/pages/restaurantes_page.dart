import 'package:flutter/material.dart';

class RestaurantListPage extends StatelessWidget {
  const RestaurantListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<RestaurantModel> restaurants = [
      RestaurantModel(
        name: 'Burger House',
        category: 'Hambúrguer',
        rating: 4.8,
        deliveryTime: 30,
        image:
            'https://images.unsplash.com/photo-1550547660-d9450f859349',
      ),
      RestaurantModel(
        name: 'Pizza Prime',
        category: 'Pizzaria',
        rating: 4.6,
        deliveryTime: 40,
        image:
            'https://images.unsplash.com/photo-1601924928588-972c7d4f3b0b',
      ),
      RestaurantModel(
        name: 'Sushi World',
        category: 'Japonesa',
        rating: 4.9,
        deliveryTime: 50,
        image:
            'https://images.unsplash.com/photo-1562158070-57d5c8a7f6c4',
      ),
      RestaurantModel(
        name: 'Churrasco Grill',
        category: 'Churrascaria',
        rating: 4.7,
        deliveryTime: 35,
        image:
            'https://images.unsplash.com/photo-1558030006-450675393462',
      ),
      RestaurantModel(
        name: 'Fit Food',
        category: 'Saudável',
        rating: 4.5,
        deliveryTime: 25,
        image:
            'https://images.unsplash.com/photo-1546069901-ba9599a7e63c',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurantes'),
        centerTitle: true,
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: restaurants.length,
        itemBuilder: (context, index) {
          final restaurant = restaurants[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () {
                /// futuro → abrir menu do restaurante
              },
              child: Row(
                children: [
                  /// IMAGEM
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomLeft: Radius.circular(16),
                    ),
                    child: Image.network(
                      restaurant.image,
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),

                  /// INFOS
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          /// NOME
                          Text(
                            restaurant.name,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 6),

                          /// CATEGORIA
                          Text(
                            restaurant.category,
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
                                restaurant.rating
                                    .toString(),
                              ),

                              const SizedBox(width: 16),

                              const Icon(
                                Icons.delivery_dining,
                                size: 18,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '${restaurant.deliveryTime} min',
                              ),
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
      ),
    );
  }
}









/// 📦 MODEL (no mesmo arquivo)

class RestaurantModel {
  final String name;
  final String category;
  final double rating;
  final int deliveryTime;
  final String image;

  RestaurantModel({
    required this.name,
    required this.category,
    required this.rating,
    required this.deliveryTime,
    required this.image,
  });
}
