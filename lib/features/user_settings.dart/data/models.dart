import 'package:flutter/material.dart';

class Contact {
  final String name;
  final String email;
  final String imagePath;
  final List<IconData> icons;

  Contact({
    required this.name,
    required this.email,
    required this.imagePath,
    required this.icons,
  });
}