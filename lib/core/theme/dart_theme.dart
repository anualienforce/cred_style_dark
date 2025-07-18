import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'colors.dart';

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: AppColors.background,
  primaryColor: AppColors.primary,
  fontFamily: 'Poppins',
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.black, // Status bar background color
      statusBarIconBrightness: Brightness.light, // Icon brightness (black icons)
    ),
    iconTheme: IconThemeData(color: AppColors.textPrimary),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: AppColors.textPrimary),
    bodyMedium: TextStyle(color: AppColors.textSecondary),
  ),
  cardColor: AppColors.card,
  iconTheme: const IconThemeData(color: AppColors.primary),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  ),
  chipTheme: ChipThemeData(
    backgroundColor: AppColors.card,
    labelStyle: const TextStyle(color: AppColors.textPrimary),
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
  ),
);
