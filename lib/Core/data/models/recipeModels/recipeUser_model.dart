class RecipeUserModel {
  final int id;
  final String profilePhoto, username, firstName, lastName;

  RecipeUserModel({
    required this.id,
    required this.profilePhoto,
    required this.username,
    required this.firstName,
    required this.lastName,
  });

  factory RecipeUserModel.fromJson(Map<String, dynamic> json) {
    return RecipeUserModel(
      id: json['id'],
      profilePhoto: json['profilePhoto'],
      username: json['username'],
      firstName: json['firstName'],
      lastName: json['lastName'],
    );
  }
}
