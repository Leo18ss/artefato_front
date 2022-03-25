// ignore_for_file: prefer_const_constructors

import 'package:artefato/home/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../login/login_screen.dart';

class SplashLogin extends StatefulWidget {
  @override
  _SplashLoginState createState() => _SplashLoginState();
}

class _SplashLoginState extends State<SplashLogin> {
  @override
  void initState() {
    //getValues(); dados de login
    super.initState();

    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );

    SystemChrome.setEnabledSystemUIOverlays([]);

    Future.delayed(Duration(seconds: 3)).then(
      (_) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0x1E1E1E),
      body: Stack(
        children: <Widget>[
          Center(
            child: SizedBox(
              width: 180,
              height: 38,
              child: Text("Artefato",
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Butler",
                      fontStyle: FontStyle.normal,
                      fontSize: 32.0),
                  textAlign: TextAlign.center),
            ),
          ),
        ],
      ),
    );
  }
}

//Splash que vai para a home

class SplashHome extends StatefulWidget {
  @override
  _SplashHomeState createState() => _SplashHomeState();
}

class _SplashHomeState extends State<SplashHome> {
  @override
  void initState() {
    //getValues(); dados de login
    super.initState();

    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );

    SystemChrome.setEnabledSystemUIOverlays([]);

    Future.delayed(Duration(seconds: 3)).then(
      (_) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0x1E1E1E),
      body: Stack(
        children: <Widget>[
          Center(
            child: SizedBox(
              width: 102,
              height: 38,
              child: Text("Artefato",
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Butler",
                      fontStyle: FontStyle.normal,
                      fontSize: 32.0),
                  textAlign: TextAlign.center),
            ),
          ),
        ],
      ),
    );
  }
}
