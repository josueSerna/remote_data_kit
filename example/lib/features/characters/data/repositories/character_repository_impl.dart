import 'package:remote_data_kit/remote_data_kit.dart';

import '../../domain/entities/character.dart';
import '../../domain/entities/character_page.dart';
import '../../domain/errors/character_load_exception.dart';
import '../../domain/repositories/character_repository.dart';
import '../datasources/character_remote_data_source.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final CharacterRemoteDataSource _remoteDataSource;

  const CharacterRepositoryImpl(this._remoteDataSource);

  @override
  Future<CharacterPage> getCharacters({required int page}) async {
    try {
      final response = await _remoteDataSource.getCharacters(page: page);
      final result = PaginatedResponse<Character>.fromJson(
        response,
        Character.fromJson,
      );

      return CharacterPage(
        count: result.count,
        pages: result.pages,
        next: result.next,
        previous: result.previous,
        results: result.results,
      );
    } on ApiException catch (error) {
      throw CharacterLoadException(error.message);
    }
  }
}
