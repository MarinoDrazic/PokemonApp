import 'package:flutter/material.dart';
import 'package:pokemonapp/models/pokemon.dart';

class PokemonAbout extends StatelessWidget {
  const PokemonAbout({Key key, @required this.data}) : super(key: key);
  final Pokemon data;
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 40, top: 40, right: 100),
            child: Table(
              children: [
                TableRow(children: [
                  Text('Species',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54)),
                  Text(data.species.name,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text('Height',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(data.height.toString() + "0cm",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text('Weight',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text((data.weight / 10).toString() + "kg",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text('Abilities',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                        data.abilities
                            .map((i) => i.ability.name.toString())
                            .join(", "),
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ),
                ])
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, top: 20),
            child: Text("Breeding",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, top: 20),
            child: Text("Todo fetch from Api...",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
          )
        ]);
  }
}
