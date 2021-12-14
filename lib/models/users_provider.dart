import 'package:flutter/material.dart';
import 'package:flutter_project/models/users_model.dart';

class UsersProvider extends ChangeNotifier {
  List<Users> users = [];

  void updateProvider() {
    notifyListeners();
  }
}
