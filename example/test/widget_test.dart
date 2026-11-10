import 'package:example/features/characters/domain/entities/character_page.dart';
import 'package:example/features/characters/domain/repositories/character_repository.dart';
import 'package:example/features/characters/domain/use_cases/get_characters.dart';
import 'package:example/features/characters/presentation/pages/characters_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('loads characters and navigates between pages', (
    WidgetTester tester,
  ) async {
    final repository = _FakeCharacterRepository();

    await tester.pumpWidget(
      MaterialApp(
        home: CharactersPage(getCharacters: GetCharacters(repository)),
      ),
    );
    await tester.pump();

    expect(find.text('Explora el multiverso'), findsOneWidget);
    expect(find.text('12 personajes encontrados'), findsOneWidget);
    expect(find.text('1 / 3'), findsOneWidget);

    await tester.tap(find.text('Siguiente'));
    await tester.pump();

    expect(repository.requestedPages, [1, 2]);
    expect(find.text('2 / 3'), findsOneWidget);
  });
}

class _FakeCharacterRepository implements CharacterRepository {
  final List<int> requestedPages = [];

  @override
  Future<CharacterPage> getCharacters({required int page}) async {
    requestedPages.add(page);
    return const CharacterPage(
      count: 12,
      pages: 3,
      next: 'https://rickandmortyapi.com/api/character?page=2',
      previous: null,
      results: [],
    );
  }
}
