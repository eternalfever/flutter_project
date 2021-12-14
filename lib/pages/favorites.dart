import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_project/models/users_provider.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(
          child: ListView(children: const [
        DrawerHeader(
          child: Text("Какой-то заголовок"),
          decoration: BoxDecoration(color: Colors.green),
        ),
        ListTile(title: Text("Профиль")),
        ListTile(title: Text("Сообщения")),
        ListTile(title: Text("О себе")),
        ListTile(title: Text("Настройки"))
      ])),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          'Мои избранные',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount:
            Provider.of<UsersProvider>(context, listen: true).users.length,
        itemBuilder: (BuildContext context, int index) {
          var user =
              Provider.of<UsersProvider>(context, listen: true).users[index];
          return user.liked
              ? Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.white,
                  width: double.infinity,
                  height: 72,
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(user.avatar),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FittedBox(
                              child: Text(
                                '${user.firstName} ${user.lastName}',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Text(
                              user.email,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      IconButton(
                        onPressed: () {
                          user.liked = !user.liked;
                          Provider.of<UsersProvider>(context, listen: false)
                              .updateProvider();
                        },
                        icon: const Icon(Icons.delete, color: Colors.grey),
                      ),
                    ],
                  ),
                )
              : Container();
        },
      ),
    );
  }
}
