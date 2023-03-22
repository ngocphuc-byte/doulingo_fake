part of 'question_bloc.dart';

abstract class QuestionEvent extends Equatable {
  const QuestionEvent();

  @override
  List<Object> get props => [];
}

class GetQuestion extends QuestionEvent {
  String id;
  GetQuestion({required this.id});
}

class OutScreenQuestion extends QuestionEvent {}
