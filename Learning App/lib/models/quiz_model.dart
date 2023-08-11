import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:learnkuy/models/question_model.dart';
import 'package:learnkuy/models/question_models/pronunciation_model.dart';
import 'package:learnkuy/models/question_models/speech_to_text.dart';
import 'package:learnkuy/models/question_models/text_to_speech.dart';
import 'package:learnkuy/models/question_models/text_to_text.dart';
import 'package:learnkuy/models/question_models/video_to_text.dart';
import 'package:learnkuy/pages/quizScreen/widgets/pronunciation_widget.dart';
import 'package:learnkuy/pages/quizScreen/widgets/speechtotextquestion_widget.dart';
import 'package:learnkuy/pages/quizScreen/widgets/texttospeechquestion_widget.dart';
import 'package:learnkuy/pages/quizScreen/widgets/texttotext_questionwidget.dart';
import 'package:learnkuy/pages/quizScreen/widgets/videototextquestion_widget.dart';

class QuizModel {
  String quizId;
  String languageId;
  String quizName;
  String quizDescription;
  LanguageLevel languageLevel;
  List<QuestionModel> questions = [];
  QuizModel({
    required this.quizId,
    required this.languageId,
    required this.quizName,
    required this.quizDescription,
    required this.languageLevel,
    required this.questions,
  });
}

enum LanguageLevel { Beginner, Intermediate, Advanced }

QuizModel english = QuizModel(
    quizId: "quiz1",
    languageId: 'English',
    quizName: 'English 1',
    quizDescription: 'Test desc',
    languageLevel: LanguageLevel.Beginner,
    questions: [
      pronunciation1,
      pronunciation2,
      pronunciation3,
      pronunciation4,
      pronunciation5,
      pronunciation6,
      textQuestion1,
      textQuestion2,
      textQuestion3,
      textQuestion4,
      vidQuestion1,
      vidQuestion2,
      vidQuestion3,
      speechTextQuestion1,
      speechTextQuestion2,
      textSpeechQuestion1,
    ]);

QuizModel indonesia = QuizModel(
    quizId: "quiz2",
    languageId: 'indonesia',
    quizName: 'indonesia 2',
    quizDescription: 'Test desc',
    languageLevel: LanguageLevel.Beginner,
    questions: [
      pronunciation1,
      pronunciation2,
      pronunciation3,
      pronunciation4,
      pronunciation5,
      pronunciation6,
      textQuestion1,
      textQuestion2,
      textQuestion3,
      textQuestion4,
      vidQuestion1,
      vidQuestion2,
      vidQuestion3,
      speechTextQuestion1,
      speechTextQuestion2,
      textSpeechQuestion1
    ]);
QuizModel afghanistan = QuizModel(
    quizId: "quiz3",
    languageId: 'Afghanistan',
    quizName: 'Afghanistan 3',
    quizDescription: 'Test desc',
    languageLevel: LanguageLevel.Beginner,
    questions: [
      pronunciation1,
      pronunciation2,
      pronunciation3,
      pronunciation4,
      pronunciation5,
      pronunciation6,
      textQuestion1,
      textQuestion2,
      textQuestion3,
      textQuestion4,
      vidQuestion1,
      vidQuestion2,
      vidQuestion3,
      speechTextQuestion1,
      speechTextQuestion2,
      textSpeechQuestion1
    ]);
QuizModel albanian = QuizModel(
    quizId: "quiz4",
    languageId: 'Albanian',
    quizName: 'Albanian 4',
    quizDescription: 'Test desc',
    languageLevel: LanguageLevel.Beginner,
    questions: [
      pronunciation1,
      pronunciation2,
      pronunciation3,
      pronunciation4,
      pronunciation5,
      pronunciation6,
      textQuestion1,
      textQuestion2,
      textQuestion3,
      textQuestion4,
      vidQuestion1,
      vidQuestion2,
      vidQuestion3,
      speechTextQuestion1,
      speechTextQuestion2,
      textSpeechQuestion1
    ]);
