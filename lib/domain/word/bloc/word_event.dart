part of 'word_bloc.dart';

@immutable
sealed class WordEvent {}

class LoadWords extends WordEvent {}
class InitializeWords extends WordEvent {}
