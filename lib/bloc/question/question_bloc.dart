import 'package:bloc/bloc.dart';
import 'package:doulingo_fake/data/repository/question_repo.dart';
import 'package:doulingo_fake/models/question_model.dart';
import 'package:equatable/equatable.dart';

part 'question_event.dart';
part 'question_state.dart';

class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {
  QuestionRepo repo = QuestionRepo();
  List<QuestionModel> questionList = [];
  QuestionBloc() : super(QuestionInitial()) {
    on<GetQuestion>(_onGetQuestion);
    on<OutScreenQuestion>(_onOutQuestion);
  }
  Future _onGetQuestion(GetQuestion event, Emitter<QuestionState> state) async {
    emit(QuestionLoading());
    QuestionModel questionModel = await repo.getQuestionRepo(id: event.id);
    questionList.add(questionModel);
    if (questionList.length == 9) {
      emit(QuestionLoaded(questionList: questionList));
    }
  }

  Future _onOutQuestion(
      OutScreenQuestion event, Emitter<QuestionState> state) async {
    questionList = [];
    emit(QuestionLoading());
  }

  Future _onGetAllQuestion() async {
    
  }

}
