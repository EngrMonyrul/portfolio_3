import 'package:flutter/material.dart';

import 'app_colors.dart';

/*------------------> Light Mode Color Scheme <-----------------*/
ColorScheme lightModeSchemeColors = const ColorScheme(
  brightness: Brightness.light,
  primary: AppColors.primaryColor,
  onPrimary: Colors.white,
  secondary: AppColors.secondarycolor,
  onSecondary: Colors.white,
  error: Colors.red,
  onError: Colors.white,
  background: AppColors.lightModeBG,
  onBackground: Colors.black,
  surface: AppColors.lightModeBG,
  onSurface: Colors.black,
);

/*------------------> Dark Mode Color Scheme <-----------------*/
ColorScheme darkModeSchemeColors = const ColorScheme(
  brightness: Brightness.dark,
  primary: AppColors.primaryColor,
  onPrimary: Colors.white,
  secondary: AppColors.secondarycolor,
  onSecondary: Colors.white,
  error: Colors.red,
  onError: Colors.white,
  background: AppColors.darkModeBG,
  onBackground: Colors.black,
  surface: AppColors.darkModeBG,
  onSurface: Colors.white,
);
