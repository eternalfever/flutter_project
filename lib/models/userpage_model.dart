import 'dart:convert';

import 'package:flutter_project/models/users_model.dart';

UsersPage usersFromJson(String str) => UsersPage.fromJson(json.decode(str));

class UsersPage {
  UsersPage({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
    required this.support,
  });

  int page;
  int perPage;
  int total;
  int totalPages;
  List<Users> data;
  Support support;

  factory UsersPage.fromJson(Map<String, dynamic> json) => UsersPage(
        page: json["page"],
        perPage: json["per_page"],
        total: json["total"],
        totalPages: json["total_pages"],
        data: List<Users>.from(json["data"].map((x) => Users.fromJson(x))),
        support: Support.fromJson(json["support"]),
      );
}
