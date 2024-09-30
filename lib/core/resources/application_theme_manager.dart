import 'package:flutter/material.dart';
import 'Constant.dart';
import 'colors_palette.dart';
class ApplicationThemeManager {
  static ThemeData lightThemeData = ThemeData(
  primaryColor: ColorsPalette.primary,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        fontFamily: Constant.fontFamily ,
        fontSize: 30 ,
        color: Colors.black ,
        fontWeight: FontWeight.bold
      ),
      backgroundColor: Colors.transparent
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      showUnselectedLabels: false,
      backgroundColor: ColorsPalette.primary,
      selectedItemColor: ColorsPalette.selectedItemBottom,
      unselectedItemColor: ColorsPalette.unSelectedItemBottom,
      selectedIconTheme: IconThemeData(
        color: ColorsPalette.selectedItemBottom,
        size: 35 ,
      ),
      unselectedIconTheme: IconThemeData(
        color:  ColorsPalette.unSelectedItemBottom,
        size: 28 ,
      ),
      selectedLabelStyle: TextStyle(
        fontFamily: Constant.fontFamily,
        fontSize: 16 ,
      ),
      unselectedLabelStyle: TextStyle(
          fontFamily: Constant.fontFamily,
          fontSize: 12
      )
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: ColorsPalette.textBlack,
        fontWeight: FontWeight.bold,
        fontFamily: Constant.fontFamily,
        fontSize: 25,
      ),
      bodyMedium: TextStyle(
        color: ColorsPalette.textBlack,
        fontWeight: FontWeight.w500,
        fontFamily: Constant.fontFamily,
        fontSize: 25,
      ),
      bodySmall: TextStyle(
        color: ColorsPalette.textBlack,
        fontWeight: FontWeight.w500,
        fontFamily: Constant.fontFamily,
        fontSize: 20,
      ),
      displaySmall: TextStyle(
        color: ColorsPalette.textBlack,
        fontWeight: FontWeight.w500,
        fontFamily: Constant.fontFamily,
        fontSize: 25,
      ),
      displayLarge: TextStyle(
        color: ColorsPalette.textBlack,
        fontWeight: FontWeight.bold,
        fontFamily: Constant.fontFamily,
        fontSize: 30,
      ),
    ),
    dividerTheme: const DividerThemeData(
      color: ColorsPalette.primary ,
      space: 10  ,
   ),
  );
  static ThemeData darkThemeData = ThemeData(
    primaryColorDark: ColorsPalette.darkPrimary,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(
            fontFamily: Constant.fontFamily ,
            fontSize: 30 ,
            color: Colors.white ,
            fontWeight: FontWeight.bold
        ),
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        backgroundColor: Colors.transparent
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        showUnselectedLabels: false,
        backgroundColor: ColorsPalette.darkPrimaryButton,
        selectedItemColor: ColorsPalette.darkPrimary,
        unselectedItemColor: ColorsPalette.unSelectedItemBottom,
        selectedIconTheme: IconThemeData(
          color: ColorsPalette.darkPrimary,
          size: 35 ,
        ),
        unselectedIconTheme: IconThemeData(
          color:  ColorsPalette.unSelectedItemBottom,
          size: 28 ,
        ),
        selectedLabelStyle: TextStyle(
          fontFamily: Constant.fontFamily,
          fontSize: 16 ,
        ),
        unselectedLabelStyle: TextStyle(
            fontFamily: Constant.fontFamily,
            fontSize: 12
        )
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: ColorsPalette.textWhite,
        fontWeight: FontWeight.bold,
        fontFamily: Constant.fontFamily,
        fontSize: 25,
      ),
      bodyMedium: TextStyle(
        color: ColorsPalette.textWhite,
        fontWeight: FontWeight.w500,
        fontFamily: Constant.fontFamily,
        fontSize: 25,
      ),
      bodySmall: TextStyle(
        color: ColorsPalette.textWhite,
        fontWeight: FontWeight.w500,
        fontFamily: Constant.fontFamily,
        fontSize: 20,
      ),
      displaySmall: TextStyle(
        color: ColorsPalette.textWhite,
        fontWeight: FontWeight.w500,
        fontFamily: Constant.fontFamily,
        fontSize: 25,
      ),
      displayLarge: TextStyle(
        color: ColorsPalette.textWhite,
        fontWeight: FontWeight.bold,
        fontFamily: Constant.fontFamily,
        fontSize: 30,
      ),
    ),
    dividerTheme: const DividerThemeData(
      color: ColorsPalette.darkPrimary ,
      space: 10  ,
    ),
  );

}