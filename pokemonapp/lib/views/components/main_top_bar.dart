import 'package:flutter/material.dart';

class PokemonMainFeedTopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 32),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 56,
      child: Row(
        children: <Widget>[
          Icon(
            Icons.menu,
            color: Colors.white,
            size: 40,
          ),
          Spacer(),
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.search,
            color: Colors.white,
            size: 30,
          ),
        ],
      ),
    );
  }
}
