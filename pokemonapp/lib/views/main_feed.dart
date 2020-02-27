import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokemonapp/models/pokemon.dart';
import 'package:pokemonapp/models/pokemon_start.dart';
import 'package:pokemonapp/services/api_response.dart';
import 'package:pokemonapp/services/pokemon_service.dart';
import 'package:pokemonapp/views/components/home_page_background.dart';

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
                screenHeight: MediaQuery.of(context).size.height),
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
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
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

class PokemonCard extends StatelessWidget {
  const PokemonCard({
    Key key,
    @required APIResponse<List<Pokemon>> pokemonResponse,
  })  : _pokemonResponse = pokemonResponse,
        super(key: key);

  final APIResponse<List<Pokemon>> _pokemonResponse;
  Color _getColorByType(String event) {
    switch (event) {
      case "poison":
        {
          return Color.fromARGB(255, 72, 208, 176);
        }
        break;

      case "fire":
        {
          return Color.fromARGB(255, 251, 108, 108);
        }
        break;

      case "water":
        {
          return Color.fromARGB(255, 117, 186, 250);
        }
        break;

      case "electric":
        {
          return Color.fromARGB(255, 255, 215, 111);
        }
        break;

      case "bug":
        {
          return Color.fromARGB(255, 131, 96, 5);
        }
        break;

      case "flying":
        {
          return Color.fromARGB(255, 0, 213, 210);
        }
        break;

      default:
        {
          return Color.fromARGB(255, 131, 96, 5);
        }
        break;
    }
  }

  Color _getColorByTypeSubTitle(String event) {
    switch (event) {
      case "poison":
        {
          return Color.fromARGB(255, 93, 223, 198);
        }
        break;

      case "fire":
        {
          return Color.fromARGB(255, 253, 133, 133);
        }
        break;

      case "water":
        {
          return Color.fromARGB(255, 165, 218, 254);
        }
        break;

      case "electric":
        {
          return Color.fromARGB(255, 255, 229, 128);
        }
        break;

      case "bug":
        {
          return Color.fromARGB(255, 152, 126, 61);
        }
        break;

      case "flying":
        {
          return Color.fromARGB(255, 106, 254, 252);
        }
        break;

      default:
        {
          return Color.fromARGB(255, 152, 126, 61);
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: _pokemonResponse.data.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return new Card(
          child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            onTap: () {
              print('Card tapped.');
            },
            child: new GridTile(
                child: Container(
              decoration: new BoxDecoration(
                  color: _getColorByType(
                      _pokemonResponse.data[index].types[0].type.name),
                  borderRadius: new BorderRadius.all(
                    const Radius.circular(15.0),
                  )),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                        _pokemonResponse.data[index].name[0].toUpperCase() +
                            _pokemonResponse.data[index].name.substring(1),
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                  Expanded(
                    child: Stack(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 20, left: 20),
                          child: Container(
                            decoration: new BoxDecoration(
                                color: _getColorByTypeSubTitle(_pokemonResponse
                                    .data[index].types[0].type.name),
                                borderRadius: new BorderRadius.all(
                                  const Radius.circular(15.0),
                                )),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 10, right: 10, bottom: 3),
                              child: Text(
                                  _pokemonResponse
                                          .data[index].types[0].type.name[0]
                                          .toUpperCase() +
                                      _pokemonResponse
                                          .data[index].types[0].type.name
                                          .substring(1),
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            ),
                          ),
                        ),
                        Positioned(
                          child: Align(
                              alignment: Alignment.bottomRight,
                              child: Image.network(
                                _pokemonResponse
                                    .data[index].sprites.frontDefault,
                                fit: BoxFit.fill,
                                height: 130,
                              )),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )),
          ),
        );
      },
    );
  }
}
