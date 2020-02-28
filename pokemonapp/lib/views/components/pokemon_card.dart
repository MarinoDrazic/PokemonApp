import 'package:flutter/material.dart';
import 'package:pokemonapp/models/pokemon.dart';
import 'package:pokemonapp/services/api_response.dart';
import 'package:pokemonapp/services/get_color_service.dart';
import '../pokemon_details.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({
    Key key,
    @required APIResponse<List<Pokemon>> pokemonResponse,
  })  : _pokemonResponse = pokemonResponse,
        super(key: key);

  final APIResponse<List<Pokemon>> _pokemonResponse;

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: GridView.builder(
        itemCount: _pokemonResponse.data.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return new Card(
            child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          PokemonDetails(data: _pokemonResponse.data[index])),
                );
              },
              child: new GridTile(
                  child: Container(
                decoration: new BoxDecoration(
                    color: getColorByType(
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
                                  color: getColorByTypeSubTitle(_pokemonResponse
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
                                child: Hero(
                                  tag: "transition" +
                                      _pokemonResponse.data[index].name,
                                  child: Image.network(
                                    _pokemonResponse
                                        .data[index].sprites.frontDefault,
                                    fit: BoxFit.fill,
                                    height: 130,
                                  ),
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
      ),
    );
  }
}
