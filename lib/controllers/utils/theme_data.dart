import 'package:flutter/material.dart';
import 'package:portfolio/controllers/utils/color_scheme.dart';
import 'package:portfolio/controllers/utils/text_theme.dart';

import 'app_colors.dart';

/*-------------------------> Light Theme Data <-------------------------*/
final lightThemeData = ThemeData(
  colorScheme: lightModeSchemeColors,
  textTheme: lightTextTheme,
  fontFamily: 'young-serif',
  scaffoldBackgroundColor: AppColors.lightModeBG,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

/*-------------------------> Dark Theme Data <-------------------------*/
final darkThemeData = ThemeData(
  colorScheme: darkModeSchemeColors,
  textTheme: darkTextTheme,
  fontFamily: 'young-serif',
  scaffoldBackgroundColor: AppColors.darkModeBG,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);
