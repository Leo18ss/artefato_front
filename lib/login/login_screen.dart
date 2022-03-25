import 'dart:async';
import 'package:artefato/home/homeScreen.dart';
import 'package:artefato/login/widgets/customLogin_textField.dart';
import 'package:artefato/login/widgets/custom_forgetpass.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import '../conexoes.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();

  final RoundedLoadingButtonController _btnController =
      new RoundedLoadingButtonController();

  String? _emailTxt, _senhaTxt;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 245, 245),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(0),
          child: Column(
          children: <Widget>[
            Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[ 
                Center(
                  child: Text(
                    "Artefato",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 54, 171),
                        fontWeight: FontWeight.w500,
                        fontFamily: "Butler",
                        fontStyle: FontStyle.normal,
                        fontSize: 68.0),
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 16.0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 360.0,
                        ),
                        CustomLoginTextField(
                          obscure: false,
                          icon: Icons.email,
                          typeInput: TextInputType.emailAddress,
                          func: (text) {
                            if (text.isEmpty) {
                              return "Este campo não pode ser vazio!";
                            }
                            RegExp regex = RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
                            if (!regex.hasMatch(text))
                              return 'E-Mail inválido';
                            else
                              _emailTxt = text;
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        CustomLoginTextField(
                          obscure: true,
                          icon: Icons.lock,
                          typeInput: TextInputType.visiblePassword,
                          func: (text) {
                            if (text.isEmpty) {
                              return "Este campo não pode ser vazio!";
                            } else
                              _senhaTxt = text;
                            return null;
                          },
                        ),
                        CustomForgetpass(),
                        SizedBox(height: 2.5),
                        Column(
                          children: <Widget>[
                            SizedBox(
                              height: 48.0,
                              width: 146.0,
                              child: RoundedLoadingButton(
                                controller: _btnController,
                                valueColor: Color.fromARGB(255, 0, 54, 171),
                                child: Text(
                                  " Efetuar login",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 0, 54, 171),
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "Raleway",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 16.0),
                                ),
                                color: Color.fromARGB(255, 245, 245, 245),
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    Timer(
                                      Duration(seconds: 1),
                                      () async {
                                        int responseLogin;
                                        responseLogin = await postLogin(
                                            _emailTxt!, _senhaTxt!);
                                        if (responseLogin == 1) {
                                          _btnController.success();
                                          Future.delayed(Duration(seconds: 2))
                                              .then(
                                            (_) {
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          HomeScreen()));
                                            },
                                          );
                                        } else if (responseLogin == 2) {
                                          _btnController.error();
                                          // sendNotification(
                                          //   text: "E-mail não confirmado!",
                                          //   icon: Icons.error,
                                          //   context: context,
                                          //   size: 16,
                                          // );
                                          _btnController.reset();
                                        } else if (responseLogin == 0) {
                                          _btnController.error();
                                          // sendNotification(
                                          //   text: "E-mail ou senha incorretos.",
                                          //   icon: Icons.error,
                                          //   context: context,
                                          //   size: 16,
                                          // );
                                          _btnController.reset();
                                        } else {
                                          _btnController.error();
                                          // sendNotification(
                                          //   text:
                                          //       "Sem conexão com o servidor, tente novamente em alguns instantes!",
                                          //   icon: Icons.error,
                                          //   context: context,
                                          //   size: 16,
                                          // );
                                          _btnController.reset();
                                        }
                                      },
                                    );
                                  } else {
                                    _btnController.error();
                                    Future.delayed(
                                      Duration(seconds: 2),
                                      () {
                                        _btnController.reset();
                                      },
                                    );
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
          ),
        ),
      ),
    );
  }
}