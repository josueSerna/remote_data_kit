import 'package:flutter/material.dart';

import '../features/characters/data/datasources/character_remote_data_source.dart';
import '../features/characters/data/repositories/character_repository_impl.dart';
import '../features/characters/domain/use_cases/get_characters.dart';
import '../features/characters/presentation/pages/characters_page.dart';

class RickMortyApp extends StatelessWidget {
  const RickMortyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final getCharacters = GetCharacters(
      CharacterRepositoryImpl(CharacterRemoteDataSource()),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rick & Morty Explorer',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF58A66A)),
        scaffoldBackgroundColor: const Color(0xFFF4F7F4),
      ),
      home: CharactersPage(getCharacters: getCharacters),
    );
  }
}
