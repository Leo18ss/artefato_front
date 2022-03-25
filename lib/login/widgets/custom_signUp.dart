//import 'package:aurem_app/ui/singup/newUser_name.dart';
import 'package:artefato/home/homeScreen.dart';
import 'package:flutter/material.dart';

class CustomSignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Align(
      alignment: Alignment.bottomLeft,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 0,
            child: Text(
              "Não tem um Cadastro?",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontFamily: "Raleway",
                fontStyle: FontStyle.normal,
                fontSize: 12,
              ),
            ),
          ),
          FlatButton(
            padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: Text(
              "Cadastre-se",
              style: TextStyle(
                color: Colors.yellow,
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
        ],
      ),
    );
  }
}
