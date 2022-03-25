import 'package:flutter/material.dart';

class CustomLoginTextField extends StatelessWidget {
  
  final bool obscure;
  final IconData icon;
  final TextInputType typeInput;
  final Function func;

  CustomLoginTextField({required this.obscure, required this.icon, required this.typeInput, required this.func});

  @override
  Widget build(BuildContext context) {
    
    return Container(
      child: TextFormField(
        obscureText: obscure,
        keyboardType: typeInput,
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
          prefixIcon: Icon(
            icon,
            color: Color.fromARGB(155, 0, 54, 171),
            size: 20.0,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
        ),
        validator: func(),
      ),
    );
  }
}