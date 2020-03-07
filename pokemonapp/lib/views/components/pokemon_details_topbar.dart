import 'package:flutter/material.dart';

class PokemonDetailsTopBar extends StatelessWidget {
  PokemonDetailsTopBar({this.start, this.stop});
  Function start;
  Function stop;
  bool isPlaying = false;

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
          GestureDetector(
            onTap: () {
              isPlaying ? stop() : start();
              isPlaying = !isPlaying;
            },
            child: isPlaying
                ? Icon(
                    Icons.volume_off,
                    color: Colors.white,
                    size: 30,
                  )
                : Icon(
                    Icons.volume_up,
                    color: Colors.white,
                    size: 30,
                  ),
          ),
        ],
      ),
    );
  }
}
