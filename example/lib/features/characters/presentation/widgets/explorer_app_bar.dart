import 'package:flutter/material.dart';

class ExplorerAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ExplorerAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Rick & Morty Explorer',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      backgroundColor: const Color(0xFFE2F1E4),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
