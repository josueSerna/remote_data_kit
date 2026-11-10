import 'package:flutter/material.dart';

class CharactersIntro extends StatelessWidget {
  const CharactersIntro({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Explora el multiverso',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 6),
        Text(
          'Descubre los personajes de Rick and Morty.',
          style: TextStyle(color: Colors.grey.shade700),
        ),
      ],
    );
  }
}
