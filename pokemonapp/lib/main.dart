import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokemonapp/views/splash_screen.dart';

import 'services/pokemon_service.dart';

void setupLocator() {
  GetIt.instance.registerLazySingleton(() => PokemonService());
  //GetIt.instance<NotesService>();
}

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "SpaceX History",
      theme: ThemeData(),
      home: SplashScreen(),
    );
  }
}
