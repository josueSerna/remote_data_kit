import '../entities/character_page.dart';
import '../repositories/character_repository.dart';

class GetCharacters {
  final CharacterRepository _repository;

  const GetCharacters(this._repository);

  Future<CharacterPage> call({required int page}) {
    return _repository.getCharacters(page: page);
  }
}
