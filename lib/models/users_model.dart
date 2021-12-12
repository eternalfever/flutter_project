class Users {
  Users({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
    this.liked = false,
  });

  int id;
  String email;
  String firstName;
  String lastName;
  String avatar;
  bool liked;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
    id: json["id"],
    email: json["email"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    avatar: json["avatar"],
  );

}

class Support {
  Support({
    required this.url,
    required this.text,
  });

  String url;
  String text;

  factory Support.fromJson(Map<String, dynamic> json) => Support(
    url: json["url"],
    text: json["text"],
  );
}