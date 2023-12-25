import 'dart:convert';
import 'package:food_recipe/models/recipe.dart';
import 'package:http/http.dart' as http;

class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.http('http://yummly2.p.rapidapi.com', '/feeds/list',
        {'limit': '24', 'start': '0'});

    final response = await http.get(uri, headers: {
      'X-RapidAPI-Key': '9a917d05a7msh3b114f479f9ea47p19735djsnad3a73388d95',
      'X-RapidAPI-Host': 'http://yummly2.p.rapidapi.com',
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['feed']) {
      _temp.add(i['content']['details']);
    }

    return Recipe.recipesFromSnapshot(_temp);
  }
}
