import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipeapp3/Features/CategorieDetail/presentation/manager/category_detail_view_model.dart';
import 'package:recipeapp3/Features/CategorieDetail/presentation/pages/Categories_detail_view.dart';
import 'package:recipeapp3/Features/Categories/data/models/categories_model.dart';
import 'package:recipeapp3/Features/Categories/presentation/manager/categories_View_model.dart';
import 'package:recipeapp3/Features/HomePage/presentation/pages/cubit.dart';
import 'package:recipeapp3/Features/Reviews/data/repositories/reviews_repository.dart';
import 'package:recipeapp3/Features/Reviews/presentation/manager/review_viewModel.dart';
import 'package:recipeapp3/Features/Reviews/presentation/pages/reviews_view.dart';

import '../../Features/Categories/presentation/pages/categories_view.dart';
import 'paths.dart';

final router = GoRouter(
  initialLocation: Paths.reView,
  routes: [
    GoRoute(
      path: Paths.categories,
      builder: (context, state) => ChangeNotifierProvider(
        create: (context) => CategoriesBloc(catRepo: context.read()),
        child: CategoriesPage(),
      ),
    ),
    GoRoute(
      path: Paths.homePage,
      builder: (context, state) => CubitPage(),
    ),
    GoRoute(
      path: Paths.categoryDetail,
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
      path: Paths.reView,
      builder: (context, state) => ChangeNotifierProvider(
        create: (context) => ReviewViewModel(
          reviewRepo: context.read<ReviewsRepository>(),
        ),
        child: ReviewsPage(),
      ),
    ),
  ],
);
