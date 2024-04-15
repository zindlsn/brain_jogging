import 'package:bloc/bloc.dart';
import 'package:brain_jogging/infrastructure/word_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'word_event.dart';
part 'word_state.dart';

class WordBloc extends Bloc<WordEvent, WordState> {
  WordRepository wordRepository = GetIt.instance.get<WordRepository>();
  WordBloc() : super(WordInitial()) {
    on<InitializeWords>((event, emit) {
      int loadedWordsCount = 4;
      wordRepository.loadNextBerufe(loadedWordsCount);
      wordRepository.loadNextCities(loadedWordsCount);
      wordRepository.loadNextEssen(loadedWordsCount);
      wordRepository.loadNextObst(loadedWordsCount);
    });

    on<LoadWords>((event, emit) {
      emit(
        WordsLoaded(
            berufe: wordRepository.berufeToRemember,
            essen: wordRepository.essenToRemember,
            cities: wordRepository.citiesToRemember,
            obst: wordRepository.obstToRemember),
      );
    });
  }
}
