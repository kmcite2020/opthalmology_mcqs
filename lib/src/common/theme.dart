import 'package:flutter/material.dart';

import '../features/config/config_controller.dart';

class ThemeController {
  static get theme => _theme;
  static get darkTheme => _darkTheme;
}

ThemeData get _theme => ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: configController.color[100],
    );
ThemeData get _darkTheme => ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: configController.color[900],
    );
