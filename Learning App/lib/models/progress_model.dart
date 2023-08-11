import 'package:learnkuy/models/user_model.dart';
import 'package:learnkuy/utils/images_path.dart';

enum ProgressType { weekly, monthly, allTime }

class ProgressModel {
  int id;
  int lessonsCount;
  ProgressType leaderType;

  UserModel userModel;
  String dateTime;
  ProgressModel({
    required this.id,
    required this.lessonsCount,
    required this.leaderType,
    required this.userModel,
    required this.dateTime,
  });
}

List<ProgressModel> progressList = [
  ProgressModel(
      id: 1,
      lessonsCount: 32,
      leaderType: ProgressType.weekly,
      userModel: UserModel(
        isPremium: true,
        name: 'Titan',
        profileImage: ImagesPath.kUser5,
        address: 'address',
      ),
      dateTime: 'jun/16/2023'),
  ProgressModel(
      id: 2,
      lessonsCount: 29,
      leaderType: ProgressType.weekly,
      userModel: UserModel(
        name: 'Khalid',
        isPremium: true,
        profileImage: ImagesPath.kUser7,
        address: 'address',
      ),
      dateTime: 'jun/16/2023'),
  ProgressModel(
      id: 3,
      lessonsCount: 28,
      leaderType: ProgressType.weekly,
      userModel: UserModel(
        name: 'Fatima',
        isPremium: true,
        profileImage: ImagesPath.kUser6,
        address: 'address',
      ),
      dateTime: 'jun/16/2023'),
  ProgressModel(
      id: 4,
      lessonsCount: 27,
      leaderType: ProgressType.weekly,
      userModel: UserModel(
        name: 'Khalid Mohammad',
        profileImage: ImagesPath.kUser2,
        address: 'address',
        isPremium: true,
      ),
      dateTime: 'jun/16/2023'),
  ProgressModel(
      id: 5,
      lessonsCount: 25,
      leaderType: ProgressType.weekly,
      userModel: UserModel(
        name: 'Wade Warren',
        isPremium: true,
        profileImage: ImagesPath.kUser1,
        address: 'address',
      ),
      dateTime: 'jun/16/2023'),
  ProgressModel(
      id: 6,
      lessonsCount: 22,
      leaderType: ProgressType.weekly,
      userModel: UserModel(
        name: 'Guy Hawkins',
        isPremium: true,
        profileImage: ImagesPath.kUser3,
        address: 'address',
      ),
      dateTime: 'jun/16/2023'),
  ProgressModel(
      id: 7,
      lessonsCount: 20,
      leaderType: ProgressType.weekly,
      userModel: UserModel(
        name: 'Jacob Jones',
        isPremium: true,
        profileImage: ImagesPath.kUser4,
        address: 'address',
      ),
      dateTime: 'jun/16/2023'),
  ProgressModel(
      id: 8,
      lessonsCount: 27,
      leaderType: ProgressType.weekly,
      userModel: UserModel(
        name: 'Roy',
        profileImage: ImagesPath.kUser7,
        address: 'address',
        isPremium: true,
      ),
      dateTime: 'jun/16/2023'),
  ProgressModel(
      id: 9,
      lessonsCount: 32,
      leaderType: ProgressType.monthly,
      userModel: UserModel(
        name: 'Titan',
        isPremium: true,
        profileImage: ImagesPath.kUser5,
        address: 'address',
      ),
      dateTime: 'jun/26/2023'),
  ProgressModel(
      id: 10,
      lessonsCount: 29,
      leaderType: ProgressType.monthly,
      userModel: UserModel(
        name: 'Khalid',
        profileImage: ImagesPath.kUser7,
        address: 'address',
        isPremium: true,
      ),
      dateTime: 'jun/23/2023'),
  ProgressModel(
      id: 11,
      lessonsCount: 28,
      leaderType: ProgressType.monthly,
      userModel: UserModel(
        name: 'Fatima',
        profileImage: ImagesPath.kUser6,
        address: 'address',
        isPremium: true,
      ),
      dateTime: 'jun/24/2023'),
  ProgressModel(
      id: 12,
      lessonsCount: 27,
      leaderType: ProgressType.monthly,
      userModel: UserModel(
        name: 'Khalid Mohammad',
        profileImage: ImagesPath.kUser2,
        address: 'address',
        isPremium: true,
      ),
      dateTime: 'jun/18/2023'),
  ProgressModel(
      id: 13,
      lessonsCount: 32,
      leaderType: ProgressType.allTime,
      userModel: UserModel(
        name: 'karma',
        profileImage: ImagesPath.kUserProfile,
        address: 'address',
        isPremium: true,
      ),
      dateTime: 'jun/16/2023'),
  ProgressModel(
      id: 14,
      lessonsCount: 29,
      leaderType: ProgressType.allTime,
      userModel: UserModel(
        name: 'wali',
        isPremium: true,
        profileImage: ImagesPath.kUser4,
        address: 'address',
      ),
      dateTime: 'jun/16/2023'),
  ProgressModel(
      id: 15,
      lessonsCount: 28,
      leaderType: ProgressType.allTime,
      userModel: UserModel(
        name: 'Wade Warren',
        isPremium: true,
        profileImage: ImagesPath.kUser1,
        address: 'address',
      ),
      dateTime: 'jun/16/2023'),
];
