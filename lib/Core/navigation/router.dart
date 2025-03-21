import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipeapp3/Core/client.dart';
import 'package:recipeapp3/Core/data/models/categories_model.dart';
import 'package:recipeapp3/Core/data/repositories/trending-recipes_repository.dart';
import 'package:recipeapp3/Features/Categories/presentation/manager/categories_View_model.dart';
import 'package:recipeapp3/Features/CategoriesDetail/presentation/widgets/ism.dart';
import 'package:recipeapp3/Features/HomePage/presentation/pages/cubit.dart';
import 'package:recipeapp3/Features/RecipeDetail/presentation/manager/recipe_detail_bloc.dart';
import 'package:recipeapp3/Features/RecipeDetail/presentation/pages/recipe_detail_view.dart';
import 'package:recipeapp3/Features/Reviews/presentation/manager/create_review/create_review_bloc.dart';
import 'package:recipeapp3/Features/Reviews/presentation/manager/review/review_bloc.dart';
import 'package:recipeapp3/Features/Reviews/presentation/pages/create_review_view.dart';
import 'package:recipeapp3/Features/Reviews/presentation/pages/reviews_view.dart';
import 'package:recipeapp3/Features/TrendingRecipe/presentation/manager/trending_recipe_bloc.dart';
import 'package:recipeapp3/Features/TrendingRecipe/presentation/pages/trending_recipe_view.dart';

import '../../Features/Categories/presentation/pages/categories_view.dart';
import '../../Features/CategoriesDetail/presentation/manager/category_detail_view_model.dart';
import '../../Features/CategoriesDetail/presentation/pages/Categories_detail_view.dart';
import 'paths.dart';

final router = GoRouter(
  initialLocation: Routes.trendingRecipe,
  routes: [
    GoRoute(
      path: Routes.categories,
      builder: (context, state) => ChangeNotifierProvider(
        create: (context) => CategoriesBloc(catRepo: context.read()),
        child: CategoriesPage(),
      ),
    ),
    GoRoute(
      path: Routes.homePage,
      builder: (context, state) => BlocProvider(create: (context) => NameCubit(), child: CubitPage()),
    ),
    GoRoute(
      path: Routes.categoryDetail,
      builder: (context, state) => ChangeNotifierProvider(
        create: (context) => CategoryDetailViewModel(
          recipeRepo: context.read(),
          catRepo: context.read(),
          selected: state.extra as CategoryModel,
        ),
        child: CategoriesDetailView(),
      ),
    ),
    GoRoute(
      path: Routes.reView,
      builder: (context, state) => BlocProvider(
          create: (context) => ReviewsBloc(
                recipeRepo: context.read(),
                recipeId: int.parse(state.pathParameters['recipeId']!),
              ),
          child: ReviewsPage()),
    ),
    GoRoute(
      path: Routes.createReview,
      builder: (context, state) => BlocProvider(
        create: (context) => CreateReviewBloc(
          reviewRepo: context.read(),
        ),
        child: CreateReviewView(),
      ),
    ),
    // GoRoute(
    //   path: Paths.recipeDetail,
    //   builder: (context, state) => ChangeNotifierProvider(
    //     create: (context) => RecipeDetailViewModel(
    //       recipeId: int.parse(state.pathParameters['recipeId']!),
    //       recipeRepo: context.read(),
    //     ),
    //     child: RecipeDetailView( ),
    //   ),
    // ),
    GoRoute(
      path: Routes.recipeDetail,
      builder: (context, state) => BlocProvider(
        create: (context) => RecipeDetailBloc(
          repo: context.read(),
          recipeId: int.parse(state.pathParameters['recipeId']!),
        ),
        child: RecipeDetailView(),
      ),
    ),
    GoRoute(
      path: Routes.trendingRecipe,
      builder: (context, state) => BlocProvider(
        create: (context) => TrendingRecipeBloc(
          trendRepo: context.read(),

        ),
        child: TrendingRecipeView(),
      ),
    ),
  ],
);

// builder: (context, state) => ChangeNotifierProvider(
//   create: (context) => ReviewViewModel(
//     reviewRepo: context.read<ReviewsRepository>(),
//   ),
//   child: ReviewsPage(),
