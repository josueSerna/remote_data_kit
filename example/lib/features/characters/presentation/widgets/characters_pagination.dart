import 'package:flutter/material.dart';

class CharactersPagination extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final bool hasPrevious;
  final bool hasNext;
  final bool isLoading;
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  const CharactersPagination({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.hasPrevious,
    required this.hasNext,
    required this.isLoading,
    required this.onPrevious,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          OutlinedButton.icon(
            onPressed: !hasPrevious || isLoading ? null : onPrevious,
            icon: const Icon(Icons.arrow_back),
            label: const Text('Anterior'),
          ),
          Text(
            '$currentPage / $totalPages',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          FilledButton.icon(
            onPressed: !hasNext || isLoading ? null : onNext,
            icon: const Icon(Icons.arrow_forward),
            label: const Text('Siguiente'),
          ),
        ],
      ),
    );
  }
}
