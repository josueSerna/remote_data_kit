import 'package:flutter/material.dart';

class CharactersLoadingView extends StatelessWidget {
  const CharactersLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rick & Morty Explorer')),
      body: const Center(child: CircularProgressIndicator()),
    );
  }
}
