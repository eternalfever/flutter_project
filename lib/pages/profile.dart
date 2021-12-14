import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var settings = ['Аккаунт', 'Статистика', 'Выход из аккаунта'];

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
        title: const Text('Мой профиль'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  const CircleAvatar(
                    backgroundColor: Color(0xFFACE881),
                    child: Icon(
                      Icons.person,
                      color: Colors.black12,
                      size: 100,
                    ),
                    minRadius: 80,
                  ),
                  const SizedBox(height: 20),
                  const Text('Кузьмина Анастасия',
                      style: TextStyle(fontSize: 20)),
                  const SizedBox(height: 10),
                  const Text('Группа: ПИЭ-11МО',
                      style: TextStyle(fontSize: 14, color: Colors.grey)),
                  const SizedBox(height: 20),
                  info('myemail@gmail.com', Icons.email),
                  info('Россия, Ярославль', Icons.location_on),
                  info('+7 (800) 555-35-35', Icons.phone),
                  const SizedBox(height: 20),
                  for (int i = 0; i < settings.length; i++)
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(settings[i]),
                              const Icon(Icons.arrow_forward_ios_rounded),
                            ],
                          ),
                        ),
                        const Divider(thickness: 1, color: Colors.grey),
                      ],
                    ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget info(String txt, IconData icn) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Icon(
            icn,
            color: Colors.grey,
          ),
          const SizedBox(width: 10),
          Text(txt, style: const TextStyle(color: Colors.grey))
        ],
      ),
    );
  }
}
