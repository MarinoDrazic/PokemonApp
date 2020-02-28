import 'package:flutter/material.dart';

class PokemonDetailsTopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 32),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 56,
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 40,
            ),
          ),
          Spacer(),
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.favorite_border,
            color: Colors.white,
            size: 30,
          ),
        ],
      ),
    );
  }
}
