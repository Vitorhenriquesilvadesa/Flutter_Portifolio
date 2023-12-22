import 'package:flutter/material.dart';

enum Palette {
  main,
  secondary,
  backgroundColor,
  onHover,
  offHover,
  expanded,
  glow,
}

class AppColors {
  static const Map<Palette, Color> _colors = {
    Palette.secondary: Color.fromARGB(255, 9, 0, 47),
    Palette.glow: Colors.white,
    Palette.onHover: Color.fromARGB(255, 20, 119, 176),
    Palette.offHover: Color.fromARGB(255, 37, 37, 37),
    Palette.expanded: Color.fromARGB(255, 0, 128, 255),
    Palette.backgroundColor: Color.fromARGB(255, 0, 0, 0),
    Palette.main: Color.fromARGB(255, 11, 11, 11)
  };

  static Color getColor(Palette palette) {
    return _colors[palette] ?? Colors.transparent;
  }
}
