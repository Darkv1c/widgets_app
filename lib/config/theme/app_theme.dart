import 'package:flutter/material.dart';

enum Themes {
  purple(Colors.purple),
  green(Colors.green),
  red(Colors.red),
  blue(Colors.blue);

  final Color color;

  const Themes(this.color);
}

class AppTheme {
  final Themes currentTheme;

  const AppTheme({required this.currentTheme});

  ThemeData getTheme() {
    return ThemeData(
      colorSchemeSeed: currentTheme.color,
      appBarTheme: AppBarTheme(centerTitle: true),
    );
  }
}
