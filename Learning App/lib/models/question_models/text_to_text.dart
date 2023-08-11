import '../question_model.dart';

class TextToTextQuestion extends QuestionModel {
  String question;
  String answer;
  String userAnswer;
  List<String> options;
  TextToTextQuestion(
      {required this.question,
      required this.answer,
      required this.userAnswer,
      required this.options,
      required String questionId,
      required QuestionType questionType})
      : super(questionId: questionId, questionType: questionType);
}

TextToTextQuestion textQuestion1 = TextToTextQuestion(
    question: "I can't believe how ____________ this cake is!",
    answer: 'Delicious',
    userAnswer: '',
    options: ['Delicious', 'Delight', 'Delighting', 'Deliciously'],
    questionId: 'text1',
    questionType: QuestionType.text_to_text);
TextToTextQuestion textQuestion2 = TextToTextQuestion(
    question: "The idiom donkey’s year means _________?",
    answer: 'Very long period',
    userAnswer: '',
    options: ['Very Short period', 'Very long period', 'Both', 'None'],
    questionId: 'text2',
    questionType: QuestionType.text_to_text);
TextToTextQuestion textQuestion3 = TextToTextQuestion(
    question: "Bring forward means?",
    answer: 'Produce',
    userAnswer: '',
    options: ['Produce', 'Show up', 'Clarify', ' None of These'],
    questionId: 'text3',
    questionType: QuestionType.text_to_text);
TextToTextQuestion textQuestion4 = TextToTextQuestion(
    question: "Antonym of ARTIFICIAL is ______________?",
    answer: 'Natural',
    userAnswer: '',
    options: ['Red', 'Solid', 'Truthful', 'Natural'],
    questionId: 'text4',
    questionType: QuestionType.text_to_text);
