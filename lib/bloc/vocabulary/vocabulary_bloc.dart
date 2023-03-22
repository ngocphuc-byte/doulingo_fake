import 'package:bloc/bloc.dart';
import 'package:doulingo_fake/bloc/question/question_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';

part 'vocabulary_event.dart';
part 'vocabulary_state.dart';

class VocabularyBloc extends Bloc<VocabularyEvent, VocabularyState> {
  List vocabularyList = [];
  final vocabularyBox = Hive.box('vocabulary');
  VocabularyBloc() : super(VocabularyInitial()) {
    on<GetVocabulary>(_onHandleGetVocabulary);
    on<AddVocabulary>(_onHandleAddVocabulary);
    on<DeleteVocabulary>(_onHandleDeleteVocabulary);
  }

  Future<void> _onHandleGetVocabulary(
      GetVocabulary event, Emitter<VocabularyState> emit) async {
    emit(VocabularyLoading());
    final data = vocabularyBox.keys.map((key) {
      final item = vocabularyBox.get(key);
      return {
        'key': item['key'],
        'option': item['option'],
        'question': item['question']
      };
    }).toList();
    vocabularyList = data.reversed.toList();
    emit(VocabularyLoaded(vocabularyList: vocabularyList));
  }

  Future<void> _onHandleAddVocabulary(
      AddVocabulary event, Emitter<VocabularyState> emit) async {
    await vocabularyBox
        .add({'question': event.question, 'option': event.option});
    // emit(VocabularyLoading());
    // emit(VocabularyLoaded(vocabularyList: vocabularyList));
  }

  Future<void> _onHandleDeleteVocabulary(
      DeleteVocabulary event, Emitter<VocabularyState> emit) async {
    await vocabularyBox.deleteAt(event.key);
    emit(VocabularyLoading());
  }
}
