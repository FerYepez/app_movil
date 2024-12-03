import 'package:flutter/material.dart';

class RecipeDetail extends StatelessWidget {
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final String instructions;
  final VoidCallback onBackToRecipes;

  RecipeDetail({
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.instructions,
    required this.onBackToRecipes,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(imageUrl, fit: BoxFit.cover),
            SizedBox(height: 16),
            Text(
              title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Ingredientes',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ...ingredients.map((ingredient) => Text('- $ingredient')).toList(),
            SizedBox(height: 16),
            Text(
              'Preparación',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(instructions),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: onBackToRecipes,
                child: Text('Volver a recetas'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
