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
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.7,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Добро пожаловать!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              const Text('Введите данные \nвойдите в свой аккаунт',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                  textAlign: TextAlign.center),
              const SizedBox(height: 30),
              const MyTextField(text: 'Логин'),
              const MyTextField(text: 'Пароль'),
              const SizedBox(height: 20),
              MyButton(
                  text: 'Войти',
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Navbar()));
                  }),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterPage()));
                  },
                  child: const Text('регистрация'))
            ],
          ),
        ),
      ),
    );
  }
}
