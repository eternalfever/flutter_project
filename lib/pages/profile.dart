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
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Мой профиль'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const CircleAvatar(
                backgroundColor: Color(0xFFA3FF72),
                child: Icon(
                  Icons.person,
                  color: Colors.black12,
                  size: 100,
                ),
                minRadius: 80,
              ),
              const Text('Кузьмина Анастасия', style: TextStyle(fontSize: 20)),
              const Text('Группа: ПИЭ-11МО',
                  style: TextStyle(fontSize: 16, color: Colors.grey)),
              SizedBox(height: 20),
              info('myemail@gmail.com', Icons.email),
              info('Россия, Ярославль', Icons.location_on),
              info('+7 (800) 555-35-35', Icons.phone),
              SizedBox(height: 20),
              for (int i = 0; i < settings.length; i++)
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(settings[i]),
                          Icon(Icons.arrow_forward_ios_rounded),
                        ],
                      ),
                    ),
                    Divider()
                  ],
                ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget info(String txt, IconData icn) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Icon(
            icn,
            color: Colors.grey,
          ),
          const SizedBox(width: 10),
          Text(txt, style: TextStyle(color: Colors.grey))
        ],
      ),
    );
  }
}
