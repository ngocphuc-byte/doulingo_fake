import 'package:doulingo_fake/data/provider/question_provider.dart';
import 'package:doulingo_fake/models/question_model.dart';

class QuestionRepo {
  QuestionProvider questionProvider = QuestionProvider();
  Future<QuestionModel> getQuestionRepo({ required String id}) async {
    return questionProvider.getQuestion(id);
  }
}