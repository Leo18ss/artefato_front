import 'package:artefato/home/home.dart';
import 'package:artefato/login/singup_screen%20copy.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ConfigScreen extends StatefulWidget {
  Configs configs = Configs();
  ConfigScreen(this.configs);

  @override
  State<ConfigScreen> createState() => _ConfigScreenState();
}

class _ConfigScreenState extends State<ConfigScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.configs.isDarkModeEnabled
          ? Colors.grey.shade800
          : Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor:
            widget.configs.isDarkModeEnabled ? Colors.black54 : Colors.pink,
        title: Text(
          "Artefato",
          style: GoogleFonts.playball(
            textStyle: TextStyle(fontSize: 38),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "Configuração",
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  fontSize: 36,
                  color: widget.configs.isDarkModeEnabled
                      ? Colors.white70
                      : Colors.grey.shade700,
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: widget.configs.isDarkModeEnabled
                        ? Colors.grey.shade600
                        : Colors.grey.shade300,
                  ),
                  child: Column(
                    children: [
                      DayNightSwitcherIcon(
                        isDarkModeEnabled: widget.configs.isDarkModeEnabled,
                        onStateChanged: (isDarkModeEnabled) {
                          setState(() {
                            widget.configs.setDarkMode(isDarkModeEnabled);
                          });
                        },
                        sunColor: Colors.amberAccent.shade200,
                        moonColor: Colors.yellow,
                        dayBackgroundColor: Colors.pink.shade400,
                      ),
                      Text(
                        widget.configs.isDarkModeEnabled
                            ? "Ativar modo claro"
                            : "Ativar modo escuro",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: widget.configs.isDarkModeEnabled
                              ? Colors.white70
                              : Colors.grey.shade700,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => SingUpScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "Sair da sua conta",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "Excluir sua conta",
                            style: GoogleFonts.roboto(
                              fontSize: 20,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red, //background color
                            onPrimary: Colors.white, //ripple color
                          )),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 120),
              child: Text(
                "Feito por:",
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: widget.configs.isDarkModeEnabled
                      ? Colors.white70
                      : Colors.grey.shade800,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                "Danilo Vidal Ribeiro;\nFrancielly Marianne Laranjo Silva;\nGabriel Moreira Peixoto Diniz;\nLeonardo Silva de Souza.",
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  color: widget.configs.isDarkModeEnabled
                      ? Colors.white60
                      : Colors.grey.shade800,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Image.asset(
                "assets/logo_inatel.png",
                width: MediaQuery.of(context).size.width * 0.65,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
