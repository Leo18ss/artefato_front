// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import '../conexoes.dart';

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();

  final RoundedLoadingButtonController _btnController =
      new RoundedLoadingButtonController();

  String? _emailTxt;

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          iconTheme: IconThemeData(
            color: Color.fromARGB(155, 0, 0, 0),
            size: 20.0,
          ),
          title: Text(
            "Recuperar senha",
            style: TextStyle(
              fontSize: 22.0,
              color: Color.fromARGB(155, 0, 0, 0),
            ),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        preferredSize: Size.fromHeight(58),
      ),
      backgroundColor: Color.fromARGB(255, 245, 245, 245),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 250,
            left: -380,
            child: Image.asset(
              "images/BackSingUp.png",
              height: 600,
            ),
          ),
          Container(
            height: 1000,
            width: 500,
            padding: EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 13.0,
                    ),
                    Text(
                      "Por favor, entre com o seu e-mail de cadastro para recuperar a sua senha.",
                      style: TextStyle(
                          color: Color.fromARGB(155, 0, 0, 0),
                          fontWeight: FontWeight.w400,
                          fontFamily: "Raleway",
                          fontStyle: FontStyle.normal,
                          fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 24.0,
                    ),
                    TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontFamily: "Raleway",
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                            ),
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Color.fromARGB(255, 245, 245, 245),
                                prefixText: "E-mail: "),
                            validator: (text) {
                              if (text?.isEmpty == true) {
                                return "Este campo não pode ser vazio!";
                              }
                              RegExp regex = RegExp(
                                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
                              if (!regex.hasMatch(text!))
                                return 'E-Mail inválido';
                              else
                                _emailTxt = text;
                              return null;
                            },
                          ),
                    SizedBox(
                      height: 24,
                    ),
                    SizedBox(
                      height: 48,
                      width: 136,
                      child: RoundedLoadingButton(
                        controller: _btnController,
                        child: Text(
                          "Avançar",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Raleway",
                              fontStyle: FontStyle.normal,
                              fontSize: 16.0),
                        ),
                        color: Color.fromARGB(255, 0, 54, 171),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            int responseF;
                            responseF = await postForgetPass(_emailTxt!);
                            if (responseF == 1) {
                              _btnController.success();
                              // sendNotification(
                              //   text:
                              //       "E-mail enviado. Por favor, acesse sua conta para conseguir recuperar a sua senha!",
                              //   icon: Icons.email,
                              //   context: context,
                              //   size: 14,
                              // );
                              Future.delayed(Duration(seconds: 3), () {
                                Navigator.pop(context);
                              });
                            } else if (responseF == 0) {
                              // sendNotification(
                              //   text: "E-mail inválido",
                              //   icon: Icons.warning,
                              //   context: context,
                              //   size: 16,
                              // );
                              _btnController.reset();
                            } else {
                              // sendNotification(
                              //   text:
                              //       "Sem conexão com o servidor, tente novamente em alguns instantes.",
                              //   icon: Icons.error,
                              //   context: context,
                              //   size: 14,
                              // );
                              _btnController.reset();
                            }
                          } else {
                            _btnController.reset();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
