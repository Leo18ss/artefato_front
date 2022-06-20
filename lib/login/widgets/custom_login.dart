// ignore_for_file: deprecated_member_use, prefer_const_constructors
import 'package:artefato/login/login_screen.dart';
import 'package:flutter/material.dart';

class CustomLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 0,
            child: Text(
              "Ja tem uma conta?",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontFamily: "Raleway",
                fontStyle: FontStyle.normal,
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(
            width: 140,
            child: FlatButton(
              padding: EdgeInsets.all(0),
              child: Text(
                "Clique para entrar",
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Raleway",
                  fontStyle: FontStyle.normal,
                  fontSize: 16,
                ),
                textAlign: TextAlign.left,
              ),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
