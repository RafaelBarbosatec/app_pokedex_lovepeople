import 'package:app_pokedex/controllers/pokemon_controller.dart';
import 'package:app_pokedex/pages/widgets/pokemon_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Future.delayed(
      const Duration(milliseconds: 100),
      context.read<PokemonController>().loadPokemon,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokedex'),
      ),
      body: Consumer<PokemonController>(
        builder: (context, controller, child) {
          return Stack(
            children: [
              ListView.builder(
                itemCount: controller.pokemonList.length,
                itemBuilder: (context, index) {
                  return PokemonWidget(
                    pokemon: controller.pokemonList[index],
                  );
                },
              ),
              if (controller.loading)
                const Center(child: CircularProgressIndicator()),
            ],
          );
        },
      ),
    );
  }
}
