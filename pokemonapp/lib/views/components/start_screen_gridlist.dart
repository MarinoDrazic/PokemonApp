import 'package:flutter/material.dart';
import 'package:pokemonapp/models/generation_tiles.dart';
import 'package:pokemonapp/models/start_screen_titles.dart';

import 'bottom_sheet_generations.dart';

class StartScreenGridList extends StatelessWidget {
  const StartScreenGridList(
      {Key key, @required this.titles, @required this.generationTitles})
      : super(key: key);

  final List<StartScreenTitles> titles;
  final List<GenerationTiles> generationTitles;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
        decoration: BoxDecoration(),
        height: 370,
        child: GridView.builder(
          itemCount: 6,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 2, crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            return GridTile(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(
                        titles[index].colors[0],
                        titles[index].colors[1],
                        titles[index].colors[2],
                        titles[index].colors[3]),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(
                            titles[index].colors[0],
                            titles[index].colors[1],
                            titles[index].colors[2],
                            titles[index].colors[3]),
                        blurRadius: 20.0,
                      )
                    ],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    clipBehavior: Clip.antiAlias,
                    borderRadius: BorderRadius.circular(20),
                    child: GestureDetector(
                      onTap: () {
                        index != 0
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => titles[0].travelTo),
                              )
                            : showModalBottomSheet(
                                backgroundColor: Colors.transparent,
                                isScrollControlled: true,
                                context: context,
                                builder: (context) => BottomSheetGenerations(
                                      generationTitles: generationTitles,
                                    ));
                      },
                      child: Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(titles[index].title,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            ),
                          ),
                          Align(
                              alignment: Alignment.centerRight,
                              child: Image.asset("assets/pokeball.png"))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
