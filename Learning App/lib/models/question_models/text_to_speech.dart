import 'package:learnkuy/models/question_model.dart';

class TextToSpeechQuestion extends QuestionModel {
  List<String> questionList;

  TextToSpeechQuestion(
      {required this.questionList,
      required String questionId,
      required QuestionType questionType})
      : super(questionId: questionId, questionType: questionType);
}

TextToSpeechQuestion textSpeechQuestion1 = TextToSpeechQuestion(questionList: [
  'Tita',
  'Books',
  'Comedy',
  'It',
  'Vocabulary',
  'Because',
  'Helps',
  'Broadens',
  'Spirit',
  'Enjoy',
  'Reading',
  'Her',
  'They'
], questionId: 'text1', questionType: QuestionType.text_to_speech);
