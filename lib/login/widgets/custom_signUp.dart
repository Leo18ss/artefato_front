// ignore_for_file: deprecated_member_use, prefer_const_constructors
import 'package:artefato/login/singup_screen%20copy.dart';
import 'package:flutter/material.dart';

class CustomSignUp extends StatelessWidget {
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
              "Não tem uma conta?",
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
              "Cadastre-se",
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
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          SingUpScreen())); //Trocar para cadastro
            },
          ),
        ],
      ),
    );
  }
}
