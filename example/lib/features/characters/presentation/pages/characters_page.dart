import 'package:flutter/material.dart';

import '../../domain/entities/character_page.dart';
import '../../domain/errors/character_load_exception.dart';
import '../../domain/use_cases/get_characters.dart';
import '../widgets/character_card.dart';
import '../widgets/characters_error_view.dart';
import '../widgets/characters_intro.dart';
import '../widgets/characters_loading_view.dart';
import '../widgets/characters_pagination.dart';
import '../widgets/explorer_app_bar.dart';

class CharactersPage extends StatefulWidget {
  final GetCharacters getCharacters;

  const CharactersPage({super.key, required this.getCharacters});

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  CharacterPage? _response;
  bool _isLoading = false;
  String? _error;
  int _currentPage = 1;

  @override
  void initState() {
    super.initState();
    _loadCharacters();
  }

  Future<void> _loadCharacters({int page = 1}) async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final result = await widget.getCharacters(page: page);
      if (!mounted) return;

      setState(() {
        _response = result;
        _currentPage = page;
        _isLoading = false;
      });
    } on CharacterLoadException catch (error) {
      if (!mounted) return;

      setState(() {
        _error = error.message;
        _isLoading = false;
      });
    } catch (error) {
      if (!mounted) return;

      setState(() {
        _error = 'Ocurrió un error inesperado.';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading && _response == null) {
      return const CharactersLoadingView();
    }

    return Scaffold(
      appBar: const ExplorerAppBar(),
      body: RefreshIndicator(
        onRefresh: () => _loadCharacters(page: _currentPage),
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            if (_isLoading) const LinearProgressIndicator(),
            const CharactersIntro(),
            const SizedBox(height: 20),
            if (_error != null && _response == null)
              CharactersErrorView(
                message: _error ?? 'Intenta nuevamente.',
                onRetry: () => _loadCharacters(page: _currentPage),
              ),
            if (_error != null && _response != null)
              Text(_error!, style: const TextStyle(color: Colors.red)),
            if (_response != null) ...[
              Text(
                '${_response!.count} personajes encontrados',
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),
              for (final character in _response!.results) ...[
                CharacterCard(character: character),
                const SizedBox(height: 10),
              ],
              CharactersPagination(
                currentPage: _currentPage,
                totalPages: _response!.pages,
                hasPrevious: _response!.previous != null,
                hasNext: _response!.next != null,
                isLoading: _isLoading,
                onPrevious: () => _loadCharacters(page: _currentPage - 1),
                onNext: () => _loadCharacters(page: _currentPage + 1),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
