part of 'vocabulary_bloc.dart';

abstract class VocabularyEvent extends Equatable {
  const VocabularyEvent();

  @override
  List<Object> get props => [];
}

class GetVocabulary extends VocabularyEvent {}

class AddVocabulary extends VocabularyEvent {
  String question, option;
  AddVocabulary({required this.question, required this.option});
}

class DeleteVocabulary extends VocabularyEvent {
  int key;
  DeleteVocabulary({required this.key});
}
