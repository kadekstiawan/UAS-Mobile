import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:what_todo/data/main.dart';
import 'package:what_todo/screens/homepage.dart';
import 'package:what_todo/screens/login_screen.dart';
import 'package:what_todo/screens/profile.dart';
// ignore: duplicate_import
import 'package:what_todo/screens/login_screen.dart';
import 'package:what_todo/screens/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.nunitoSansTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        home: LoginScreen(),
        routes: <String, WidgetBuilder>{
          '/profil': (BuildContext context) => new MyProfil(),
          '/home': (BuildContext context) => new Homepage(),
          '/onboard': (BuildContext context) => new HomeScreen(),
          '/theme': (BuildContext context) => new Home(),
        });
  }
}
