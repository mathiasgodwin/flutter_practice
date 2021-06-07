import 'package:flutjoke/src/features/jokes/data/repositories/jokes_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'jokes_state.dart';
export 'jokes_state.dart';

part 'jokes_state_notifier.dart';

/// Dependency Injection

//* Logic / StateNotifier
final JokesNotifierProvider = StateNotifierProvider<JokesNotifier, JokesState>(
  (ref) => JokesNotifier(
    jokesRepository: ref.watch(_jokesRepositoryProvider),
  ),
);

//* Repository
final _jokesRepositoryProvider = Provider<IJokesRepository>(
  (ref) => JokesRepository(),
);
