class RecipeCreateReviewModel {
  final int id;
  final String title, image;

  RecipeCreateReviewModel({
    required this.id,
    required this.image,
    required this.title,
  });

  factory RecipeCreateReviewModel.fromJson(Map<String, dynamic> json) {
    return RecipeCreateReviewModel(
      id: json['id'],
      image: json['image'],
      title: json['title'],
    );
  }
}
