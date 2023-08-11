import 'package:learnkuy/utils/icons_path.dart';

class LessonTypeModel {
  String title;

  String icon;

  List<ChapterModel> chapters;
  LessonTypeModel({
    required this.title,
    required this.icon,
    required this.chapters,
  });
}

class ChapterModel {
  String title;
  String subtitle;
  String audio;
  bool isPremium;

  ChapterModel({
    required this.title,
    required this.subtitle,
    required this.audio,
    required this.isPremium,
  });
}

List<LessonTypeModel> lessonTypeList = [
  LessonTypeModel(
      title: 'Listening', icon: AppIcons.kListening, chapters: chaptersList),
  LessonTypeModel(
      title: 'Reading', icon: AppIcons.kReading, chapters: chaptersList),
  LessonTypeModel(
      title: 'Writing', icon: AppIcons.kWriting, chapters: chaptersList),
  LessonTypeModel(
      title: 'Speaking', icon: AppIcons.kSpeak, chapters: chaptersList),
];

List<ChapterModel> chaptersList = [
  ChapterModel(
      title: 'Audio One',
      subtitle: '8/15 Correct Answers',
      isPremium: false,
      audio: 'audio/audio1.mp3'),
  ChapterModel(
      title: 'Audio Two',
      subtitle: '8/15 Correct Answers',
      isPremium: false,
      audio: 'audio/ukulele.mp3'),
  ChapterModel(
      title: 'Audio Three',
      subtitle: '8/15 Correct Answers',
      isPremium: true,
      audio: 'audio/audio3.mp3'),
  ChapterModel(
      title: 'Audio Five',
      subtitle: '8/15 Correct Answers ',
      isPremium: true,
      audio: 'audio/ukulele.mp3'),
  ChapterModel(
      title: 'Audio Six',
      subtitle: '8/15 Correct Answers',
      isPremium: true,
      audio: 'audio/audio1.mp3'),
  ChapterModel(
      title: 'Audio Seven',
      subtitle: '8/15 Correct Answers ',
      isPremium: true,
      audio: 'audio/ukulele.mp3'),
];
