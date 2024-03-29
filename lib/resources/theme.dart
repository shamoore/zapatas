import 'package:flutter/material.dart';

ThemeData appTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.orangeAccent, colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.red),
);

TextStyle categoryTextStyle = TextStyle(
  fontFamily: 'Burrito',
  fontSize: 30,
  color: Colors.black,
);

TextStyle categoryTextStyleSub = TextStyle(
  fontFamily: 'Burrito',
  fontSize: 20,
  color: Colors.black,
);
TextStyle categoryTextStyleLink = TextStyle(
  fontFamily: 'Roboto',
  fontSize: 20,
  color: Colors.blue.shade800,
  decoration: TextDecoration.underline,
);

TextStyle menuTextStyle = TextStyle(fontFamily: 'Roboto', fontSize: 20, color: Colors.black);
TextStyle menuTextStyleBold = TextStyle(fontFamily: 'Roboto', fontSize: 22, color: Colors.black);
TextStyle menuTextStyleSmall = TextStyle(fontFamily: 'Roboto', fontSize: 15, color: Colors.black87);
