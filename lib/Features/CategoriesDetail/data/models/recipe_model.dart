class RecipeModel {
  final int id, categoryId;
  final String title, description, photo;
  final int timeRequired;
  final num rating;

  RecipeModel({
    required this.categoryId,
    required this.id,
    required this.timeRequired,
    required this.photo,
    required this.title,
    required this.rating,
    required this.description,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      categoryId: json['categoryId'],
      id: json['id'],
      timeRequired: json['timeRequired'],
      photo: json['photo'],
      title: json['title'],
      rating: json['rating'],
      description: json['description'],
    );
  }
}
