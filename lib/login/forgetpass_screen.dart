// import 'package:aurem_app/blocs/conexoes.dart';
// import 'package:aurem_app/common/notification/sendNotification.dart';
// import 'package:aurem_app/common/sizeConfig.dart';
// import 'package:flutter/material.dart';
// import 'package:rounded_loading_button/rounded_loading_button.dart';

// class ForgetPassword extends StatefulWidget {
//   @override
//   _ForgetPasswordState createState() => _ForgetPasswordState();
// }

// class _ForgetPasswordState extends State<ForgetPassword>
//     with SingleTickerProviderStateMixin {
//   final _formKey = GlobalKey<FormState>();

//   final RoundedLoadingButtonController _btnController =
//       new RoundedLoadingButtonController();

//   String _email;

//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     return Scaffold(
//       appBar: PreferredSize(
//         child: AppBar(
//           iconTheme: IconThemeData(
//             color: Color.fromARGB(155, 0, 0, 0),
//             size: SizeConfig.safeBlockHorizontal * 20.0,
//           ),
//           title: Text(
//             "Recuperar senha",
//             style: TextStyle(
//               fontSize: SizeConfig.safeBlockHorizontal * 22.0,
//               color: Color.fromARGB(155, 0, 0, 0),
//             ),
//           ),
//           backgroundColor: Colors.white,
//           centerTitle: true,
//         ),
//         preferredSize: Size.fromHeight(58),
//       ),
//       backgroundColor: Color.fromARGB(255, 245, 245, 245),
//       body: Stack(
//         children: <Widget>[
//           Positioned(
//             top: SizeConfig.safeBlockVertical * 250,
//             left: SizeConfig.safeBlockHorizontal * -380,
//             child: Image.asset(
//               "images/BackSingUp.png",
//               height: SizeConfig.safeBlockVertical * 600,
//             ),
//           ),
//           Container(
//             height: SizeConfig.safeBlockVertical * 1000,
//             width: SizeConfig.safeBlockHorizontal * 500,
//             padding: EdgeInsets.all(16.0),
//             child: SingleChildScrollView(
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   children: <Widget>[
//                     SizedBox(
//                       height: SizeConfig.safeBlockVertical * 13.0,
//                     ),
//                     Text(
//                       "Por favor, entre com o seu e-mail de cadastro para recuperar a sua senha.",
//                       style: TextStyle(
//                           color: Color.fromARGB(155, 0, 0, 0),
//                           fontWeight: FontWeight.w400,
//                           fontFamily: "Raleway",
//                           fontStyle: FontStyle.normal,
//                           fontSize: SizeConfig.safeBlockHorizontal * 16),
//                       textAlign: TextAlign.center,
//                     ),
//                     SizedBox(
//                       height: SizeConfig.safeBlockVertical * 24.0,
//                     ),
//                     SizedBox(
//                       width: SizeConfig.safeBlockHorizontal * 328.0,
//                       child: TextFormField(
//                         decoration: InputDecoration(
//                           labelText: "E-mail",
//                           labelStyle: TextStyle(
//                             color: Color.fromARGB(155, 0, 0, 0),
//                           ),
//                           filled: true,
//                           fillColor: Colors.white,
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(30),
//                             ),
//                           ),
//                         ),
//                         keyboardType: TextInputType.emailAddress,
//                         validator: (text) {
//                           if (text.isEmpty) {
//                             return "Este campo não pode ser vazio!";
//                           }
//                           Pattern pattern =
//                               r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
//                           RegExp regex = new RegExp(pattern);
//                           if (!regex.hasMatch(text))
//                             return 'E-mail inválido';
//                           else
//                             _email = text;
//                           return null;
//                         },
//                       ),
//                     ),
//                     SizedBox(
//                       height: SizeConfig.safeBlockVertical * 24,
//                     ),
//                     SizedBox(
//                       height: SizeConfig.safeBlockVertical * 48,
//                       width: SizeConfig.safeBlockHorizontal * 136,
//                       child: RoundedLoadingButton(
//                         controller: _btnController,
//                         child: Text(
//                           "Avançar",
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.w700,
//                               fontFamily: "Raleway",
//                               fontStyle: FontStyle.normal,
//                               fontSize: SizeConfig.safeBlockHorizontal * 16.0),
//                         ),
//                         color: Color.fromARGB(255, 0, 54, 171),
//                         onPressed: () async {
//                           if (_formKey.currentState.validate()) {
//                             int responseF;
//                             responseF = await postForgetPass(_email);
//                             if (responseF == 1) {
//                               _btnController.success();
//                               sendNotification(
//                                 text:
//                                     "E-mail enviado. Por favor, acesse sua conta para conseguir recuperar a sua senha!",
//                                 icon: Icons.email,
//                                 context: context,
//                                 size: 14,
//                               );
//                               Future.delayed(Duration(seconds: 3), () {
//                                 Navigator.pop(context);
//                               });
//                             } else if (responseF == 0) {
//                               sendNotification(
//                                 text: "E-mail inválido",
//                                 icon: Icons.warning,
//                                 context: context,
//                                 size: 16,
//                               );
//                               _btnController.reset();
//                             } else {
//                               sendNotification(
//                                 text:
//                                     "Sem conexão com o servidor, tente novamente em alguns instantes.",
//                                 icon: Icons.error,
//                                 context: context,
//                                 size: 14,
//                               );
//                               _btnController.reset();
//                             }
//                           } else {
//                             _btnController.reset();
//                           }
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
