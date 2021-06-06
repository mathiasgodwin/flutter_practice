part of 'jokes_provider.dart';

class JokesNotifier extends StateNotifier<JokesState> {
  JokesNotifier({
    required IJokesRepository jokesRepository,
  }) : _jokesRepository = jokesRepository,
      super(const JokesState.initial());
  final IJokesRepository _jokesRepository;

  Future<void> getJoke() async {
    state = const JokesState.loading();

    try {
      final joke = await _jokesRepository.getJoke();
      state = JokesState.data(joke: joke);
    } catch (_) {
      state = JokesState.error('Error');
    }
  }
}