import 'package:learnkuy/utils/images_path.dart';

class UserModel {
  String name;
  String profileImage;
  String address;
  bool isPremium;
  UserModel({
    required this.name,
    required this.isPremium,
    required this.profileImage,
    required this.address,
  });
}

UserModel currentUser = UserModel(
    name: 'Khalid ,Mohammed',
    isPremium: true,
    profileImage: ImagesPath.kUserProfile,
    address: ' Jidda, SA, 10016, Saudi');
