import 'package:remote_data_kit/remote_data_kit.dart';

class CharacterRemoteDataSource {
  final ApiClient _client;

  CharacterRemoteDataSource({ApiClient? client})
    : _client =
          client ?? ApiClient(baseUrl: 'https://rickandmortyapi.com/api/');

  Future<Map<String, dynamic>> getCharacters({required int page}) async {
    final response = await _client.get(
      'character',
      queryParameters: {'page': page},
    );
    return response as Map<String, dynamic>;
  }
}
