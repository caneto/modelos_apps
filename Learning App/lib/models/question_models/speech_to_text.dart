import 'package:learnkuy/models/question_model.dart';

class SpeechToTextQuestion extends QuestionModel {
  String question;
  String answer;
  String userAnswer;

  SpeechToTextQuestion(
      {required this.question,
      required this.answer,
      required this.userAnswer,
      required String questionId,
      required QuestionType questionType})
      : super(questionId: questionId, questionType: questionType);
}

SpeechToTextQuestion speechTextQuestion1 = SpeechToTextQuestion(
    question:
        "I usually get a basic trim, but I'm open to suggestions if you have any.",
    answer: 'I am a student',
    userAnswer: '',
    questionId: 'text1',
    questionType: QuestionType.speech_to_text);

      SpeechToTextQuestion speechTextQuestion2 = SpeechToTextQuestion(
    question:
        "I usually get a basic trim, but I'm open to suggestions if you have any.",
    answer: 'I am a student',
    userAnswer: "I usually get a basic trim, but I'm open to suggestions if you have any.",
    questionId: 'text2',
    questionType: QuestionType.speech_to_text);

    