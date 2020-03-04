import 'package:flutter/material.dart';
import 'package:pokemonapp/models/generation_tiles.dart';
import 'package:pokemonapp/models/start_screen_titles.dart';
import 'package:pokemonapp/views/components/start_screen_gridlist.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key key}) : super(key: key);

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  List<StartScreenTitles> titles;
  List<GenerationTiles> generationTitles;

  @override
  void initState() {
    titles = getStartScreenTitles();
    generationTitles = getGenerationTitles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 40, top: 80),
                      child: Text("What Pokemon \nare you looking for?",
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40, top: 40),
                child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.search),
                          ),
                          Expanded(
                              child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Search Pokemon, Move, Ability etc.'),
                          ))
                        ],
                      ),
                    )),
              ),
              StartScreenGridList(
                  titles: titles, generationTitles: generationTitles),
              Stack(
                children: <Widget>[
                  Container(
                    color: Colors.white,
                    height: 400,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 80, left: 40),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text("Pokémon News",
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20.0),
                                child: Text("View all",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue)),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 80, left: 40),
                          child: Text("TODO...",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                        )
                      ],
                    ),
                  ),
                  Align(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(50),
                              bottomRight: Radius.circular(50))),
                    ),
                  ),
                ],
              )
            ]),
      ),
    );
  }
}
