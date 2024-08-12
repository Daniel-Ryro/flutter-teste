import 'package:flutter/material.dart';

class FormSectionTitle extends StatelessWidget {
  final String title;
  final String subtitle;

  const FormSectionTitle({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8.0),
        Text(
          subtitle,
          style: const TextStyle(fontSize: 14.0, color: Colors.grey),
        ),
      ],
    );
  }
}
