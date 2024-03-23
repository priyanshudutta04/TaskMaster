// ignore_for_file: prefer_const_constructors, unused_local_variable, must_be_immutable

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:learningdart/pages/dolist.dart';
import 'package:learningdart/pages/habit.dart';
import 'package:learningdart/pages/home.dart';
import 'package:learningdart/pages/notes.dart';
import 'package:learningdart/pages/settings.dart';
//import 'package:velocity_x/velocity_x.dart';

//import 'package:google_fonts/google_fonts.dart';
import 'package:learningdart/utils/routes.dart';
import 'package:learningdart/widgets/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

import 'pages/login.dart';




void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  //initalizing hive
  await Hive.initFlutter();
  await Hive.openBox("Habit_db");
  //do list db
  var doListBox= await Hive.openBox("DoList_db");
  //habit db
  var habitBox= await Hive.openBox("Habit_db");
  //notes db
  var notebox= await Hive.openBox("Notes_db");

  //SharedPreferences sp = await SharedPreferences.getInstance();
  //isDark=sp.getBool("theme")??false;
  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  //const MyApp({super.key});

  bool isSwitched;
  MyApp({Key? key, this.isSwitched=false}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (context, _) {
          final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      
      themeMode: themeProvider.themeMode,
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,
      
      //themeMode: ThemeMode.system,                       // setting the theme

      debugShowCheckedModeBanner: false,              //removes debug banner

      initialRoute: "/",                              //this route will open first
      
      routes: {                                      
        "/": (context) => HomePage(),                //main root
        Myroutes.homeRoute: (context) => HomePage(),
        Myroutes.loginRoute: (context) => LoginPage(),
        Myroutes.doListRoute: (context) => DoListPage(),
        Myroutes.habitRoute: (context) => HabitPage(),
        Myroutes.settingsRoute: (context) => SettingsPage(),
        Myroutes.notesRoute: (context) => NotesPage(),
        
      },
    );   
  }
  );
}

readPref() async {
    final prefs = await SharedPreferences.getInstance();
    const key = 'my_bool_key';
    final themevalue = prefs.getBool('my_bool_key') ?? false;
    return themevalue;
    //prefs.setBool(key, themevalue);
    //print('saved $value');
  }
  

