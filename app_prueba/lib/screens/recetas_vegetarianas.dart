import 'dart:convert';
import 'package:app_prueba/screens/recetas.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//void main() => runApp(const RecipeApp());

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      theme: ThemeData(primarySwatch: Colors.teal),
    );
  }
}

// Clase RecipeGrid
class RecipeGrid extends StatefulWidget {
  final String category;
  final String categoryTitle;

  const RecipeGrid({
    super.key,
    required this.category,
    required this.categoryTitle, // Asegúrate de pasar este parámetro
  });

  @override
  _RecipeGridState createState() => _RecipeGridState();
}

class _RecipeGridState extends State<RecipeGrid> {
  List<dynamic> recipes = [];
  List<dynamic> favoriteRecipes = [];
  bool isLoading = true;

  /*  final Map<String, String> translationMap = {
    'Spaghetti': 'Espaguetis',
    'Salad': 'Ensalada',
    'Pizza': 'Pizza',
    // Agrega más traducciones si es necesario
  };
 */
  @override
  void initState() {
    super.initState();
    fetchRecipes(widget.category);
  }

  Future<void> fetchRecipes(String category) async {
    const apiUrl = 'https://www.themealdb.com/api/json/v1/1/filter.php?c=';
    try {
      final response = await http.get(Uri.parse(apiUrl + category));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          recipes = data['meals'].take(15).toList();
          isLoading = false;
        });
      } else {
        throw Exception('Error al cargar las recetas: ${response.statusCode}');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Error: $e');
    }
  }

  Future<void> fetchRecipeDetails(String mealId, BuildContext context) async {
    final apiUrl =
        'https://www.themealdb.com/api/json/v1/1/lookup.php?i=$mealId';
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final data = json.decode(response.body)['meals'][0];
        final ingredients = <String>[];

        // Construye la lista de ingredientes
        for (var i = 1; i <= 20; i++) {
          final ingredient = data['strIngredient$i'];
          final measure = data['strMeasure$i'];
          if (ingredient != null && ingredient.isNotEmpty) {
            ingredients.add('$ingredient - $measure');
          }
        }

        // Navega a la nueva pantalla con los detalles de la receta
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecipeDetail(
              title: data['strMeal'],
              imageUrl: data['strMealThumb'],
              ingredients: ingredients,
              instructions: data['strInstructions'] ?? 'No disponible.',
            ),
          ),
        );
      } else {
        throw Exception('Error al cargar los detalles de la receta');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void toggleFavorite(dynamic recipe) {
    setState(() {
      if (favoriteRecipes.contains(recipe)) {
        favoriteRecipes.remove(recipe);
      } else {
        favoriteRecipes.add(recipe);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recetas Vegetarianas'),
        backgroundColor: const Color(0xFFA9EA4B),
      ),
      body: Container(
        color: const Color(0xFFF2E990),
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : GridView.builder(
                padding: const EdgeInsets.all(16.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 16.0,
                  childAspectRatio: 3 / 4,
                ),
                itemCount: recipes.length,
                itemBuilder: (context, index) {
                  final recipe = recipes[index];
                  final isFavorite = favoriteRecipes.contains(recipe);
                  final translatedTitle =
                      //translationMap[recipe['strMeal']] ?? recipe['strMeal'];
                      recipe['strMeal'];
                  return GestureDetector(
                    onTap: () {
                      fetchRecipeDetails(recipe['idMeal'], context);
                    },
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          AspectRatio(
                            aspectRatio: 3 / 2,
                            child: Image.network(
                              recipe['strMealThumb'],
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    translatedTitle,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0,
                                      color: Colors.black,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 8, 8, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  icon: Icon(
                                    isFavorite
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color:
                                        isFavorite ? Colors.red : Colors.grey,
                                  ),
                                  onPressed: () {
                                    toggleFavorite(recipe);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
