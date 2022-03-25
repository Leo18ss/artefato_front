//import 'package:aurem_app/ui/login/forgetpass_screen.dart';
import 'package:artefato/home/homeScreen.dart';
import 'package:flutter/material.dart';

class CustomForgetpass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Row(
      children: <Widget>[
        Expanded(
          flex: 0,
          child: Text(
            "Esqueceu seus dados de login?",
            textAlign: TextAlign.center,
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
            "Obter ajuda para entrar",
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
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => HomeScreen())); //Trocar para tela de esqueceu senha
          },
        ),
      ],
    );
  }
}
