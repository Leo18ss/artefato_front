// ignore_for_file: prefer_const_constructors
import 'dart:async';
import 'package:artefato/login/login_screen.dart';
import 'package:artefato/login/widgets/custom_login.dart';
import 'package:artefato/login/widgets/custom_signUp.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import '../API REST/conexoes_antigas.dart';

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
      backgroundColor: Color.fromARGB(255, 245, 245, 245),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
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
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(
                        "Recuperar senha",
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 15, left: 30, right: 30),
                      child: Container(
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
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Container(
                        width: 200,
                        child: RoundedLoadingButton(
                          controller: _btnController,
                          valueColor: Colors.pink,
                          child: Text(
                            "Entrar",
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
                                      await postForgetPass(_emailTxt!);
                                  if (responseLogin == 1) {
                                    _btnController.success();
                                    Future.delayed(Duration(seconds: 2)).then(
                                      (_) {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginScreen()));
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
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: CustomLogin(),
                    ),
                    CustomSignUp(),
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Image.asset(
                        "assets/img_recover_account.png",
                        width: MediaQuery.of(context).size.width * 0.7,
                      ),
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