QuizModel algeria = QuizModel(
    quizId: "quiz5",
    languageId: 'algeria',
    quizName: 'algeria 5',
    quizDescription: 'Test desc',
    languageLevel: LanguageLevel.Beginner,
    questions: [
      pronunciation1,
      pronunciation2,
      pronunciation3,
      pronunciation4,
      pronunciation5,
      pronunciation6,
      textQuestion1,
      textQuestion2,
      textQuestion3,
      textQuestion4,
      vidQuestion1,
      vidQuestion2,
      vidQuestion3,
      speechTextQuestion1,
      speechTextQuestion2,
      textSpeechQuestion1
    ]);
QuizModel malaysia = QuizModel(
    quizId: "quiz6",
    languageId: 'malaysia',
    quizName: 'malaysia 6',
    quizDescription: 'Test desc',
    languageLevel: LanguageLevel.Beginner,
    questions: [
      pronunciation1,
      pronunciation2,
      pronunciation3,
      pronunciation4,
      pronunciation5,
      pronunciation6,
      textQuestion1,
      textQuestion2,
      textQuestion3,
      textQuestion4,
      vidQuestion1,
      vidQuestion2,
      vidQuestion3,
      speechTextQuestion1,
      speechTextQuestion2,
      textSpeechQuestion1
    ]);
QuizModel zimbabwe = QuizModel(
    quizId: "quiz7",
    languageId: 'zimbabwe',
    quizName: 'zimbabwe 7',
    quizDescription: 'Test desc',
    languageLevel: LanguageLevel.Beginner,
    questions: [
      pronunciation1,
      pronunciation2,
      pronunciation3,
      pronunciation4,
      pronunciation5,
      pronunciation6,
      textQuestion1,
      textQuestion2,
      textQuestion3,
      textQuestion4,
      vidQuestion1,
      vidQuestion2,
      vidQuestion3,
      speechTextQuestion1,
      speechTextQuestion2,
      textSpeechQuestion1
    ]);
QuizModel southkorea = QuizModel(
    quizId: "quiz8",
    languageId: 'southkorea',
    quizName: 'southkorea 8',
    quizDescription: 'Test desc',
    languageLevel: LanguageLevel.Beginner,
    questions: [
      pronunciation1,
      pronunciation2,
      pronunciation3,
      pronunciation4,
      pronunciation5,
      pronunciation6,
      textQuestion1,
      textQuestion2,
      textQuestion3,
      textQuestion4,
      vidQuestion1,
      vidQuestion2,
      vidQuestion3,
      speechTextQuestion1,
      speechTextQuestion2,
      textSpeechQuestion1
    ]);
QuizModel guam = QuizModel(
    quizId: "quiz9",
    languageId: 'guam',
    quizName: 'guam 9',
    quizDescription: 'Test desc',
    languageLevel: LanguageLevel.Beginner,
    questions: [
      pronunciation1,
      pronunciation2,
      pronunciation3,
      pronunciation4,
      pronunciation5,
      pronunciation6,
      textQuestion1,
      textQuestion2,
      textQuestion3,
      textQuestion4,
      vidQuestion1,
      vidQuestion2,
      vidQuestion3,
      speechTextQuestion1,
      speechTextQuestion2,
      textSpeechQuestion1
    ]);
QuizModel netherland = QuizModel(
    quizId: "quiz10",
    languageId: 'netherland',
    quizName: 'netherland 10',
    quizDescription: 'Test desc',
    languageLevel: LanguageLevel.Beginner,
    questions: [
      pronunciation1,
      pronunciation2,
      pronunciation3,
      pronunciation4,
      pronunciation5,
      pronunciation6,
      textQuestion1,
      textQuestion2,
      textQuestion3,
      textQuestion4,
      vidQuestion1,
      vidQuestion2,
      vidQuestion3,
      speechTextQuestion1,
      speechTextQuestion2,
      textSpeechQuestion1
    ]);
QuizModel ecuador = QuizModel(
    quizId: "quiz11",
    languageId: 'ecuador',
    quizName: 'ecuador 11',
    quizDescription: 'Test desc',
    languageLevel: LanguageLevel.Beginner,
    questions: [
      pronunciation1,
      pronunciation2,
      pronunciation3,
      pronunciation4,
      pronunciation5,
      pronunciation6,
      textQuestion1,
      textQuestion2,
      textQuestion3,
      textQuestion4,
      vidQuestion1,
      vidQuestion2,
      vidQuestion3,
      speechTextQuestion1,
      speechTextQuestion2,
      textSpeechQuestion1
    ]);
