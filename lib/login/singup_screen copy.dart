// ignore_for_file: prefer_const_constructors
import 'dart:async';
import 'package:artefato/home/home.dart';
import 'package:artefato/home/homeScreen.dart';
import 'package:artefato/login/widgets/custom_forgetpass.dart';
import 'package:artefato/login/widgets/custom_login.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import '../conexoes.dart';

class SingUpScreen extends StatefulWidget {
  @override
  _SingUpScreenState createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();

  final RoundedLoadingButtonController _btnController =
      new RoundedLoadingButtonController();

  String? _emailTxt, _senhaTxt;
  Configs configs = new Configs();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 245, 245),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 60.0,
                    ),
                    Center(
                      child: Text(
                        "Artefato",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Butler",
                            fontStyle: FontStyle.normal,
                            fontSize: 68.0),
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Center(
                      child: Text(
                        "Cadastrar",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Butler",
                            fontStyle: FontStyle.normal,
                            fontSize: 22.0),
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
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
                        labelText: "E-mail",
                        filled: true,
                        fillColor: Color.fromARGB(255, 245, 245, 245),
                      ),
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
                      height: 20.0,
                    ),
                    TextFormField(
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontFamily: "Raleway",
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                        labelText: "Senha",
                        filled: true,
                        fillColor: Color.fromARGB(255, 245, 245, 245),
                      ),
                      validator: (text) {
                        if (text?.isEmpty == true) {
                          return "Este campo não pode ser vazio!";
                        } else
                          _senhaTxt = text;
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontFamily: "Raleway",
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                        labelText: "Confirme sua senha",
                        filled: true,
                        fillColor: Color.fromARGB(255, 245, 245, 245),
                      ),
                      validator: (text) {
                        if (text?.isEmpty == true) {
                          return "Este campo não pode ser vazio!";
                        } else
                          _senhaTxt = text;
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 48.0,
                    ),
                    SizedBox(height: 2.5),
                    SizedBox(
                      height: 48.0,
                      width: 146.0,
                      child: RoundedLoadingButton(
                        controller: _btnController,
                        valueColor: Colors.pink,
                        child: Text(
                          "Cadastrar",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Raleway",
                              fontStyle: FontStyle.normal,
                              fontSize: 16.0),
                        ),
                        color: Colors.brown,
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            Timer(
                              Duration(seconds: 1),
                              () async {
                                int responseLogin;
                                responseLogin =
                                    await postLogin(_emailTxt!, _senhaTxt!);
                                if (responseLogin == 1) {
                                  _btnController.success();
                                  Future.delayed(Duration(seconds: 2)).then(
                                    (_) {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  HomeScreen(configs)));
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
                    SizedBox(
                      height: 28.0,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: CustomLogin(),
                    ),
                    CustomForgetpass(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
