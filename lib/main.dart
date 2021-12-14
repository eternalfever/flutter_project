import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_project/models/users_provider.dart';
import 'package:flutter_project/pages/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UsersProvider>(
            create: (context) => UsersProvider())
      ],
      child: const MaterialApp(
        home: Scaffold(
          body: LoginPage(),
        ),
      ),
    );
  }
}
