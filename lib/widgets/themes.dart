// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';




class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}


class MyThemes {
  static final lightTheme = ThemeData(
        primarySwatch: Colors.deepPurple,               // changes all colours with respect to given colour
        fontFamily: GoogleFonts.roboto().fontFamily,
        primaryTextTheme: GoogleFonts.robotoTextTheme(),
        //colours for light theme
        primaryColor: Color.fromRGBO(53, 1, 61, 1),        //text colour
        cardColor: Color.fromRGBO(245,245,245, 1),        //background colour
        canvasColor: Colors.white,
        hintColor:  Color.fromRGBO(53, 1, 61, 1),
        dividerColor: Color.fromRGBO(255,249,196, 1),     //Alternate colour for list tile
        unselectedWidgetColor: Color.fromARGB(255, 219, 32, 32),
        focusColor: Colors.deepPurple,                         //active colour for  checkbox
        
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.deepPurple),
        ) 
      
    );

  static final darkTheme = ThemeData(
      primarySwatch: Colors.deepPurple,
        brightness: Brightness.dark,
        fontFamily: GoogleFonts.roboto().fontFamily,
        primaryTextTheme: GoogleFonts.robotoTextTheme(),
        //colours for dark theme
        primaryColor: Color.fromRGBO(245,245,245, 1),     //text color
        cardColor: Color.fromRGBO(17,17,17, 1),           //background colour
        canvasColor: Color.fromRGBO(30,30,30, 1),
        hintColor:  Color.fromRGBO(152,94,255, 1),
        dividerColor: Color.fromRGBO(66,66,66, 1),     //Alternate colour for list tile
        unselectedWidgetColor: Colors.red,
        focusColor: Color.fromRGBO(152,94,255, 1),                         //active colour for  checkbox

        appBarTheme: AppBarTheme(
          color: Colors.black,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.deepPurple)
      )
    );
}