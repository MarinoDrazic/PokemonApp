import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokemonapp/models/pokemon.dart';
import 'package:pokemonapp/models/pokemon_start.dart';
import 'package:pokemonapp/services/api_response.dart';
import 'package:pokemonapp/services/pokemon_service.dart';
import 'package:pokemonapp/views/components/home_page_background.dart';
import 'package:pokemonapp/views/components/main_top_bar.dart';

import 'components/pokemon_card.dart';

class MainFeed extends StatefulWidget {
  MainFeed({Key key, this.range}) : super(key: key);
  List<int> range;
  @override
  _MainFeedState createState() => _MainFeedState();
}

class _MainFeedState extends State<MainFeed> {
  PokemonService get service => GetIt.I<PokemonService>();
  APIResponse<List<Pokemon>> _pokemonResponse;
  List<Pokemon> pokeList = [];
  int alreadyFetched = 1; //pokemon from api start at 1.
  int fetchTo = 1;
  bool isLoading = false;
  @override
  void initState() {
    if (widget.range == null) {
      widget.range = [1, 151];
    }
    alreadyFetched = widget.range[0];
    fetchTo = widget.range[0];
    _fetchNotes();
    super.initState();
  }

  _fetchNotes() async {
    setState(() {
      if (pokeList.length < 5) {
        isLoading = true;
      }
      if (widget.range[1] < fetchTo + 20) {
        fetchTo = widget.range[1];
      } else {
        fetchTo += 20;
      }
    });
    _pokemonResponse =
        await service.getPokemonListRange([alreadyFetched, fetchTo]);
    pokeList = new List.from(pokeList)..addAll(_pokemonResponse.data);

    setState(() {
      alreadyFetched = fetchTo;
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
                                if (_pokemonResponse.error) {
                                  return Center(
                                      child:
                                          Text(_pokemonResponse.errorMessage));
                                }
                                return PokemonCard(
                                    pokemonResponse: pokeList,
                                    callback: _fetchNotes);
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
