import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokemonapp/models/pokemon.dart';
import 'package:pokemonapp/models/pokemon_biology.dart';
import 'package:pokemonapp/models/pokemon_evolution_model.dart';
import 'package:pokemonapp/services/api_response.dart';
import 'package:pokemonapp/services/pokemon_service.dart';

class PokemonEvolution extends StatefulWidget {
  const PokemonEvolution({Key key, @required this.biology}) : super(key: key);
  final PokemonBiology biology;

  @override
  _PokemonEvolutionState createState() => _PokemonEvolutionState();
}

class _PokemonEvolutionState extends State<PokemonEvolution> {
  PokemonService get service => GetIt.I<PokemonService>();
  APIResponse<PokemonEvolutionModel> evolutionModel;
  List<APIResponse<Pokemon>> evolutionChain = [];
  @override
  void initState() {
    _fetchNotes();
    super.initState();
  }

  bool isLoading = true;

  _fetchNotes() async {
    setState(() {
      isLoading = true;
    });
    evolutionModel =
        await service.getPokemonEvolution(widget.biology.evolutionChain.url);
    evolutionChain.add(
        await service.getSinglePokemon(evolutionModel.data.chain.species.name));
    if (evolutionModel.data.chain.evolvesTo.length != 0) {
      evolutionChain.add(await service.getSinglePokemon(
          evolutionModel.data.chain.evolvesTo[0].species.name));
      if (evolutionModel.data.chain.evolvesTo[0].evolvesTo.length != 0) {
        evolutionChain.add(await service.getSinglePokemon(
            evolutionModel.data.chain.evolvesTo[0].evolvesTo[0].species.name));
      }
    }

    setState(() {
      isLoading = false;
    });
  }

  Widget getEvolutionChain() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Spacer(),
            Image.network(evolutionChain[0].data.sprites.frontShiny,
                width: 150, fit: BoxFit.cover),
            Column(
              children: <Widget>[
                Icon(
                  Icons.arrow_forward,
                  color: Colors.black,
                ),
                Text(
                    "Lvl " +
                        evolutionModel.data.chain.evolvesTo[0]
                            .evolutionDetails[0].minLevel
                            .toString(),
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black))
              ],
            ),
            Image.network(evolutionChain[1].data.sprites.frontShiny,
                width: 150, fit: BoxFit.cover),
            Spacer(),
          ],
        ),
        evolutionChain.length > 2
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Spacer(),
                  Image.network(evolutionChain[1].data.sprites.frontShiny,
                      width: 150, fit: BoxFit.cover),
                  Column(
                    children: <Widget>[
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.black,
                      ),
                      Text(
                          "Lvl " +
                              evolutionModel.data.chain.evolvesTo[0]
                                  .evolvesTo[0].evolutionDetails[0].minLevel
                                  .toString(),
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black))
                    ],
                  ),
                  Image.network(evolutionChain[2].data.sprites.frontShiny,
                      width: 150, fit: BoxFit.cover),
                  Spacer(),
                ],
              )
            : Container()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 30),
            child: Text("Evolution Chain",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
          ),
          isLoading
              ? Padding(
                  padding: const EdgeInsets.only(top: 80.0),
                  child: Center(
                    child: SizedBox(
                        height: 100.0,
                        width: 100.0,
                        child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Colors.blue),
                            strokeWidth: 10.0)),
                  ),
                )
              : getEvolutionChain()
        ],
      ),
    );
  }
}
