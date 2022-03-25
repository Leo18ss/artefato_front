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
      backgroundColor: Color.fromARGB(255, 245, 245, 245),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 242,
            left: 138,
            child: Image.asset(
              "images/logoAurem_on.png",
            ),
          ),
          Positioned(
            top: 360.7,
            left: 129,
            child: SizedBox(
              width: 102,
              height: 38,
              child: Text("Aurem.",
                  style: const TextStyle(
                      color: const Color(0xff003399),
                      fontWeight: FontWeight.w500,
                      fontFamily: "Butler",
                      fontStyle: FontStyle.normal,
                      fontSize: 32.0),
                  textAlign: TextAlign.center),
            ),
          ),
          Positioned(
            top: 350,
            left: 56,
            child: Image.asset(
              "images/BackTestDown.png",
              height: 378,
              width: 360,
            ),
          ),
          Positioned(
            top: -225,
            left: -82,
            child: Image.asset(
              "images/BackTestUp.png",
              height: 640,
              width: 360,
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
      backgroundColor: Color.fromARGB(255, 245, 245, 245),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 242,
            left: 138,
            child: Image.asset(
              "images/logoAurem_on.png",
            ),
          ),
          Positioned(
            top: 360.7,
            left: 129,
            child: SizedBox(
              width: 102,
              height: 38,
              child: Text("Aurem.",
                  style: const TextStyle(
                      color: const Color(0xff003399),
                      fontWeight: FontWeight.w500,
                      fontFamily: "Butler",
                      fontStyle: FontStyle.normal,
                      fontSize: 32.0),
                  textAlign: TextAlign.center),
            ),
          ),
          Positioned(
            top: 350,
            left: 56,
            child: Image.asset(
              "images/BackTestDown.png",
              height: 378,
              width: 360,
            ),
          ),
          Positioned(
            top: -225,
            left: -82,
            child: Image.asset(
              "images/BackTestUp.png",
              height: 640,
              width: 360,
            ),
          ),
        ],
      ),
    );
  }
}
