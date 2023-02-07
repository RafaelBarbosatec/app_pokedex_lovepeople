import 'package:app_pokedex/repository/model/pokemon.dart';
import 'package:app_pokedex/repository/pokemon_repository.dart';
import 'package:flutter/material.dart';

class PokemonController extends ChangeNotifier {
  List<Pokemon> pokemonList = [];
  bool loading = true;
  final PokemonRepository _repository;

  PokemonController(this._repository);

  void loadPokemon() async {
    List<Pokemon> list = await _repository.getPokemonList();
    pokemonList = list;
    loading = false;
    notifyListeners();
  }
}
