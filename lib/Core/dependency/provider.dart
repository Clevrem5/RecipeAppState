import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:recipeapp3/Core/client.dart';
import 'package:recipeapp3/Core/data/repositories/categories_repository.dart';
import 'package:recipeapp3/Core/data/repositories/reviews_repository.dart';

import '../data/repositories/recipe_repository.dart';

final List<SingleChildWidget> providers = [
  Provider(
    create: (context) => ApiClient(),
  ),
  Provider(
    create: (context) => CategoryRepository(
      client: context.read(),
    ),
  ),
  Provider(
    create: (context) => RecipeRepository(
      client: context.read(),
    ),
  ),
  Provider(
    create: (context) => ReviewsRepository(
      client: context.read(),
    ),
  ),
];
