import 'package:flutter/material.dart';

class RecipeDetail extends StatelessWidget {
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final String instructions;

  const RecipeDetail({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.instructions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: const Color(0xFFA9EA4B),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Imagen de la receta
              Image.network(
                imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200,
              ),
              const SizedBox(height: 16.0),
              // Sección de ingredientes
              const Text(
                'Ingredientes',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              for (var ingredient in ingredients)
                Text(
                  '- $ingredient',
                  style: const TextStyle(fontSize: 16.0),
                ),
              const SizedBox(height: 16.0),
              // Sección de instrucciones
              const Text(
                'Preparación',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                instructions,
                style: const TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
