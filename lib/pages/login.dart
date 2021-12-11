import 'package:flutter/material.dart';
import 'package:flutter_project/components/button.dart';
import 'package:flutter_project/components/textfiled.dart';
import 'package:flutter_project/pages/register.dart';

import 'navigation.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Войти в аккаунт', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            MyTextField(text: 'Логин'),
            SizedBox(height: 20),
            MyTextField(text: 'Пароль'),
            SizedBox(height: 20),
            MyButton(
                text: 'Войти',
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Navbar()));
                }),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RegisterPage()));
                },
                child: Text('регистрация'))
          ],
        ),
      ),
    );
  }
}
