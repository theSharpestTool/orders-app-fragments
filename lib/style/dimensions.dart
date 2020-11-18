import 'package:flutter/material.dart';

class BorderDim {
  BorderDim._();

  static const radius = 20.0;
  static const width = 1.0;
  static const color = Color(0xFFD9D9D9);
  static BorderRadius borderRadius =  BorderRadius.circular(radius);
  static Border border = Border.all(color: color, width: width);
}

class Decorations {
  Decorations._();
  static InputDecoration inputDecoraion = InputDecoration(
    labelStyle: TextStyle(color: Colors.black87),
    fillColor: Colors.white,
    filled: true,
    contentPadding: EdgeInsets.symmetric(horizontal: 15),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: BorderDim.color, width: BorderDim.width),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: BorderDim.color, width: BorderDim.width),
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: BorderDim.color, width: BorderDim.width),
    ),
  );

  static RoundedRectangleBorder dialogShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15),
  );
}

class EdgeDim {
  EdgeDim._();

  static const padding = 20.0;
  static EdgeInsets containerPad = EdgeInsets.all(15);
}
