// import 'package:shared_preferences/shared_preferences.dart';
import 'package:artefato/home/home.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  Configs configs = Configs();

  HomeScreen(this.configs);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final style = TextStyle(fontSize: 38);

  @override
  void initState() {
    //getValues();
    super.initState();
  }

  // List<Widget> RowUserStatus() {
  //   int j = 0;
  //   List<Widget> rowUserStatus = [];
  //   for (j = 0; j < 2; j++) {
  //     List<Widget> rowUserStatus = [];
  //     rowUserStatus.add(
  //       Container(
  //         decoration: BoxDecoration(
  //           color: Colors.white,
  //           shape: BoxShape.circle,
  //           boxShadow: [
  //             BoxShadow(
  //               blurRadius: 2,
  //               color: Colors.grey.shade400,
  //               spreadRadius: 3,
  //             )
  //           ],
  //         ),
  //         child: CircleAvatar(
  //           radius: 20,
  //           backgroundColor: Colors.red,
  //           backgroundImage: Image.asset(
  //             "assets/person.jpg",
  //           ).image,
  //         ),
  //       ),
  //     );
  //   }
  //   return rowUserStatus;
  // }

  List<Widget> ListCardsPublication(isDarkModeEnabled) {
    int i = 1;
    List<Widget> listCardsPublication = [];
    for (i = 0; i < 10; i++) {
      Color likedColor = Colors.red;
      listCardsPublication.add(
        Padding(
          padding:
              const EdgeInsets.only(top: 20, left: 35, right: 35, bottom: 20),
          child: Container(
            height: 480,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: Colors.grey.shade400),
              color: isDarkModeEnabled
                  ? Colors.grey.shade600
                  : Colors.grey.shade200,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Container(
                          decoration: BoxDecoration(
                            color: isDarkModeEnabled
                                ? Colors.black38
                                : Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 2,
                                  color: Colors.grey.shade400,
                                  spreadRadius: 3)
                            ],
                          ),
                          child: CircleAvatar(
                            radius: 20,
                            backgroundImage: Image.asset(
                              "assets/person.jpg",
                            ).image,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            "@Josy_silver",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "new york | USA",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 35),
                        child: Column(
                          children: [
                            Text(
                              "indisponível",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "não está à venda",
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Stack(
                  children: [
                    Column(
                      children: [
                        Image(
                          width: double.infinity,
                          image: AssetImage("assets/img_pub.png"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 25,
                            left: 20,
                            right: 20,
                          ),
                          child: Row(
                            children: [
                              Text(
                                "19k curtidas - 1291 comentários",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      bottom: 20,
                      right: -10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Container(
                              height: 40,
                              width: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.grey.shade300),
                                color: Colors.white,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      Icons.favorite,
                                      color: likedColor,
                                    ),
                                    onPressed: () {
                                      print("likedColor: $likedColor");
                                      print("Colors.grey: ${Colors.grey}");

                                      if (likedColor == Colors.grey) {
                                        setState(() {
                                          likedColor = Colors.red;
                                        });
                                      } else {
                                        setState(() {
                                          likedColor = Colors.grey;
                                        });
                                      }

                                      print(likedColor);
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.message,
                                      color: Colors.grey.shade700,
                                    ),
                                    onPressed: () => showDialog(
                                      barrierDismissible: true,
                                      context: context,
                                      builder: (_) => AlertDialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                        ),
                                        title: Center(
                                          child: Text(
                                            "Comentário",
                                          ),
                                        ),
                                        content: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.grey.shade400,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: TextField(
                                            keyboardType:
                                                TextInputType.multiline,
                                            textInputAction:
                                                TextInputAction.newline,
                                            minLines: 1,
                                            maxLines: 5,
                                          ),
                                        ),
                                        actions: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.of(context,
                                                            rootNavigator: true)
                                                        .pop('dialog');
                                                  },
                                                  child: Text("Cancelar"),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Colors.grey
                                                        .shade600, //background color
                                                    onPrimary: Colors
                                                        .white, //ripple color
                                                  )),
                                              ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.of(context,
                                                            rootNavigator: true)
                                                        .pop('dialog');
                                                  },
                                                  child: Text("  Enviar  "),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Colors.pink[
                                                        400], //background color
                                                    onPrimary: Colors
                                                        .white, //ripple color
                                                  ))
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.send,
                                      color: Colors.grey.shade700,
                                    ),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 20,
                  ),
                  child: Container(
                      child: Text.rich(
                    TextSpan(
                      text: "bottlebeach",
                      style: TextStyle(fontWeight: FontWeight.bold),
                      // default text style
                      children: <TextSpan>[
                        TextSpan(
                          text: " ",
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                        TextSpan(
                          text:
                              "bottlebeach mais uma belissíma coleção de garrafinhas com as mais belas artes. Confira mais aqui na bio.",
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  )),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return listCardsPublication;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> listCardsPublication =
        ListCardsPublication(widget.configs.isDarkModeEnabled);
    // List<Widget> rowUserStatus = RowUserStatus();

    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(color: const Color(0xFF253341)),
        scaffoldBackgroundColor: const Color(0xFF15202B),
      ),
      themeMode:
          widget.configs.isDarkModeEnabled ? ThemeMode.dark : ThemeMode.light,
      home: Scaffold(
        backgroundColor: widget.configs.isDarkModeEnabled
            ? Colors.grey.shade800
            : Colors.grey.shade300,
        appBar: AppBar(
          backgroundColor:
              widget.configs.isDarkModeEnabled ? Colors.black54 : Colors.pink,
          title: Text(
            "Artefato",
            style: GoogleFonts.playball(
              textStyle: style,
            ),
          ),
          actions: <Widget>[
            DayNightSwitcherIcon(
              isDarkModeEnabled: widget.configs.isDarkModeEnabled,
              onStateChanged: (isDarkModeEnabled) {
                setState(() {
                  widget.configs.setDarkMode(isDarkModeEnabled);
                });
              },
            ),
            IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onPressed: () {},
            )
          ],
        ),
        body: ListView(
          // scrollDirection: Axis.horizontal,
          children: listCardsPublication,
        ),
      ),
    );
  }
}
