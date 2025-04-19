import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
  class ColorUtils{
    static Color screenBackground = const Color(0xff1F2327);
    static Color appGreen =   const Color(0xffD3FF56);
    // static Color appGreen =   const Color(0xff69F0AE);

    static Color green =   const Color(0xff3EA055);
    static Color purple =   const Color(0xff800080);
    // const Color(0xff77DD77);
    static Color white = const Color(0xffFFFFFF);
    static Color black = const Color(0xff000000);
    static Color grey = const Color(0xff252323);
    static Color grapGrey =   const Color(0xff36454F);

    static Color yellow = const Color(0xffE8E148);
    static Color pink = const Color(0xffF858D5);
    static Color red = const Color(0xffE41B17);
    static Color orange =   const Color(0xffFF6700);
    static Color darkMaroon =   const Color(0xff659EC7);
    static Color blue =   const Color(0xff0020C2).withOpacity(0.6);


  }

// class AppGradients {
//   static LinearGradient get blackToBlueGrey => LinearGradient(
//     colors: [Colors.black, Colors.blueGrey[900]!],
//     begin: Alignment.topCenter,
//     end: Alignment.bottomCenter,
//   );
// }
class AppGradients {
  static LinearGradient get blackToBlueGrey =>  LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF000000),
      Color(0xFF434343),
    ],
    stops: [0.1, 1.0],
  );

  static LinearGradient get circleGradient =>  LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF92FFC0),
      Color(0xFF002661),
    ],
    stops: [0.1, 1.0],
  );

  static LinearGradient get greyTopTOBlackBottom => LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF434343),
      Color(0xFF000000),
    ],
    stops: [0.1, 1.0],
  );

  static LinearGradient get buttonGradient => LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xFFFFF720),
      Color(0xFF3CD500),
    ],
    stops: [0.1, 1.0],
  );

  static LinearGradient get screenBackground => LinearGradient(
      colors: [
        Color(0xffe6fff7),
        Color(0xffefffff),
        Color(0xffefffff),
        Color(0xffefffff),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter
  );
}