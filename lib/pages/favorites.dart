import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_project/models/userpage_model.dart';
import 'package:flutter_project/models/users_provider.dart';
import 'package:http/http.dart' as http;

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'Мои избранные',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount:
            Provider.of<UsersProvider>(context, listen: true).favorites.length,
        itemBuilder: (BuildContext context, int index) {
          var user = Provider.of<UsersProvider>(context, listen: true)
              .favorites[index];
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
                    Provider.of<UsersProvider>(context, listen: false)
                        .favorites
                        .removeAt(index);
                    Provider.of<UsersProvider>(context, listen: false)
                        .updateProvider();
                  },
                  icon: Icon(Icons.delete, color: Colors.grey),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
