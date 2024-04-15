part of 'word_bloc.dart';

@immutable
sealed class WordState {}

final class WordInitial extends WordState {}

final class WordsLoaded extends WordState {
  List<String> berufe;
  List<String> obst;
  List<String> essen;
  List<String> cities;

  WordsLoaded(
      {required this.berufe,
      required this.obst,
      required this.essen,
      required this.cities});
}
