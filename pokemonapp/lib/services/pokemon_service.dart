import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:pokemonapp/models/pokemon.dart';
import 'package:pokemonapp/models/pokemon_biology.dart';
import 'package:pokemonapp/models/pokemon_evolution_model.dart';
import 'package:pokemonapp/models/pokemon_start.dart';
import 'dart:convert';

import 'api_response.dart';

class PokemonService {
  static const APIBase = "https://pokeapi.co/api/v2/";

  Future<APIResponse<PokemonStart>> getPokemonStartList() {
    return http.get(APIBase + "pokemon").then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final pokemonStartList = PokemonStart.fromJson(jsonData);
        return APIResponse<PokemonStart>(data: pokemonStartList);
      }
      return APIResponse<PokemonStart>(
          error: true, errorMessage: "Fetch Failed");
    }).catchError((Object error) =>
        APIResponse<PokemonStart>(error: true, errorMessage: "Unknown Error"));
  }

  Future<APIResponse<List<Pokemon>>> getPokemonList(
      PokemonStart pokemonStart) async {
    List<Pokemon> listaPokemona = new List<Pokemon>();
    List<Future> futures = [];
    pokemonStart.results.forEach((element) {
      futures.add(http.get(element.url).then((data) {
        debugPrint("task done");
        Pokemon temp = pokemonFromJson(data.body);
        listaPokemona.add(temp);
        return temp;
      }));
    });
    await Future.wait(futures);
    return APIResponse<List<Pokemon>>(data: listaPokemona);
  }

  Future<APIResponse<PokemonBiology>> getPokemonBiology(String url) {
    return http.get(url).then((data) {
      if (data.statusCode == 200) {
        final pokemonStartList = pokemonBiologyFromJson(data.body);
        return APIResponse<PokemonBiology>(data: pokemonStartList);
      }
      return APIResponse<PokemonBiology>(
          error: true, errorMessage: "Fetch Failed");
    }).catchError((Object error) => APIResponse<PokemonBiology>(
        error: true, errorMessage: "Unknown Error"));
  }

  Future<APIResponse<PokemonEvolutionModel>> getPokemonEvolution(String url) {
    return http.get(url).then((data) {
      if (data.statusCode == 200) {
        final pokemonStartList = pokemonEvolutionModelFromJson(data.body);
        return APIResponse<PokemonEvolutionModel>(data: pokemonStartList);
      }
      return APIResponse<PokemonEvolutionModel>(
          error: true, errorMessage: "Fetch Failed");
    }).catchError((Object error) => APIResponse<PokemonEvolutionModel>(
        error: true, errorMessage: "Unknown Error"));
  }

  Future<APIResponse<Pokemon>> getSinglePokemon(String name) {
    return http.get(APIBase + "pokemon/" + name).then((data) {
      if (data.statusCode == 200) {
        final pokemonStartList = pokemonFromJson((data.body));
        return APIResponse<Pokemon>(data: pokemonStartList);
      }
      return APIResponse<Pokemon>(error: true, errorMessage: "Fetch Failed");
    }).catchError((Object error) =>
        APIResponse<Pokemon>(error: true, errorMessage: "Unknown Error"));
  }
}
