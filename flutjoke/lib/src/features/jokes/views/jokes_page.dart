import 'package:flutter/material.dart';
import 'package:flutjoke/src/features/jokes/logic/jokes_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// JokesPage
class JokesPage extends StatelessWidget {
  /// JokesPage constructor
  const JokesPage({Key? key}) : super(key: key);

  /// JokesPage [routeName]
  static const routeName = 'JokesPage';

  /// Router for JokesPage
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const JokesPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Jokes'),
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _JokeConsumer(),
              const SizedBox(
                height: 50,
              ),
              _ButtonConsumer(),
            ],
          )),
    );
  }
}

class _JokeConsumer extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final state = watch(JokesNotifierProvider);

    return state.when(
      initial: () => Text(
        'Press the button to start',
        textAlign: TextAlign.center,
      ),
      loading: () => Center(
        child: LinearProgressIndicator(),
      ),
      data: (joke) => SizedBox(
        height: 50,
        width: 20,
        child: Card(
        child: Center(
            child: Text(
          '${joke.setup}\n\t\t\t${joke.delivery}',
          style: TextStyle(color: Colors.black),
        )),
        shadowColor: Colors.deepPurple,
        elevation: 2,
        
      )),
      error: (error) => Text('Error Occured!'),
    );
  }
}

class _ButtonConsumer extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final state = watch(JokesNotifierProvider);
    return ElevatedButton(
      child: Text('Press to get a joke'),
      onPressed: !state.isLoading
          ? () {
              context.read(JokesNotifierProvider.notifier).getJoke();
            }
          : null,
    );
  }
}
