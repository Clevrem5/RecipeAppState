class Routes{
  static const String categories='/categories';
  static const  String community='/community';
  static const  String homePage='/homePage';
  static const String profile='/profile';
  static const String categoryDetail='/categoryDetail';
  static const String recipeDetail='/recipe-detail/:recipeId';
  static const String login='/login';
  static const String signUp='/signUp';
  static const String trendingRecipe='/trending-recipe';
  static const String onboarding='/onboarding';
  static const String profileInfo='/profileInfo';
  static const String topChefs='/top-chefs';
  static const String reView='/reviews/:recipeId';
  static const String createReview='/create-reviews/:recipeId';

  static String getReviews(int recipeId)=>'/reviews/$recipeId';
  static String getCreateReviews(int recipeId)=>'/create-reviews/$recipeId';
  static String getRecipeDetail(int recipeId)=>'/recipe-detail/$recipeId';

}