class QuestionModel {
  String questionId;
  QuestionType questionType;
  QuestionModel({
    required this.questionId,
    required this.questionType,
  });
}

enum QuestionType {
  pronunciation,
  text_to_text,
  video_to_text,
  text_to_speech,
  speech_to_text,
}
