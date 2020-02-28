import 'package:flutter/material.dart';
import 'package:pokemonapp/models/pokemon.dart';
import 'package:pokemonapp/services/get_color_service.dart';
import 'package:pokemonapp/views/components/pokemon_about.dart';

import 'components/home_page_background.dart';
import 'components/pokemon_details_topbar.dart';

class PokemonDetails extends StatelessWidget {
  const PokemonDetails({Key key, @required this.data}) : super(key: key);
  final Pokemon data;

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
                color: getColorByType(data.types[0].type.name),
              ),
              HomePageBackground(
                screenHeight: MediaQuery.of(context).size.height,
                color: getColorByType(data.types[0].type.name),
              ),
              Positioned(
                  bottom: 0,
                  left: 0,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0),
                    ),
                    child: DefaultTabController(
                        length: 4,
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
                                    Tab(
                                      child: Text("Moves",
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
                                    PokemonAbout(data: data),
                                    Text("2"),
                                    Text("3"),
                                    Text("4"),
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
                                data.name[0].toUpperCase() +
                                    data.name.substring(1),
                                style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            Spacer(),
                            Text("#" + data.id.toString(),
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white))
                          ]),
                      Row(
                        children: <Widget>[getTypeWidgets(data.types)],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: Row(
                          children: <Widget>[
                            Hero(
                              tag: "transition" + data.name,
                              child: Image.network(
                                data.sprites.frontDefault,
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
