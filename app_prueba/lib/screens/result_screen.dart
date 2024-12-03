import 'package:flutter/material.dart';
import 'saved_screen.dart';
import 'recipe_detail.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ResultScreen extends StatefulWidget {
  final double imc;

  ResultScreen({required this.imc});

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  List<Map<String, dynamic>> savedImcs = [];
  List<dynamic> recipes = [];
  bool isLoading = true;
  bool isLoadingMore = false;
  int recipeOffset = 0; // Track the offset for loading more recipes
  Map<String, dynamic>? selectedRecipeDetails;

  void saveImc() {
    setState(() {
      savedImcs.add({
        'imc': widget.imc,
        'date': DateTime.now(),
      });
    });
  }

  void navigateToSavedScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => SavedScreen(savedImcs: savedImcs)),
    );
  }

  String getIMCResult() {
    if (widget.imc < 18.5) return "Bajo peso";
    if (widget.imc < 25) return "Peso normal";
    if (widget.imc < 30) return "Sobrepeso";
    return "Obesidad";
  }

  @override
  void initState() {
    super.initState();
    fetchRecipes();
  }

  Future<void> fetchRecipes() async {
    const apiUrl =
        'https://www.themealdb.com/api/json/v1/1/filter.php?c=Vegetarian';
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          recipes = data['meals']
              .skip(recipeOffset)
              .take(4)
              .toList(); // Load 4 recipes at a time
          recipeOffset += 4; // Increase the offset for next load
          isLoading = false;
          isLoadingMore = false; // Reset the loading more state
        });
      } else {
        throw Exception('Error al cargar las recetas');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
        isLoadingMore = false; // Reset the loading more state
      });
      print('Error: $e');
    }
  }

  Future<void> fetchMoreRecipes() async {
    setState(() {
      isLoadingMore = true; // Set the loading more state to true
    });
    await fetchRecipes();
  }

  Future<void> fetchRecipeDetails(String mealId) async {
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

        setState(() {
          selectedRecipeDetails = {
            'title': data['strMeal'],
            'imageUrl': data['strMealThumb'],
            'ingredients': ingredients,
            'instructions': data['strInstructions'] ?? 'No disponible.',
          };
        });
      } else {
        throw Exception('Error al cargar los detalles de la receta');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void clearSelectedRecipe() {
    setState(() {
      selectedRecipeDetails = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Resultado IMC"),
        backgroundColor: Color(0xFFA9EA4B), // Cambiar el color a verde
        actions: [
          IconButton(
            //icon: Icon(Icons.favorite_border), // Icono de "favoritos"
            icon: Icon(Icons.bookmark_border), //Icono de guardar
            onPressed:
                navigateToSavedScreen, // Navegar a la pantalla de IMCs guardados
          ),
          IconButton(
            icon: Icon(Icons.login), // Icono de "login"
            onPressed: () {
              // Acción al presionar el icono de "login"
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Resultado",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        "IMC",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 8),
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Color(0xFFEADC4D),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          widget.imc.toStringAsFixed(1),
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Nivel de peso",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 8),
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          getIMCResult(),
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.end, // Alinear el icono a la derecha
                children: [
                  IconButton(
                    icon: Icon(Icons.bookmark_border), // Icono de guardar
                    color: savedImcs.any((imc) => imc['imc'] == widget.imc)
                        ? Colors.red
                        : Colors.black, // Cambia el color si ya está guardado
                    onPressed:
                        saveImc, // Guardar el valor del IMC al presionar el botón
                  ),
                ],
              ),
              SizedBox(
                  height:
                      32), // Espacio adicional para asegurar que el texto esté al menos dos líneas más abajo
              Container(
                width: double.infinity, // Abarcar todo el ancho de la pantalla
                color: Color(0xFFEADC4D),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Recomendaciones:",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      isLoading
                          ? Center(child: CircularProgressIndicator())
                          : selectedRecipeDetails != null
                              ? RecipeDetail(
                                  title: selectedRecipeDetails!['title'],
                                  imageUrl: selectedRecipeDetails!['imageUrl'],
                                  ingredients:
                                      selectedRecipeDetails!['ingredients'],
                                  instructions:
                                      selectedRecipeDetails!['instructions'],
                                  onBackToRecipes: clearSelectedRecipe,
                                )
                              : Column(
                                  children: [
                                    GridView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 10.0,
                                        mainAxisSpacing: 16.0,
                                        childAspectRatio: 3 / 4,
                                      ),
                                      itemCount: recipes.length,
                                      itemBuilder: (context, index) {
                                        final recipe = recipes[index];
                                        return GestureDetector(
                                          onTap: () {
                                            fetchRecipeDetails(
                                                recipe['idMeal']);
                                          },
                                          child: Card(
                                            clipBehavior: Clip.antiAlias,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                AspectRatio(
                                                  aspectRatio: 3 / 2,
                                                  child: Image.network(
                                                    recipe['strMealThumb'],
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    recipe['strMeal'],
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16.0,
                                                      color: Colors.black,
                                                    ),
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    if (isLoadingMore)
                                      Center(
                                          child: CircularProgressIndicator()),
                                    TextButton(
                                      onPressed: fetchMoreRecipes,
                                      child: Text("Más recetas"),
                                    ),
                                  ],
                                ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
