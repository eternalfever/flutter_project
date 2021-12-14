import 'package:flutter/material.dart';

personInfo({required IconData icon, required String text}) => Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: Colors.grey,
          ),
          const SizedBox(width: 8),
          FittedBox(
            child: Text(text,
                style: const TextStyle(color: Colors.grey, fontSize: 14)),
          )
        ],
      ),
    );
