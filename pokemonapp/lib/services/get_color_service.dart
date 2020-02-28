import 'package:flutter/material.dart';

Color getColorByType(String event) {
  switch (event) {
    case "poison":
      {
        return Color.fromARGB(255, 72, 208, 176);
      }
      break;

    case "fire":
      {
        return Color.fromARGB(255, 251, 108, 108);
      }
      break;

    case "water":
      {
        return Color.fromARGB(255, 117, 186, 250);
      }
      break;

    case "electric":
      {
        return Color.fromARGB(255, 255, 215, 111);
      }
      break;

    case "bug":
      {
        return Color.fromARGB(255, 131, 96, 5);
      }
      break;

    case "flying":
      {
        return Color.fromARGB(255, 0, 213, 210);
      }
      break;

    default:
      {
        return Color.fromARGB(255, 131, 96, 5);
      }
      break;
  }
}

Color getColorByTypeSubTitle(String event) {
  switch (event) {
    case "poison":
      {
        return Color.fromARGB(255, 93, 223, 198);
      }
      break;

    case "fire":
      {
        return Color.fromARGB(255, 253, 133, 133);
      }
      break;

    case "water":
      {
        return Color.fromARGB(255, 165, 218, 254);
      }
      break;

    case "electric":
      {
        return Color.fromARGB(255, 255, 229, 128);
      }
      break;

    case "bug":
      {
        return Color.fromARGB(255, 152, 126, 61);
      }
      break;

    case "flying":
      {
        return Color.fromARGB(255, 106, 254, 252);
      }
      break;

    default:
      {
        return Color.fromARGB(255, 152, 126, 61);
      }
      break;
  }
}