QuizModel falkland = QuizModel(
    quizId: "quiz12",
    languageId: 'falkland',
    quizName: 'falkland 12',
    quizDescription: 'Test desc',
    languageLevel: LanguageLevel.Beginner,
    questions: [
      pronunciation1,
      pronunciation2,
      pronunciation3,
      pronunciation4,
      pronunciation5,
      pronunciation6,
      textQuestion1,
      textQuestion2,
      textQuestion3,
      textQuestion4,
      vidQuestion1,
      vidQuestion2,
      vidQuestion3,
      textQuestion1,
      textQuestion2,
      textQuestion3,
      speechTextQuestion1,
      speechTextQuestion2,
      textSpeechQuestion1
    ]);
QuizModel southArica = QuizModel(
    quizId: "quiz13",
    languageId: 'southArica',
    quizName: 'southArica 13',
    quizDescription: 'Test desc',
    languageLevel: LanguageLevel.Beginner,
    questions: [
      pronunciation1,
      pronunciation2,
      pronunciation3,
      pronunciation4,
      pronunciation5,
      pronunciation6,
      textQuestion1,
      textQuestion2,
      textQuestion3,
      textQuestion4,
      vidQuestion1,
      vidQuestion2,
      vidQuestion3,
      speechTextQuestion1,
      speechTextQuestion2,
      textSpeechQuestion1
    ]);
QuizModel minorOutlying = QuizModel(
    quizId: "quiz14",
    languageId: 'minorOutlying',
    quizName: 'minorOutlying 14',
    quizDescription: 'Test desc',
    languageLevel: LanguageLevel.Beginner,
    questions: [
      pronunciation1,
      pronunciation2,
      pronunciation3,
      pronunciation4,
      pronunciation5,
      pronunciation6,
      textQuestion1,
      textQuestion2,
      textQuestion3,
      textQuestion4,
      vidQuestion1,
      vidQuestion2,
      vidQuestion3,
      speechTextQuestion1,
      speechTextQuestion2,
      textSpeechQuestion1
    ]);
QuizModel centralAfrican = QuizModel(
    quizId: "quiz15",
    languageId: 'centralAfrican',
    quizName: 'centralAfrican 15',
    quizDescription: 'Test desc',
    languageLevel: LanguageLevel.Beginner,
    questions: [
      pronunciation1,
      pronunciation2,
      pronunciation3,
      pronunciation4,
      pronunciation5,
      pronunciation6,
      textQuestion1,
      textQuestion2,
      textQuestion3,
      textQuestion4,
      vidQuestion1,
      vidQuestion2,
      vidQuestion3,
      speechTextQuestion1,
      speechTextQuestion2,
      textSpeechQuestion1
    ]);
QuizModel pakistan = QuizModel(
    quizId: "quiz16",
    languageId: 'pakistan',
    quizName: 'centralAfrican 16',
    quizDescription: 'Test desc',
    languageLevel: LanguageLevel.Beginner,
    questions: [
      pronunciation1,
      pronunciation2,
      pronunciation3,
      pronunciation4,
      pronunciation5,
      pronunciation6,
      textQuestion1,
      textQuestion2,
      textQuestion3,
      textQuestion4,
      vidQuestion1,
      vidQuestion2,
      vidQuestion3,
      speechTextQuestion1,
      speechTextQuestion2,
      textSpeechQuestion1
    ]);
QuizModel unitedArabEmirates = QuizModel(
    quizId: "quiz17",
    languageId: 'unitedArabEmirates',
    quizName: 'unitedArabEmirates 17',
    quizDescription: 'Test desc',
    languageLevel: LanguageLevel.Beginner,
    questions: [
      pronunciation1,
      pronunciation2,
      pronunciation3,
      pronunciation4,
      pronunciation5,
      pronunciation6,
      textQuestion1,
      textQuestion2,
      textQuestion3,
      textQuestion4,
      vidQuestion1,
      vidQuestion2,
      vidQuestion3,
      speechTextQuestion1,
      speechTextQuestion2,
      textSpeechQuestion1
    ]);
