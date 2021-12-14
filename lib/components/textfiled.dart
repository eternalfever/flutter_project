import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String text;

  const MyTextField({
    Key? key,
    this.text = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: 58,
          width: double.infinity,
          child: TextField(
            style: const TextStyle(color: Colors.grey),
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFFE5E5E5),
              labelText: text,
              labelStyle: const TextStyle(color: Colors.grey),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ]));
}
