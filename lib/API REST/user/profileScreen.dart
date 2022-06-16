import 'package:artefato/API%20REST/user/config.dart';
import 'package:artefato/home/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatefulWidget {
  Configs configs = Configs();
  ProfileScreen(this.configs);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                "Perfil",
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(fontSize: 36),
              ),
            ),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  "assets/profile.png",
                  width: MediaQuery.of(context).size.width * 0.8,
                ),
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
                    return "Este campo não pode ser vazio!";
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                style: TextStyle(),
                decoration: InputDecoration(
                  labelText: "E-mail para contato",
                  filled: true,
                  fillColor: widget.configs.isDarkModeEnabled
                      ? Colors.grey.shade800
                      : Colors.grey.shade200,
                ),
                validator: (text) {
                  if (text?.isEmpty == true)
                    return "Este campo não pode ser vazio!";
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
                    return "Este campo não pode ser vazio!";
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                style: TextStyle(),
                decoration: InputDecoration(
                  labelText: "Descrição do Produto",
                  filled: true,
                  fillColor: widget.configs.isDarkModeEnabled
                      ? Colors.grey.shade800
                      : Colors.grey.shade200,
                ),
                validator: (text) {
                  if (text?.isEmpty == true)
                    return "Este campo não pode ser vazio!";
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                style: TextStyle(),
                decoration: InputDecoration(
                  labelText: "Preço",
                  filled: true,
                  fillColor: widget.configs.isDarkModeEnabled
                      ? Colors.grey.shade800
                      : Colors.grey.shade200,
                ),
                validator: (text) {
                  if (text?.isEmpty == true)
                    return "Este campo não pode ser vazio!";
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Salvar Alterações",
                    style: GoogleFonts.roboto(
                      fontSize: 20,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: widget.configs.isDarkModeEnabled
                        ? Colors.grey.shade600
                        : Colors.pink, //background color
                    onPrimary: Colors.white, //ripple color
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
