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

  // Страницы
  final pages = [
    UsersPage(),
    FavoritesPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: pages[seletedItem],
      ),

      // Нижняя навигационная панель
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFFFFFFFF),
        unselectedItemColor: Colors.black54,
        selectedIconTheme: IconThemeData(color: Color(0xFFA3FF72)),
        selectedLabelStyle: TextStyle(color: Colors.grey),
        selectedItemColor: Color(0xFFA3FF72),
        items: <BottomNavigationBarItem>[
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
    );
  }

  BottomNavigationBarItem navbarItem(String name, image, int index) {
    return BottomNavigationBarItem(
      icon: currentIndex == index
          ? Icon(Icons.cloud_circle_rounded)
          : Icon(Icons.cloud_circle_outlined),
      title: Text(
        name,
        style: TextStyle(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w600,
          fontSize: 12,
          color: currentIndex == index ? Color(0xFF333333) : null,
        ),
      ),
    );
  }
}
