import 'package:app_pokedex/controllers/pokemon_controller.dart';
import 'package:app_pokedex/pages/home.dart';
import 'package:app_pokedex/repository/pokemon_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => PokemonRepository()),
        ChangeNotifierProvider(
          create: (context) => PokemonController(context.read()),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}
