import 'package:flutter/material.dart';

class GenerationTiles {
  String title;
  List<int> range;
  GenerationTiles({@required this.title, @required this.range});
}

List<GenerationTiles> getGenerationTitles() {
  return [
    GenerationTiles(title: "Generation I", range: [1, 151]),
    GenerationTiles(title: "Generation II", range: [152, 251]),
    GenerationTiles(title: "Generation III", range: [252, 386]),
    GenerationTiles(title: "Generation IV", range: [387, 493]),
    GenerationTiles(title: "Generation V", range: [494, 649]),
    GenerationTiles(title: "Generation VI", range: [650, 721]),
    GenerationTiles(title: "Generation VII", range: [722, 807]),
  ];
}
