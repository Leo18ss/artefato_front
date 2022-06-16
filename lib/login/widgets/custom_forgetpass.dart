// ignore_for_file: deprecated_member_use, prefer_const_constructors
import 'package:artefato/login/forgetpass_screen.dart';
import 'package:flutter/material.dart';

class CustomForgetpass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
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
          FlatButton(
            child: Text(
              "Clique aqui",
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.w700,
                fontFamily: "Raleway",
                fontStyle: FontStyle.normal,
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ForgetPassword()));
            },
          ),
        ],
      ),
    );
  }
}
