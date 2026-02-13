
import 'package:flutter/material.dart';

class RestaurantDetailsPage extends StatelessWidget {
  const RestaurantDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Restaurante'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// IMAGEM
            SizedBox(
              width: double.infinity,
              height: 220,
              child: Image.network(
                'https://images.unsplash.com/photo-1555396273-367ea4eb4db5',
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 16),

            /// CONTEÚDO
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// NOME
                  const Text(
                    'Nome do Restaurante',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  /// AVALIAÇÃO
                  Row(
                    children: const [
                      Icon(Icons.star, color: Colors.amber),
                      SizedBox(width: 4),
                      Text(
                        '4.5',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  /// CATEGORIA
                  const Text(
                    'Categoria: Italiana',
                    style: TextStyle(fontSize: 16),
                  ),

                  const SizedBox(height: 8),

                  /// ENDEREÇO
                  const Text(
                    'Endereço: Rua Exemplo, 123 - Centro',
                    style: TextStyle(fontSize: 16),
                  ),

                  const SizedBox(height: 12),

                  /// ESTACIONAMENTO
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

                  /// DESCRIÇÃO
                  const Text(
                    'Descrição',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    'Restaurante especializado em massas artesanais '
                    'e pratos tradicionais italianos, com ambiente '
                    'aconchegante e atendimento de qualidade.',
                    style: TextStyle(fontSize: 15),
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

