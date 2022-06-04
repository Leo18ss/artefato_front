// ignore_for_file: prefer_const_constructors

import 'package:artefato/home/home.dart';
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
      appBar: AppBar(
        backgroundColor: Color(0x1E1E1E),
        title: Image.asset(
          'assets/top_splash.png',
          fit: BoxFit.cover,
        ),
      ),
      body: Center(
        child: Stack(
          children: [
            Center(child: Image.asset('assets/background_artefato.png')),
            Center(child: Image.asset('assets/artefato.png')),
          ],
        ),
      ),
      bottomNavigationBar: Image.asset(
        'assets/bottom_splash.png',
        fit: BoxFit.cover,
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
  Configs configs = Configs();
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
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => HomeScreen(configs)));
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
