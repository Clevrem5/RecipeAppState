import '../../../Features/Topchefs/presentation/widgets/recipe_app_follow_button.dart';

class ProfileModel  {

  final int id; // Endi "id" faqat "int"

  // Qolgan maydonlar
  final String userName, firstName, bio, lastName;
  final String image;
  final int recipeCount, followingCount, followerCount;

  ProfileModel({
    required this.id,
    required this.userName,
    required this.firstName,
    required this.lastName,
    required this.bio,
    required this.image,
    required this.recipeCount,
    required this.followingCount,
    required this.followerCount,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json["id"], // JSON-dan "id"ni oladi
      userName: json["username"],
      firstName: json["firstName"],
      lastName: json['lastName'],
      bio: json["presentation"],
      image: json["profilePhoto"],
      recipeCount: json["recipesCount"],
      followingCount: json["followingCount"],
      followerCount: json["followerCount"],
    );
  }
}