QuizModel estonia = QuizModel(
    quizId: "quiz18",
    languageId: 'estonia',
    quizName: 'estonia 18',
    quizDescription: 'Test desc',
    languageLevel: LanguageLevel.Beginner,
    questions: [
      pronunciation1,
      pronunciation2,
      pronunciation3,
      pronunciation4,
      pronunciation5,
      pronunciation6,
      textQuestion1,
      textQuestion2,
      textQuestion3,
      textQuestion4,
      vidQuestion1,
      vidQuestion2,
      vidQuestion3,
      speechTextQuestion1,
      speechTextQuestion2,
      textSpeechQuestion1
    ]);
QuizModel bulgaria = QuizModel(
    quizId: "quiz19",
    languageId: 'bulgaria',
    quizName: 'bulgaria 19',
    quizDescription: 'Test desc',
    languageLevel: LanguageLevel.Beginner,
    questions: [
      pronunciation1,
      pronunciation2,
      pronunciation3,
      pronunciation4,
      pronunciation5,
      pronunciation6,
      textQuestion1,
      textQuestion2,
      textQuestion3,
      textQuestion4,
      vidQuestion1,
      vidQuestion2,
      vidQuestion3,
      speechTextQuestion1,
      speechTextQuestion2,
      textSpeechQuestion1
    ]);
QuizModel polynesia = QuizModel(
    quizId: "quiz20",
    languageId: 'polynesia',
    quizName: 'polynesia 20',
    quizDescription: 'Test desc',
    languageLevel: LanguageLevel.Beginner,
    questions: [
      pronunciation1,
      pronunciation2,
      pronunciation3,
      pronunciation4,
      pronunciation5,
      pronunciation6,
      textQuestion1,
      textQuestion2,
      textQuestion3,
      textQuestion4,
      vidQuestion1,
      vidQuestion2,
      vidQuestion3,
      speechTextQuestion1,
      speechTextQuestion2,
      textSpeechQuestion1
    ]);
QuizModel columbia = QuizModel(
    quizId: "quiz21",
    languageId: 'columbia',
    quizName: 'columbia 21',
    quizDescription: 'Test desc',
    languageLevel: LanguageLevel.Beginner,
    questions: [
      pronunciation1,
      pronunciation2,
      pronunciation3,
      pronunciation4,
      pronunciation5,
      pronunciation6,
      textQuestion1,
      textQuestion2,
      textQuestion3,
      textQuestion4,
      vidQuestion1,
      vidQuestion2,
      vidQuestion3,
      speechTextQuestion1,
      speechTextQuestion2,
      textSpeechQuestion1
    ]);
QuizModel sweden = QuizModel(
    quizId: "quiz22",
    languageId: 'sweden',
    quizName: 'sweden 22',
    quizDescription: 'Test desc',
    languageLevel: LanguageLevel.Beginner,
    questions: [
      pronunciation1,
      pronunciation2,
      pronunciation3,
      pronunciation4,
      pronunciation5,
      pronunciation6,
      textQuestion1,
      textQuestion2,
      textQuestion3,
      textQuestion4,
      vidQuestion1,
      vidQuestion2,
      vidQuestion3,
      speechTextQuestion1,
      speechTextQuestion2,
      textSpeechQuestion1
    ]);
QuizModel peru = QuizModel(
    quizId: "quiz23",
    languageId: 'peru',
    quizName: 'peru 23',
    quizDescription: 'Test desc',
    languageLevel: LanguageLevel.Beginner,
    questions: [
      pronunciation1,
      pronunciation2,
      pronunciation3,
      pronunciation4,
      pronunciation5,
      pronunciation6,
      textQuestion1,
      textQuestion2,
      textQuestion3,
      textQuestion4,
      vidQuestion1,
      vidQuestion2,
      vidQuestion3,
      speechTextQuestion1,
      speechTextQuestion2,
      textSpeechQuestion1
    ]);
