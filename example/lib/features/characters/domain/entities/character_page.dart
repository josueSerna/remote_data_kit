import 'character.dart';

class CharacterPage {
  final int count;
  final int pages;
  final String? next;
  final String? previous;
  final List<Character> results;

  const CharacterPage({
    required this.count,
    required this.pages,
    this.next,
    this.previous,
    required this.results,
  });
}
