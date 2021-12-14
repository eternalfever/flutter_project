import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_project/pages/favorites.dart';
import 'package:flutter_project/pages/profile.dart';
import 'package:flutter_project/pages/users.dart';
import 'package:flutter_project/pages/weather.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  NavbarState createState() => NavbarState();
}

class NavbarState extends State<Navbar> {
  final myKey = GlobalKey<NavbarState>();
  int currentIndex = 1;
  int seletedItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Нижняя навигационная панель
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFFFFFFFF),
        unselectedItemColor: Colors.black54,
        selectedIconTheme: const IconThemeData(color: Color(0xFFACE881)),
        selectedLabelStyle: const TextStyle(color: Colors.grey),
        selectedItemColor: const Color(0xFFACE881),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle_rounded),
              label: 'Пользователи'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Избранные"),
          BottomNavigationBarItem(icon: Icon(Icons.cloud), label: "Погода"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Профиль"),
        ],
        currentIndex: seletedItem,
        onTap: (index) {
          setState(
            () {
              seletedItem = index;
            },
          );
        },
      ),
      body: IndexedStack(
        children: const [
          UsersPage(),
          FavoritesPage(),
          WeatherPage(),
          ProfilePage(),
        ],
        index: seletedItem,
      ),
    );
  }
}
