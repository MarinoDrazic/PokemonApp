import 'package:flutter/material.dart';
import 'package:pokemonapp/models/extra_icons_icons.dart';
import 'package:pokemonapp/models/pokemon.dart';
import 'package:pokemonapp/models/pokemon_biology.dart';

class PokemonAbout extends StatelessWidget {
  const PokemonAbout({Key key, @required this.data, @required this.biology})
      : super(key: key);
  final Pokemon data;
  final PokemonBiology biology;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
        Widget>[
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
        padding: const EdgeInsets.only(left: 40, top: 20, right: 100),
        child: Table(
          children: [
            TableRow(children: [
              Text('Gender',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54)),
              Row(
                children: <Widget>[
                  Icon(
                    ExtraIcons.male,
                    color: Colors.lightBlue,
                    size: 15,
                  ),
                  Text(" " + ((8 - biology.genderRate) * 12.5).toString() + "%",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Icon(
                      ExtraIcons.female,
                      color: Colors.pink,
                      size: 15,
                    ),
                  ),
                  Text(" " + ((biology.genderRate) * 12.5).toString() + "%",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ],
              ),
            ]),
            TableRow(children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text('Egg Groups',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                    biology.eggGroups.map((i) => i.name.toString()).join(", "),
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ),
            ]),
            TableRow(children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text('Base Happines',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(biology.baseHappiness.toString(),
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ),
            ]),
          ],
        ),
      )
    ]);
  }
}
