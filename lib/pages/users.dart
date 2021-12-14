import 'package:flutter/material.dart';
import 'package:flutter_project/components/user_card.dart';
import 'package:provider/provider.dart';
import 'package:flutter_project/models/userpage_model.dart';
import 'package:flutter_project/models/users_provider.dart';
import 'package:http/http.dart' as http;

class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  bool isLoaded = false;

  // Берем данные с сервера
  void getData() async {
    final response = await http.get(Uri.parse('https://reqres.in/api/users'),
        headers: {'Content-type': 'application/json'});
    if (response.statusCode == 200) {
      final usersData = usersFromJson(response.body);
      if (usersData.data.isNotEmpty) {
        Provider.of<UsersProvider>(context, listen: false).users =
            usersData.data;

        isLoaded = true;
        setState(() {});
      }
    } else {
      throw ('ошибка');
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var users = Provider.of<UsersProvider>(context, listen: true).users;
    return isLoaded
        ? Scaffold(
            drawer: Drawer(
              child: ListView(
                children: const [
                  DrawerHeader(
                    child: Text("Какой-то заголовок"),
                    decoration: BoxDecoration(color: Colors.green),
                  ),
                  ListTile(title: Text("Профиль")),
                  ListTile(title: Text("Сообщения")),
                  ListTile(title: Text("О себе")),
                  ListTile(title: Text("Настройки"))
                ],
              ),
            ),
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.green,
              title: const Text(
                'Пользователи',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            body: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: users.length,
              itemBuilder: (BuildContext context, int index) {
                var user = users[index];
                return InkWell(
                    onTap: () {
                      myModalSheet(context, user);
                    },
                    child: Container(
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
                                Provider.of<UsersProvider>(context,
                                        listen: false)
                                    .updateProvider();
                              },
                              icon: user.liked
                                  ? const Icon(Icons.favorite,
                                      color: Colors.red)
                                  : const Icon(Icons.favorite_border,
                                      color: Colors.red))
                        ],
                      ),
                    ));
              },
            ),
          )
        : const Center(
            child: CircularProgressIndicator(),
          );
  }
}
