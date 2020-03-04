import 'package:flutter/material.dart';
import 'package:pokemonapp/models/generation_tiles.dart';
import 'package:pokemonapp/views/components/generations_gridlist.dart';

class BottomSheetGenerations extends StatelessWidget {
  const BottomSheetGenerations({Key key, @required this.generationTitles})
      : super(key: key);
  final List<GenerationTiles> generationTitles;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50), topRight: Radius.circular(50))),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 28.0),
            child: Text("Select a generation",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
          ),
          GenerationsGridList(titles: generationTitles)
        ],
      ),
    );
  }
}