QuizModel tobago = QuizModel(
    quizId: "quiz24",
    languageId: 'tobago',
    quizName: 'tobago 24',
    quizDescription: 'Test desc',
    languageLevel: LanguageLevel.Beginner,
    questions: [
      pronunciation1,
      pronunciation2,
      pronunciation3,
      pronunciation4,
      pronunciation5,
      pronunciation6,
      textQuestion1,
      textQuestion2,
      textQuestion3,
      textQuestion4,
      vidQuestion1,
      vidQuestion2,
      vidQuestion3,
      speechTextQuestion1,
      speechTextQuestion2,
      textSpeechQuestion1
    ]);
QuizModel guatemala = QuizModel(
    quizId: "quiz25",
    languageId: 'guatemala',
    quizName: 'guatemala 25',
    quizDescription: 'Test desc',
    languageLevel: LanguageLevel.Beginner,
    questions: [
      pronunciation1,
      pronunciation2,
      pronunciation3,
      pronunciation4,
      pronunciation5,
      pronunciation6,
      textQuestion1,
      textQuestion2,
      textQuestion3,
      textQuestion4,
      vidQuestion1,
      vidQuestion2,
      vidQuestion3,
      speechTextQuestion1,
      speechTextQuestion2,
      textSpeechQuestion1
    ]);
QuizModel iraq = QuizModel(
    quizId: "quiz26",
    languageId: 'iraq',
    quizName: 'iraq 26',
    quizDescription: 'Test desc',
    languageLevel: LanguageLevel.Beginner,
    questions: [
      pronunciation1,
      pronunciation2,
      pronunciation3,
      pronunciation4,
      pronunciation5,
      pronunciation6,
      textQuestion1,
      textQuestion2,
      textQuestion3,
      textQuestion4,
      vidQuestion1,
      vidQuestion2,
      vidQuestion3,
      speechTextQuestion1,
      speechTextQuestion2,
      textSpeechQuestion1
    ]);
QuizModel greenland = QuizModel(
    quizId: "quiz27",
    languageId: 'greenland',
    quizName: 'greenland 27',
    quizDescription: 'Test desc',
    languageLevel: LanguageLevel.Beginner,
    questions: [
      pronunciation1,
      pronunciation2,
      pronunciation3,
      pronunciation4,
      pronunciation5,
      pronunciation6,
      textQuestion1,
      textQuestion2,
      textQuestion3,
      textQuestion4,
      vidQuestion1,
      vidQuestion2,
      vidQuestion3,
      speechTextQuestion1,
      speechTextQuestion2,
      textSpeechQuestion1
    ]);
QuizModel maldives = QuizModel(
    quizId: "quiz28",
    languageId: 'maldives',
    quizName: 'maldives 28',
    quizDescription: 'Test desc',
    languageLevel: LanguageLevel.Beginner,
    questions: [
      pronunciation1,
      pronunciation2,
      pronunciation3,
      pronunciation4,
      pronunciation5,
      pronunciation6,
      textQuestion1,
      textQuestion2,
      textQuestion3,
      textQuestion4,
      vidQuestion1,
      vidQuestion2,
      vidQuestion3,
      speechTextQuestion1,
      speechTextQuestion2,
      textSpeechQuestion1
    ]);
QuizModel macedonia = QuizModel(
    quizId: "quiz29",
    languageId: 'macedonia',
    quizName: 'macedonia 29',
    quizDescription: 'Test desc',
    languageLevel: LanguageLevel.Beginner,
    questions: [
      pronunciation1,
      pronunciation2,
      pronunciation3,
      pronunciation4,
      pronunciation5,
      pronunciation6,
      textQuestion1,
      textQuestion2,
      textQuestion3,
      textQuestion4,
      vidQuestion1,
      vidQuestion2,
      vidQuestion3,
      speechTextQuestion1,
      speechTextQuestion2,
      textSpeechQuestion1
    ]);
QuizModel americanSamoa = QuizModel(
    quizId: "quiz30",
    languageId: 'americanSamoa',
    quizName: 'americanSamoa 30',
    quizDescription: 'Test desc',
    languageLevel: LanguageLevel.Beginner,
    questions: [
      pronunciation1,
      pronunciation2,
      pronunciation3,
      pronunciation4,
      pronunciation5,
      pronunciation6,
      textQuestion1,
      textQuestion2,
      textQuestion3,
      textQuestion4,
      vidQuestion1,
      vidQuestion2,
      vidQuestion3,
      speechTextQuestion1,
      speechTextQuestion2,
      textSpeechQuestion1
    ]);
