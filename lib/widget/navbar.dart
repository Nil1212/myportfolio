import 'package:flutter/material.dart';

Widget _navItem(String label) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: TextButton(
      onPressed: () {
        // handle navigation
      },
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.black87,
          fontSize: 16,
        ),
      ),
    ),
  );
}