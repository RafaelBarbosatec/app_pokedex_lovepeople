import 'dart:convert';

import 'package:app_pokedex/repository/model/pokemon.dart';
import 'package:http/http.dart' as http;

class PokemonRepository {
  
  Future<List<Pokemon>> getPokemonList() async {
    
    Uri uri = Uri.parse('http://104.131.18.84/pokemon/');

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      List<Pokemon> pokemonList = [];
      Map json = jsonDecode(response.body);

      for (var item in (json['data'] as List)) {
        pokemonList.add(Pokemon.fromJson(item));
      }

      return pokemonList;
    } else {
      return [];
    }
  }
}
