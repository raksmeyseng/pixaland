import 'package:flutter/material.dart';
import 'dart:math' as math;

class AppColor {
  //===============================================
  // Primary Color
  //===============================================
  static const primary = Color.fromRGBO(71, 176, 132, 1);
  static const primaryHex = '47B084';
  static const primaryColors = [
    primary,
    Color.fromRGBO(239, 199, 68, 1),
  ];
  static const secondary = Color.fromRGBO(255, 184, 0, 1);
  static const buttonLight = Color.fromRGBO(232, 233, 243, 1);
  static const buttonDark = Color.fromRGBO(37, 48, 63, 1);
  static const stepInactive = Color.fromRGBO(179, 179, 179, 1);

  //===============================================
  // Descriptive Color
  //===============================================
  static const highlight = Color.fromRGBO(59, 143, 205, 1);
  static const success = Color.fromRGBO(2, 200, 132, 1);
  static const danger = Color.fromRGBO(236, 102, 102, 1);
  static const info = Colors.blue;
  static const warning = Colors.amber;
  static const active = Color.fromRGBO(2, 200, 132, 1);
  static const inactive = Color.fromRGBO(236, 102, 102, 1);

  //===============================================
  // Chart Color
  //===============================================
  static const chart1 = primary;
  static const chart2 = secondary;
  static const chart3 = Color.fromRGBO(236, 102, 102, 1);
  static const chart4 = Color.fromRGBO(2, 200, 132, 1);
  static const chart5 = Color.fromRGBO(209, 172, 50, 1);
  static const chart6 = Color.fromRGBO(108, 99, 255, 1);
  static const chart7 = Colors.lime;
  static const chart8 = Colors.pink;
  static const chart9 = Colors.brown;
  static const chart10 = Colors.lightGreen;
  static const chart11 = Colors.deepPurple;
  static const chart12 = Colors.indigo;

  static const _colorList = [
    chart1,
    chart2,
    chart3,
    chart4,
    chart5,
    chart6,
    chart7,
    chart8,
    chart9,
    chart10,
    chart11,
    chart12,
  ];

  //===============================================
  // App Color
  //===============================================
  static const black = Color.fromRGBO(27, 33, 44, 1);
  static const white = Colors.white;
  static const lightGrey = Color.fromRGBO(242, 242, 242, 1);

  //===============================================
  // Text Color
  //===============================================
  static const textLight = Color.fromARGB(255, 140, 140, 140);
  static const textDark = Color.fromRGBO(27, 33, 44, 1);

  //===============================================
  // Screen Background
  //===============================================
  static const background = Color.fromRGBO(234, 241, 244, 1);
  static const backgroundDark = Color.fromRGBO(17, 34, 30, 1);
  static const backgroundLight = Colors.white;

  //===============================================
  // Cursor Color
  //===============================================
  static const cursor = primary;

  //===============================================
  // Card Color
  // Light: White
  // Dark: Black 80xdfdf
  //===============================================
  static const card = Colors.white;
  static const cardDark = Color.fromRGBO(27, 47, 42, 1);

  //===============================================
  // Divider Color
  // Light: Grey
  // Dark: White 60
  //===============================================
  static const divider = Colors.grey;
  static const dividerDark = Colors.white60;

  static Color getColor([int? index]) {
    if (index == null || index >= _colorList.length) {
      return getRandom();
    }
    return _colorList[index];
  }

  static Color getRandom() {
    final index = math.Random().nextInt(_colorList.length - 1);
    return getColor(index);
  }

  //===============================================
  // Radio Button
  //===============================================
  static const radioDisable = Color.fromARGB(255, 206, 206, 206);
}
