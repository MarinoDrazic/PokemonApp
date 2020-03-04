import 'package:flutter/material.dart';
import 'package:pokemonapp/models/generation_tiles.dart';

import '../main_feed.dart';

class GenerationsGridList extends StatelessWidget {
  const GenerationsGridList({
    Key key,
    @required this.titles,
  }) : super(key: key);

  final List<GenerationTiles> titles;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.6,
        child: GridView.builder(
          itemCount: titles.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1, crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            return GridTile(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    clipBehavior: Clip.antiAlias,
                    borderRadius: BorderRadius.circular(20),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MainFeed(range: titles[index].range)),
                        );
                      },
                      child: Stack(
                        children: <Widget>[
                          Align(
                              alignment: Alignment.centerRight,
                              child: Image.asset("assets/generation" +
                                  (index + 1).toString() +
                                  ".png")),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Text(titles[index].title,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                            ),
                          ),
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
