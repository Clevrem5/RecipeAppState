import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipeapp3/Core/data/models/categories_model.dart';
import 'package:recipeapp3/Features/Categories/presentation/manager/categories_View_model.dart';
import 'package:recipeapp3/Features/CategoriesDetail/presentation/widgets/ism.dart';
import 'package:recipeapp3/Features/HomePage/presentation/pages/cubit.dart';
import 'package:recipeapp3/Features/Reviews/presentation/manager/create_review/create_review_bloc.dart';
import 'package:recipeapp3/Features/Reviews/presentation/manager/review/review_bloc.dart';
import 'package:recipeapp3/Features/Reviews/presentation/pages/create_review_view.dart';
import 'package:recipeapp3/Features/Reviews/presentation/pages/reviews_view.dart';

import '../../Features/Categories/presentation/pages/categories_view.dart';
import '../../Features/CategoriesDetail/presentation/manager/category_detail_view_model.dart';
import '../../Features/CategoriesDetail/presentation/pages/Categories_detail_view.dart';
import 'paths.dart';

final router = GoRouter(
  initialLocation: Paths.getReviews( 2),
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
      builder: (context, state) => BlocProvider(
        create: (context) => NameCubit(),
          child: CubitPage()),
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
      builder: (context, state) => BlocProvider(
          create: (context) => ReviewsBloc(
                recipeRepo: context.read(),
                recipeId: int.parse(state.pathParameters['recipeId']!),
              ),
          child: ReviewsPage()),
    ),
    GoRoute(
      path: Paths.createReview,
      builder: (context, state) => BlocProvider(
        create: (context) => CreateReviewBloc(),
        child: CreateReviewView(),
      ),
    )
  ],
);

// builder: (context, state) => ChangeNotifierProvider(
//   create: (context) => ReviewViewModel(
//     reviewRepo: context.read<ReviewsRepository>(),
//   ),
//   child: ReviewsPage(),