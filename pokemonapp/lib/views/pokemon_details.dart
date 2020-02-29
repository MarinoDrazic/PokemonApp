import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokemonapp/models/pokemon.dart';
import 'package:pokemonapp/models/pokemon_biology.dart';
import 'package:pokemonapp/services/api_response.dart';
import 'package:pokemonapp/services/get_color_service.dart';
import 'package:pokemonapp/services/pokemon_service.dart';
import 'package:pokemonapp/views/components/pokemon_about.dart';
import 'package:pokemonapp/views/components/pokemon_evolution.dart';
import 'package:pokemonapp/views/components/pokemon_stats.dart';

import 'components/home_page_background.dart';
import 'components/pokemon_details_topbar.dart';

class PokemonDetails extends StatefulWidget {
  const PokemonDetails({Key key, @required this.data}) : super(key: key);
  final Pokemon data;

  @override
  _PokemonDetailsState createState() => _PokemonDetailsState();
}

class _PokemonDetailsState extends State<PokemonDetails> {
  PokemonService get service => GetIt.I<PokemonService>();
  APIResponse<PokemonBiology> _pokemonBiology;

  @override
  void initState() {
    _fetchNotes();
    super.initState();
  }

  bool isLoading = false;

  _fetchNotes() async {
    setState(() {
      isLoading = true;
    });
    _pokemonBiology = await service.getPokemonBiology(widget.data.species.url);
    setState(() {
      isLoading = false;
    });
  }

  Widget getTypeWidgets(List<Type> types) {
    return new Row(
        children: types
            .map((item) => new Padding(
                  padding: EdgeInsets.only(top: 15, right: 15),
                  child: Container(
                    decoration: new BoxDecoration(
                        color: getColorByTypeSubTitle(item.type.name),
                        borderRadius: new BorderRadius.all(
                          const Radius.circular(15.0),
                        )),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10, right: 10, bottom: 3),
                      child: Text(item.type.name,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ),
                  ),
                ))
            .toList());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height,
                color: getColorByType(widget.data.types[0].type.name),
              ),
              HomePageBackground(
                screenHeight: MediaQuery.of(context).size.height,
                color: getColorByType(widget.data.types[0].type.name),
              ),
              Positioned(
                  bottom: 0,
                  left: 0,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0),
                    ),
                    child: DefaultTabController(
                        length: 3,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.55,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 40),
                                child: TabBar(
                                  tabs: [
                                    Tab(
                                      child: Text("About",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black)),
                                    ),
                                    Tab(
                                        child: Text("Base Stats",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black))),
                                    Tab(
                                      child: Text("Evolution",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black)),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: TabBarView(
                                  children: [
                                    isLoading
                                        ? Center(
                                            child: SizedBox(
                                                height: 100.0,
                                                width: 100.0,
                                                child: CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation(
                                                            Colors.blue),
                                                    strokeWidth: 10.0)),
                                          )
                                        : PokemonAbout(
                                            data: widget.data,
                                            biology: _pokemonBiology.data,
                                          ),
                                    PokemonStats(data: widget.data),
                                    !isLoading
                                        ? PokemonEvolution(
                                            biology: _pokemonBiology.data,
                                          )
                                        : Container()
                                  ],
                                ),
                              )
                            ],
                          ),
                        )),
                  )),
              Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: PokemonDetailsTopBar()),
              Positioned(
                top: 110,
                left: 30,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Column(
                    children: <Widget>[
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                                widget.data.name[0].toUpperCase() +
                                    widget.data.name.substring(1),
                                style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            Spacer(),
                            Text("#" + widget.data.id.toString(),
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white))
                          ]),
                      Row(
                        children: <Widget>[getTypeWidgets(widget.data.types)],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: Row(
                          children: <Widget>[
                            Hero(
                              tag: "transition" + widget.data.name,
                              child: Image.network(
                                widget.data.sprites.frontDefault,
                                width: 300,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
