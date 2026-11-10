import '../entities/character_page.dart';

abstract interface class CharacterRepository {
  Future<CharacterPage> getCharacters({required int page});
}
