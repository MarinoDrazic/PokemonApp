import 'package:flutter/material.dart';
import 'package:pokemonapp/models/pokemon.dart';
import 'package:pokemonapp/services/api_response.dart';
import 'package:pokemonapp/services/get_color_service.dart';
import '../pokemon_details.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard(
      {Key key,
      @required List<Pokemon> pokemonResponse,
      @required this.callback})
      : _pokemonResponse = pokemonResponse,
        super(key: key);
  final Function() callback;

  final List<Pokemon> _pokemonResponse;
  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification) {
      if (notification.metrics.extentAfter == 0) {
        debugPrint("nextPage");

        callback();
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: NotificationListener<ScrollNotification>(
        onNotification: _handleScrollNotification,
        child: GridView.builder(
          itemCount: _pokemonResponse.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            return new GridTile(
                child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          PokemonDetails(data: _pokemonResponse[index])),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Container(
                  decoration: new BoxDecoration(
                      color: getColorByType(
                          _pokemonResponse[index].types[0].type.name),
                      borderRadius: new BorderRadius.all(
                        const Radius.circular(15.0),
                      )),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                            _pokemonResponse[index].name[0].toUpperCase() +
                                _pokemonResponse[index].name.substring(1),
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
                                    color: getColorByTypeSubTitle(
                                        _pokemonResponse[index]
                                            .types[0]
                                            .type
                                            .name),
                                    borderRadius: new BorderRadius.all(
                                      const Radius.circular(15.0),
                                    )),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 10, right: 10, bottom: 3),
                                  child: Text(
                                      _pokemonResponse[index]
                                              .types[0]
                                              .type
                                              .name[0]
                                              .toUpperCase() +
                                          _pokemonResponse[index]
                                              .types[0]
                                              .type
                                              .name
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
                                        _pokemonResponse[index].name,
                                    child: Image.network(
                                      _pokemonResponse[index]
                                          .sprites
                                          .frontDefault,
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
                ),
              ),
            ));
          },
        ),
      ),
    );
  }
}
