// ignore_for_file: prefer_const_constructors
import 'dart:async';
import 'package:artefato/home/home.dart';
import 'package:artefato/login/login_screen.dart';
import 'package:artefato/login/widgets/custom_forgetpass.dart';
import 'package:artefato/login/widgets/custom_login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import '../API REST/user/conexoesUser.dart';

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
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Text(
                        "Artefato",
                        style: GoogleFonts.playball(
                          textStyle: TextStyle(fontSize: 64),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Text(
                        "Cadastrar",
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 30, right: 30),
                      child: TextFormField(
                        obscureText: false,
                        keyboardType: TextInputType.visiblePassword,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontFamily: "Raleway",
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: InputDecoration(
                          labelText: "Nome",
                          filled: true,
                          fillColor: Color.fromARGB(255, 245, 245, 245),
                        ),
                        validator: (text) {
                          if (text?.isEmpty == true) {
                            return "Este campo n??o pode ser vazio!";
                          } else
                            _senhaTxt = text;
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 30, right: 30),
                      child: TextFormField(
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
                            return "Este campo n??o pode ser vazio!";
                          }
                          RegExp regex = RegExp(
                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
                          if (!regex.hasMatch(text!))
                            return 'E-Mail inv??lido';
                          else
                            _emailTxt = text;
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 30, right: 30),
                      child: TextFormField(
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
                            return "Este campo n??o pode ser vazio!";
                          } else
                            _senhaTxt = text;
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 30, right: 30),
                      child: TextFormField(
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
                            return "Este campo n??o pode ser vazio!";
                          } else
                            _senhaTxt = text;
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Container(
                        width: 200,
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
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginScreen()));
                                      },
                                    );
                                  } else {
                                    _btnController.error();
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
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Align(
                        alignment: Alignment.center,
                        child: CustomLogin(),
                      ),
                    ),
                    CustomForgetpass(),
                    SizedBox(
                      height: 20,
                    ),
                    Image.asset(
                      "assets/img_create_account.png",
                      width: MediaQuery.of(context).size.width * 0.5,
                    ),
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