QuizModel mauritius = QuizModel(
    quizId: "quiz31",
    languageId: 'mauritius',
    quizName: 'mauritius 31',
    quizDescription: 'Test desc',
    languageLevel: LanguageLevel.Beginner,
    questions: [
      pronunciation1,
      pronunciation2,
      pronunciation3,
      pronunciation4,
      pronunciation5,
      pronunciation6,
      textQuestion1,
      textQuestion2,
      textQuestion3,
      textQuestion4,
      vidQuestion1,
      vidQuestion2,
      vidQuestion3,
      speechTextQuestion1,
      speechTextQuestion2,
      textSpeechQuestion1
    ]);
QuizModel american = QuizModel(
    quizId: "quiz32",
    languageId: 'american',
    quizName: 'american 32',
    quizDescription: 'Test desc',
    languageLevel: LanguageLevel.Beginner,
    questions: [
      pronunciation1,
      pronunciation2,
      pronunciation3,
      pronunciation4,
      pronunciation5,
      pronunciation6,
      textQuestion1,
      textQuestion2,
      textQuestion3,
      textQuestion4,
      vidQuestion1,
      vidQuestion2,
      vidQuestion3,
      speechTextQuestion1,
      speechTextQuestion2,
      textSpeechQuestion1
    ]);
QuizModel mali = QuizModel(
    quizId: "quiz33",
    languageId: 'mali',
    quizName: 'mali 33',
    quizDescription: 'Test desc',
    languageLevel: LanguageLevel.Beginner,
    questions: [
      pronunciation1,
      pronunciation2,
      pronunciation3,
      pronunciation4,
      pronunciation5,
      pronunciation6,
      textQuestion1,
      textQuestion2,
      textQuestion3,
      textQuestion4,
      vidQuestion1,
      vidQuestion2,
      vidQuestion3,
      speechTextQuestion1,
      speechTextQuestion2,
      textSpeechQuestion1
    ]);
QuizModel libya = QuizModel(
    quizId: "quiz34",
    languageId: 'libya',
    quizName: 'libya 34',
    quizDescription: 'Test desc',
    languageLevel: LanguageLevel.Beginner,
    questions: [
      pronunciation1,
      pronunciation2,
      pronunciation3,
      pronunciation4,
      pronunciation5,
      pronunciation6,
      textQuestion1,
      textQuestion2,
      textQuestion3,
      textQuestion4,
      vidQuestion1,
      vidQuestion2,
      vidQuestion3,
      speechTextQuestion1,
      speechTextQuestion2,
      textSpeechQuestion1
    ]);
QuizModel andorra = QuizModel(
    quizId: "quiz35",
    languageId: 'andorra',
    quizName: 'andorra 35',
    quizDescription: 'Test desc',
    languageLevel: LanguageLevel.Beginner,
    questions: [
      pronunciation1,
      pronunciation2,
      pronunciation3,
      pronunciation4,
      pronunciation5,
      pronunciation6,
      textQuestion1,
      textQuestion2,
      textQuestion3,
      textQuestion4,
      vidQuestion1,
      vidQuestion2,
      vidQuestion3,
      speechTextQuestion1,
      speechTextQuestion2,
      textSpeechQuestion1
    ]);
QuizModel bermuda = QuizModel(
    quizId: "quiz36",
    languageId: 'bermuda',
    quizName: 'bermuda 36',
    quizDescription: 'Test desc',
    languageLevel: LanguageLevel.Beginner,
    questions: [
      pronunciation1,
      pronunciation2,
      pronunciation3,
      pronunciation4,
      pronunciation5,
      pronunciation6,
      textQuestion1,
      textQuestion2,
      textQuestion3,
      textQuestion4,
      vidQuestion1,
      vidQuestion2,
      vidQuestion3,
      speechTextQuestion1,
      speechTextQuestion2,
      textSpeechQuestion1
    ]);
