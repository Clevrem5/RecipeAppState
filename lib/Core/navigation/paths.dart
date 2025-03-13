class Paths{
  static const String categories='/categories';
  static const  String community='/community';
  static const  String homePage='/homePage';
  static const String profile='/profile';
  static const String categoryDetail='/categoryDetail';
  static const String recipeDetail='/recipeDetail';
  static const String login='/login';
  static const String signUp='/signUp';
  static const String onboarding='/onboarding';
  static const String profileInfo='/profileInfo';
  static const String reView='/reviews/:recipeId';

  static String getReviews(int recipeId)=>'/reviews/$recipeId';

}