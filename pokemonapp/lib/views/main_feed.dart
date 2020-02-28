import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokemonapp/models/pokemon.dart';
import 'package:pokemonapp/models/pokemon_start.dart';
import 'package:pokemonapp/services/api_response.dart';
import 'package:pokemonapp/services/pokemon_service.dart';
import 'package:pokemonapp/views/components/home_page_background.dart';

import 'components/pokemon_card.dart';

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
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Column(children: <Widget>[
                    CircleAvatar(
                      radius: 90,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 81,
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        backgroundImage: ExactAssetImage("assets/kanye.jpg"),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text("Welcome Back Kanye!",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text("Here are all your Favorite pokemon:",
                          style: TextStyle(fontSize: 20)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: InkWell(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: MediaQuery.of(context).size.height * 0.6,
                            child: isLoading
                                ? CircularProgressIndicator()
                                : Builder(builder: (_) {
                                    if (isLoading) {
                                      return Center(
                                          child: CircularProgressIndicator());
                                    }

                                    if (_apiResponse.error) {
                                      return Center(
                                          child:
                                              Text(_apiResponse.errorMessage));
                                    }
                                    return PokemonCard(
                                        pokemonResponse: _pokemonResponse);
                                  }),
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
