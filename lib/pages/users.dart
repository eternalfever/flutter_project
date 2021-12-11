import 'package:flutter/material.dart';
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
      if (usersData != null) {
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
    return isLoaded
        ? Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.green,
              title: Text(
                'Пользователи',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            body: ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: Provider.of<UsersProvider>(context, listen: true)
                  .users
                  .length,
              itemBuilder: (BuildContext context, int index) {
                var user = Provider.of<UsersProvider>(context, listen: true)
                    .users[index];
                return Container(
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
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FittedBox(
                              child: Text(
                                '${user.firstName} ${user.lastName}',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Text(
                              user.email,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 12),
                      IconButton(
                        onPressed: () {
                          if (Provider.of<UsersProvider>(context, listen: false)
                              .users
                              .isNotEmpty) {
                            Provider.of<UsersProvider>(context, listen: false)
                                .users
                                .removeAt(index);
                            Provider.of<UsersProvider>(context, listen: false)
                                .updateProvider();
                          }
                        },
                        icon: Icon(Icons.favorite, color: Colors.red),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        : Center(child: CircularProgressIndicator(),);
  }
}