QuizModel jordan = QuizModel(
    quizId: "quiz37",
    languageId: 'jordan',
    quizName: 'jordan 37',
    quizDescription: 'Test desc',
    languageLevel: LanguageLevel.Beginner,
    questions: [
      pronunciation1,
      pronunciation2,
      pronunciation3,
      pronunciation4,
      pronunciation5,
      pronunciation6,
      textQuestion1,
      textQuestion2,
      textQuestion3,
      textQuestion4,
      vidQuestion1,
      vidQuestion2,
      vidQuestion3,
      speechTextQuestion1,
      speechTextQuestion2,
      textSpeechQuestion1
    ]);
QuizModel serbia = QuizModel(
    quizId: "quiz38",
    languageId: 'serbia',
    quizName: 'serbia 38',
    quizDescription: 'Test desc',
    languageLevel: LanguageLevel.Beginner,
    questions: [
      pronunciation1,
      pronunciation2,
      pronunciation3,
      pronunciation4,
      pronunciation5,
      pronunciation6,
      textQuestion1,
      textQuestion2,
      textQuestion3,
      textQuestion4,
      vidQuestion1,
      vidQuestion2,
      vidQuestion3,
      speechTextQuestion1,
      speechTextQuestion2,
      textSpeechQuestion1
    ]);
QuizModel mariana = QuizModel(
    quizId: "quiz39",
    languageId: 'mariana',
    quizName: 'mariana 39',
    quizDescription: 'Test desc',
    languageLevel: LanguageLevel.Beginner,
    questions: [
      pronunciation1,
      pronunciation2,
      pronunciation3,
      pronunciation4,
      pronunciation5,
      pronunciation6,
      textQuestion1,
      textQuestion2,
      textQuestion3,
      textQuestion4,
      vidQuestion1,
      vidQuestion2,
      vidQuestion3,
      speechTextQuestion1,
      speechTextQuestion2,
      textSpeechQuestion1
    ]);
QuizModel caicosIslands = QuizModel(
    quizId: "quiz40",
    languageId: 'caicosIslands',
    quizName: 'caicosIslands 40',
    quizDescription: 'Test desc',
    languageLevel: LanguageLevel.Beginner,
    questions: [
      pronunciation1,
      pronunciation2,
      pronunciation3,
      pronunciation4,
      pronunciation5,
      pronunciation6,
      textQuestion1,
      textQuestion2,
      textQuestion3,
      textQuestion4,
      vidQuestion1,
      vidQuestion2,
      vidQuestion3,
      speechTextQuestion1,
      speechTextQuestion2,
      textSpeechQuestion1
    ]);

List<QuizModel> quizList = [
  english,
  indonesia,
  afghanistan,
  albanian,
  algeria,
  malaysia,
  zimbabwe,
  southkorea,
  guam,
  netherland,
  ecuador,
  falkland,
  southArica,
  minorOutlying,
  centralAfrican,
  pakistan,
  unitedArabEmirates,
  estonia,
  bulgaria,
  polynesia,
  columbia,
  sweden,
  peru,
  tobago,
  guatemala,
  iraq,
  maldives,
  macedonia,
  mauritius,
  american,
  mali,
  libya,
  andorra,
  bermuda,
  jordan,
  serbia,
  mariana,
  caicosIslands
];
Widget getWidgetForQuestion(
    QuestionModel question, PageController pageController, int index) {
  switch (question.questionType) {
    case QuestionType.pronunciation:
      return PronunciationWidget(
        pronunciation: question as Pronunciation,
        pageController: pageController, itemCount: index,
      );
    case QuestionType.text_to_text:
      return TextToTextQuestionWidget(
        question: question as TextToTextQuestion,
        pageController: pageController, itemCount: index,
      );
    case QuestionType.video_to_text:
      return VideoToTextQuestionWidget(
        question: question as VideoToTextQuestion,
        pageController: pageController, itemCount: index,
      );
    case QuestionType.text_to_speech:
      return TextToSpeechQuestionWidget(
        question: question as TextToSpeechQuestion,
        pageController: pageController,
        itemCount: index,
      );
    case QuestionType.speech_to_text:
      return SpeechToTextQuestionWidget(
        question: question as SpeechToTextQuestion,
        pageController: pageController, itemCount: index,
      );
    default:
      return Container();
  }
}
