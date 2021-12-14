import 'package:flutter/material.dart';
import 'package:flutter_project/components/userinfo_tile.dart';
import 'package:flutter_project/models/users_model.dart';

/// Модальное окно
myModalSheet(context, Users user) {
  return showModalBottomSheet(
    backgroundColor: Colors.grey.withOpacity(0.2),
    isScrollControlled: true,
    context: context,
    builder: (_) {
      return SizedBox(
        height: 350,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              height: 350,
              width: 600,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(16)),
                    width: 50,
                    height: 4,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      '${user.firstName} ${user.lastName}',
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// Контент
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(user.avatar),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          personInfo(icon: Icons.map, text: 'Ярославль'),
                          personInfo(icon: Icons.house, text: 'ЯрГУ'),
                          personInfo(
                              icon: Icons.phone, text: '+7 800 555 35 35'),
                          personInfo(icon: Icons.email, text: user.email),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
