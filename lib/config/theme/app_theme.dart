import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.pink,
  Colors.purple,
  Colors.amber,
  Colors.teal,
  Colors.indigo,
  Colors.cyan,
  Colors.deepOrange,
];


class AppTheme {

  final int slectedColor;
  final bool isDarkMode;

  AppTheme({
    this.slectedColor = 0,
    this.isDarkMode = false

  }): assert (slectedColor >= 0,'Selected color must be greater than 0'),
      assert (slectedColor < colorList.length,'Selected color must be less or equal than ${colorList.length - 1}'
  );

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    brightness: isDarkMode ? Brightness.dark : Brightness.light,
    colorSchemeSeed: colorList[slectedColor],
    appBarTheme: AppBarTheme(
      centerTitle: false,
    )
    );
    
  

}