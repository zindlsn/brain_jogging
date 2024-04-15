import 'package:brain_jogging/words.dart';

class WordRepository {
  List<String> berufeToRemember = [];
  List<String> obstToRemember = [];
  List<String> essenToRemember = [];
  List<String> citiesToRemember = [];

  Future<bool> loadNextBerufe(int amountOfWords) {
    for (int i = 0; i < amountOfWords; i++) {
      berufeToRemember.add(berufe[i]);
    }
    return Future.value(true);
  }

  Future<bool> loadNextCities(int amountOfWords) {
    for (int i = 0; i < amountOfWords; i++) {
      citiesToRemember.add(staedte[i]);
    }
    return Future.value(true);
  }

  Future<bool> loadNextEssen(int amountOfWords) {
    for (int i = 0; i < amountOfWords; i++) {
      essenToRemember.add(essen[i]);
    }
    return Future.value(true);
  }

  Future<bool> loadNextObst(int amountOfWords) {
    for (int i = 0; i < amountOfWords; i++) {
      obstToRemember.add(obst[i]);
    }
    return Future.value(true);
  }
}
