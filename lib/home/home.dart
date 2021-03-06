import 'package:artefato/home/newItemScreen.dart';
import 'package:artefato/home/profileScreen.dart';
import 'package:artefato/home/homeScreen.dart';
import 'package:artefato/home/profileScreen.dart';
import 'package:artefato/login/singup_screen%20copy.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class Configs {
  bool isDarkModeEnabled = false;

  void setDarkMode(bool value) {
    isDarkModeEnabled = value;
  }
}

class _HomeState extends State<Home> {
  int currentPage = 1;
  GlobalKey bottomNavigationKey = GlobalKey();
  Configs configs = Configs();

  @override
  Widget build(BuildContext context) {
    print("configs.isDarkModeEnabled: ${configs.isDarkModeEnabled}");
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(color: const Color(0xFF253341)),
        scaffoldBackgroundColor: const Color(0xFF15202B),
      ),
      themeMode: configs.isDarkModeEnabled ? ThemeMode.dark : ThemeMode.light,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Center(
            child: _getPage(currentPage),
          ),
        ),
        bottomNavigationBar: configs.isDarkModeEnabled
            ? FancyBottomNavigation(
                barBackgroundColor: Colors.grey.shade700,
                circleColor: Colors.purple.shade700,
                textColor: Colors.white,
                inactiveIconColor: Colors.white,
                activeIconColor: Colors.white,
                tabs: [
                  TabData(
                    iconData: Icons.add_box_outlined,
                    title: "Novo Item",
                    onclick: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(configs),
                      ),
                    ),
                  ),
                  TabData(
                      iconData: Icons.home,
                      title: "Home",
                      onclick: () {
                        final FancyBottomNavigationState fState =
                            bottomNavigationKey.currentState
                                as FancyBottomNavigationState;
                        fState.setPage(2);
                      }),
                  TabData(
                    iconData: Icons.person,
                    title: "Configura????es",
                  )
                ],
                initialSelection: 1,
                key: bottomNavigationKey,
                onTabChangedListener: (position) {
                  setState(() {
                    currentPage = position;
                  });
                },
              )
            : FancyBottomNavigation(
                barBackgroundColor: Colors.pink,
                circleColor: Colors.purple.shade700,
                textColor: Colors.white,
                inactiveIconColor: Colors.white,
                tabs: [
                  TabData(
                    iconData: Icons.add_box_outlined,
                    title: "Novo Item",
                    onclick: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(configs),
                      ),
                    ),
                  ),
                  TabData(
                      iconData: Icons.home,
                      title: "Feed",
                      onclick: () {
                        final FancyBottomNavigationState fState =
                            bottomNavigationKey.currentState
                                as FancyBottomNavigationState;
                        fState.setPage(2);
                      }),
                  TabData(
                    iconData: Icons.person,
                    title: "Perfil",
                  )
                ],
                initialSelection: 1,
                key: bottomNavigationKey,
                onTabChangedListener: (position) {
                  setState(() {
                    currentPage = position;
                  });
                },
              ),
      ),
    );
  }

  _getPage(int page) {
    switch (page) {
      case 0:
        return NewItemScreen(configs);
      case 1:
        return HomeScreen(configs);
      default:
        // return ConfigScreen();
        return ProfileScreen(configs);
    }
  }
}
