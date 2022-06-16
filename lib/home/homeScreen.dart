// import 'package:shared_preferences/shared_preferences.dart';
import 'package:artefato/API%20REST/user/config.dart';
import 'package:artefato/home/data_mocks.dart';
import 'package:artefato/home/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import 'package:like_button/like_button.dart';

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
    List<Person> persons = [];
    Person people1 = Person();
    Person people2 = Person();
    Person people3 = Person();
    people1.setPersonImg("assets/person.jpg");
    people1.setNick("@Josy_silver");
    people1.setCity("new york | USA");
    people1.setStatus("indisponível");
    people1.setSale("não está à venda");
    people1.setMediaPublication("assets/img_pub.png");
    people1.setStatusPublication("19k curtidas - 1291 comentários");
    people1.setAuth("bottlebeach");
    people1.setDescription(
        "bottlebeach mais uma belissíma coleção de garrafinhas com as mais belas artes. Confira mais aqui na bio.");

    people2.setPersonImg("assets/person2.png");
    people2.setNick("@Josy_silver");
    people2.setCity("new york | USA");
    people2.setStatus("indisponível");
    people2.setSale("não está à venda");
    people2.setMediaPublication("assets/img_pub2.png");
    people2.setStatusPublication("19k curtidas - 1291 comentários");
    people2.setAuth("bottlebeach");
    people2.setDescription(
        "bottlebeach mais uma belissíma coleção de garrafinhas com as mais belas artes. Confira mais aqui na bio.");

    people3.setPersonImg("assets/person3.png");
    people3.setNick("@Josy_silver");
    people3.setCity("new york | USA");
    people3.setStatus("indisponível");
    people3.setSale("não está à venda");
    people3.setMediaPublication("assets/img_pub3.png");
    people3.setStatusPublication("19k curtidas - 1291 comentários");
    people3.setAuth("bottlebeach");
    people3.setDescription(
        "bottlebeach mais uma belissíma coleção de garrafinhas com as mais belas artes. Confira mais aqui na bio.");

    persons.add(people1);
    persons.add(people2);
    persons.add(people3);
    for (i = 0; i < persons.length; i++) {
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
                              persons[i].person_img!,
                            ).image,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            persons[i].nick!,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            persons[i].city!,
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 35),
                        child: Column(
                          children: [
                            Text(
                              persons[i].status!,
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              persons[i].sale!,
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
                          image: AssetImage(persons[i].media_publication!),
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
                                persons[i].status_publication!,
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
                              width: 160,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.grey.shade300),
                                color: Colors.white,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  LikeButton(
                                    likeCount: 0,
                                    circleColor: CircleColor(
                                        start: Colors.grey.shade700,
                                        end: Color(0xff0099cc)),
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
                                      color: Colors.blue.shade700,
                                    ),
                                    onPressed: () {
                                      Share.share(
                                        'Pensando em vender sua arte? Acesse https://example.com',
                                        subject: 'Olha que legal!!!',
                                        // sharePositionOrigin: ,
                                      );
                                    },
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
                      text: persons[i].auth!,
                      style: TextStyle(fontWeight: FontWeight.bold),
                      // default text style
                      children: <TextSpan>[
                        TextSpan(
                          text: " ",
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                        TextSpan(
                          text: persons[i].description!,
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
        body: ListView(
          // scrollDirection: Axis.horizontal,
          children: listCardsPublication,
        ),
      ),
    );
  }
}
