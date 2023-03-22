part of 'vocabulary_bloc.dart';

abstract class VocabularyState extends Equatable {
  const VocabularyState();

  @override
  List<Object> get props => [];
}

class VocabularyInitial extends VocabularyState {}

class VocabularyLoading extends VocabularyState {}

class VocabularyLoaded extends VocabularyState {
  List vocabularyList = [];
  VocabularyLoaded({required this.vocabularyList});
}
