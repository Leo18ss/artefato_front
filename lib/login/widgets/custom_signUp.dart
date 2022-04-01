// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:artefato/home/homeScreen.dart';
import 'package:flutter/material.dart';

class CustomSignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
      height: 30,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 0,
            child: Text(
              "Não tem uma conta?",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontFamily: "Raleway",
                fontStyle: FontStyle.normal,
                fontSize: 12,
              ),
            ),
          ),
          SizedBox(
            width: 75,
            child: FlatButton(
              padding: EdgeInsets.all(0),
              child: Text(
                "Cadastre-se",
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Raleway",
                  fontStyle: FontStyle.normal,
                  fontSize: 12,
                ),
                textAlign: TextAlign.left,
              ),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomeScreen())); //Trocar para cadastro
              },
            ),
          ),
        ],
      ),
    );
  }
}
