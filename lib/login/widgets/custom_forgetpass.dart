// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:artefato/home/homeScreen.dart';
import 'package:flutter/material.dart';

class CustomForgetpass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
      height: 30,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 0,
            child: Text(
              "Esqueceu sua senha?",
              textAlign: TextAlign.center,
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
            width: 70,
            child: FlatButton(
              padding: EdgeInsets.all(0),
              child: Text(
                "Clique aqui",
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
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => HomeScreen())); //Trocar para tela de esqueceu senha
              },
            ),
          ),
        ],
      ),
    );
  }
}
