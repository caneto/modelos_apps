import '../question_model.dart';

class VideoToTextQuestion extends QuestionModel {
  String questionVideoUrl;
  String answer;
  String question;
  String userAnswer;
  List<String> options;
  VideoToTextQuestion(
      {required this.questionVideoUrl,
      required this.answer,
      required this.userAnswer,
      required this.options,
      required this.question,
      required String questionId,
      required QuestionType questionType})
      : super(questionId: questionId, questionType: questionType);
}

//Please create 10 dummy questions of this type and add them to the list of questions in the QuizModel class.

VideoToTextQuestion vidQuestion1 = VideoToTextQuestion(
    questionVideoUrl:
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    answer: 'amateur',
    userAnswer: '',
    question:
        'The protagonist was portrayed by a(n) ___________ actor in the video',
    options: ['amateur', 'aspiring', 'renowned'],
    questionId: 'vid1',
    questionType: QuestionType.video_to_text);

VideoToTextQuestion vidQuestion2 = VideoToTextQuestion(
    questionVideoUrl:
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    answer: 'Doctor',
    userAnswer: '',
    options: ['Student', 'Teacher', 'Doctor'],
    questionId: 'vid2',
    question: 'He is a ___________',
    questionType: QuestionType.video_to_text);

VideoToTextQuestion vidQuestion3 = VideoToTextQuestion(
    questionVideoUrl:
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    answer: 'Teacher',
    userAnswer: '',
    question: 'He is a ___________',
    options: ['Student', 'Teacher', 'Doctor'],
    questionId: 'vid3',
    questionType: QuestionType.video_to_text);
