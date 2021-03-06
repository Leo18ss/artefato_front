import 'package:artefato/home/config.dart';
import 'package:artefato/home/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class NewItemScreen extends StatefulWidget {
  Configs configs = Configs();
  NewItemScreen(this.configs);

  @override
  State<NewItemScreen> createState() => _NewItemScreenState();
}

class _NewItemScreenState extends State<NewItemScreen> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.configs.isDarkModeEnabled
          ? Colors.grey.shade800
          : Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor:
            widget.configs.isDarkModeEnabled ? Colors.black54 : Colors.pink,
        title: Text(
          "Artefato",
          style: GoogleFonts.playball(
            textStyle: TextStyle(fontSize: 38),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ConfigScreen(widget.configs),
                ),
              );
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Cadastro e Postagem",
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(fontSize: 32),
              ),
            ),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  "assets/cad_post.png",
                  width: MediaQuery.of(context).size.width * 0.8,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                style: TextStyle(),
                decoration: InputDecoration(
                  labelText: "T??tulo da Postagem",
                  filled: true,
                  fillColor: widget.configs.isDarkModeEnabled
                      ? Colors.grey.shade800
                      : Colors.grey.shade200,
                ),
                validator: (text) {
                  if (text?.isEmpty == true)
                    return "Este campo n??o pode ser vazio!";
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                style: TextStyle(),
                decoration: InputDecoration(
                  labelText: "Descri????o",
                  filled: true,
                  fillColor: widget.configs.isDarkModeEnabled
                      ? Colors.grey.shade800
                      : Colors.grey.shade200,
                ),
                validator: (text) {
                  if (text?.isEmpty == true)
                    return "Este campo n??o pode ser vazio!";
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                style: TextStyle(),
                decoration: InputDecoration(
                  labelText: "Nome do Produto",
                  filled: true,
                  fillColor: widget.configs.isDarkModeEnabled
                      ? Colors.grey.shade800
                      : Colors.grey.shade200,
                ),
                validator: (text) {
                  if (text?.isEmpty == true)
                    return "Este campo n??o pode ser vazio!";
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                style: TextStyle(),
                decoration: InputDecoration(
                  labelText: "Descri????o de Produto",
                  filled: true,
                  fillColor: widget.configs.isDarkModeEnabled
                      ? Colors.grey.shade800
                      : Colors.grey.shade200,
                ),
                validator: (text) {
                  if (text?.isEmpty == true)
                    return "Este campo n??o pode ser vazio!";
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                style: TextStyle(),
                decoration: InputDecoration(
                  labelText: "Pre??o",
                  filled: true,
                  fillColor: widget.configs.isDarkModeEnabled
                      ? Colors.grey.shade800
                      : Colors.grey.shade200,
                ),
                validator: (text) {
                  if (text?.isEmpty == true)
                    return "Este campo n??o pode ser vazio!";
                  return null;
                },
              ),
            ),
            Switch(
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                });
              },
              activeTrackColor: Colors.pink.shade100,
              activeColor: Colors.pink,
            ),
            Text(
              "Est?? dispon??vel para venda?",
              style: GoogleFonts.roboto(
                fontSize: 20,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 40),
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Cadastrar Produto e Publicar",
                    style: GoogleFonts.roboto(
                      fontSize: 20,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: widget.configs.isDarkModeEnabled
                        ? Colors.grey.shade600
                        : Colors.pink,
                    onPrimary: Colors.white,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
