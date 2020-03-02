import 'package:flutter/cupertino.dart';
import 'package:pokemonapp/views/main_feed.dart';

class StartScreenTitles {
  String title;
  List<int> colors;
  Widget travelTo;
  StartScreenTitles(
      {@required this.title, @required this.colors, this.travelTo});
}

List<StartScreenTitles> getStartScreenTitles() {
  return [
    StartScreenTitles(
        title: "Pokedex", colors: [255, 93, 223, 198], travelTo: MainFeed()),
    StartScreenTitles(
        title: "Moves", colors: [255, 253, 133, 133], travelTo: MainFeed()),
    StartScreenTitles(
        title: "Abilities", colors: [255, 165, 218, 254], travelTo: MainFeed()),
    StartScreenTitles(
        title: "Items", colors: [255, 255, 229, 128], travelTo: MainFeed()),
    StartScreenTitles(
        title: "Locations", colors: [255, 152, 126, 61], travelTo: MainFeed()),
    StartScreenTitles(
        title: "Type Charts",
        colors: [255, 106, 254, 252],
        travelTo: MainFeed()),
  ];
}
