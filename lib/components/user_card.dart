import 'package:flutter/material.dart';

Widget userCard(image, txt) {
  return Dialog(
    child: Container(
        width: 400,
        height: 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.network(image),
            Text(txt),
          ],
        ),

    ),
  );
}
