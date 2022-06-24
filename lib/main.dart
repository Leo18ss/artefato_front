//import 'package:shared_preferences/shared_preferences.dart';
import 'package:artefato/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var _userID = prefs.getString('_userID');

  runApp(
    MaterialApp(
      title: 'Aurem App',
      theme: ThemeData(
        fontFamily: 'Raleway',
        primaryColor: Color.fromARGB(255, 0, 54, 171),
      ),
      debugShowCheckedModeBanner: false,
      home: _userID == null ? SplashLogin() : SplashHome(),
    ),
  );
}
