import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokemonapp/models/pokemon.dart';
import 'package:pokemonapp/models/pokemon_start.dart';
import 'package:pokemonapp/services/api_response.dart';
import 'package:pokemonapp/services/pokemon_service.dart';
import 'package:pokemonapp/views/components/home_page_background.dart';
import 'package:pokemonapp/views/components/main_top_bar.dart';

import 'components/pokemon_card.dart';
import 'components/pokemon_details_topbar.dart';

class MainFeed extends StatefulWidget {
  @override
  _MainFeedState createState() => _MainFeedState();
}

class _MainFeedState extends State<MainFeed> {
  PokemonService get service => GetIt.I<PokemonService>();
  APIResponse<PokemonStart> _apiResponse;
  APIResponse<List<Pokemon>> _pokemonResponse;

  bool isLoading = false;
  @override
  void initState() {
    _fetchNotes();
    super.initState();
  }

  _fetchNotes() async {
    setState(() {
      isLoading = true;
    });
    _apiResponse = await service.getPokemonStartList();
    _pokemonResponse = await service.getPokemonList(_apiResponse.data);

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            HomePageBackground(
                screenHeight: MediaQuery.of(context).size.height,
                color: Color.fromARGB(255, 255, 215, 111)),
            Positioned(
              top: 140,
              left: 23,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Column(children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.8,
                        child: isLoading
                            ? Center(
                                child: SizedBox(
                                    height: 100.0,
                                    width: 100.0,
                                    child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation(Colors.blue),
                                        strokeWidth: 10.0)),
                              )
                            : Builder(builder: (_) {
                                if (_apiResponse.error) {
                                  return Center(
                                      child: Text(_apiResponse.errorMessage));
                                }
                                return PokemonCard(
                                    pokemonResponse: _pokemonResponse);
                              }),
                      ),
                    ),
                  ]),
                ),
              ),
            ),
            Positioned(
              child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: PokemonMainFeedTopBar()),
            ),
            Positioned(
              child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                  )),
            ),
            Positioned(
                top: 130,
                left: 20,
                child: Text("Pokedex",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white))),
          ],
        ),
      ),
    );
  }
}
