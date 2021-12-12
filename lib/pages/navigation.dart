import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_project/pages/favorites.dart';
import 'package:flutter_project/pages/profile.dart';
import 'package:flutter_project/pages/users.dart';

class Navbar extends StatefulWidget {
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
        backgroundColor: Color(0xFFFFFFFF),
        unselectedItemColor: Colors.black54,
        selectedIconTheme: IconThemeData(color: Color(0xFFA3FF72)),
        selectedLabelStyle: TextStyle(color: Colors.grey),
        selectedItemColor: Color(0xFFA3FF72),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle_rounded),
              label: 'Пользователи'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Избранные"),
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
        children: [
          UsersPage(),
          FavoritesPage(),
          ProfilePage(),
        ],
        index: seletedItem,
      ),
    );
  }
}
