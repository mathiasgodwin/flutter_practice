import 'package:dio/dio.dart';
import 'package:flutjoke/src/features/jokes/data/models/joke_model.dart';

abstract class IJokesRepository {
  Future<JokeModel> getJoke();
}

class JokesRepository implements IJokesRepository {
  final _dioClient = Dio();
  final url = 'https://v2.jokeapi.dev/joke/Programming?type=twopart';

  @override
  Future<JokeModel> getJoke() async {
    try {
      final result = await _dioClient.get(url);
      if (result.statusCode == 200) {
        return JokeModel.fromJson(result.data);
      } else {
        throw Exception();
      }
    } catch (_) {
      throw Exception();
    }
  }
}
