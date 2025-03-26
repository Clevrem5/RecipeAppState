import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipeapp3/Core/client.dart';
import 'package:recipeapp3/Core/data/models/categories_model.dart';
import 'package:recipeapp3/Core/data/repositories/auth%20repository.dart';
import 'package:recipeapp3/Core/data/repositories/profile_repository.dart';
import 'package:recipeapp3/Features/Auth/presentation/manager/loginView_model.dart';
import 'package:recipeapp3/Features/Auth/presentation/manager/singupViewModel.dart';
import 'package:recipeapp3/Features/Auth/presentation/pages/login_view.dart';
import 'package:recipeapp3/Features/Auth/presentation/pages/signUp_view.dart';
import 'package:recipeapp3/Features/Categories/presentation/manager/categories_View_model.dart';
import 'package:recipeapp3/Features/CategoriesDetail/presentation/widgets/ism.dart';
import 'package:recipeapp3/Features/HomePage/presentation/pages/cubit.dart';
import 'package:recipeapp3/Features/Notification/presentation/manager/notifications_bloc.dart';
import 'package:recipeapp3/Features/Notification/presentation/pages/notifications_view.dart';
import 'package:recipeapp3/Features/Profile/presentation/manager/profile_bloc.dart';
import 'package:recipeapp3/Features/Profile/presentation/pages/Profile_view.dart';
import 'package:recipeapp3/Features/RecipeDetail/presentation/manager/recipe_detail_bloc.dart';
import 'package:recipeapp3/Features/RecipeDetail/presentation/pages/recipe_detail_view.dart';
import 'package:recipeapp3/Features/Reviews/presentation/manager/create_review/create_review_bloc.dart';
import 'package:recipeapp3/Features/Reviews/presentation/manager/review/review_bloc.dart';
import 'package:recipeapp3/Features/Reviews/presentation/pages/create_review_view.dart';
import 'package:recipeapp3/Features/Reviews/presentation/pages/reviews_view.dart';
import 'package:recipeapp3/Features/Topchefs/presentation/manager/topcefs_profile/top_chefs_profile_bloc.dart';
import 'package:recipeapp3/Features/Topchefs/presentation/manager/topcefs_profile/top_chefs_profile_event.dart';
import 'package:recipeapp3/Features/Topchefs/presentation/pages/chefs_profile_view.dart';
import 'package:recipeapp3/Features/TrendingRecipe/presentation/manager/trending_recipe_bloc.dart';
import 'package:recipeapp3/Features/TrendingRecipe/presentation/pages/trending_recipe_view.dart';

import '../../Features/Categories/presentation/pages/categories_view.dart';
import '../../Features/CategoriesDetail/presentation/manager/category_detail_view_model.dart';
import '../../Features/CategoriesDetail/presentation/pages/Categories_detail_view.dart';
import '../../Features/Topchefs/presentation/manager/topcefs/top_chefs_bloc.dart';
import '../../Features/Topchefs/presentation/pages/chefs_view.dart';
import 'paths.dart';

final router = GoRouter(
  initialLocation: Routes.getChefsProfile(2),

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
          recipeRepo: context.read(),
          reviewRepo: context.read(),
        )..add(
            CreateReviewLoading(
              recipeId: int.parse(state.pathParameters['recipeId']!),
            ),
          ),
        child: CreateReviewView(),
      ),
    ),
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
      path: Routes.topChefs,
      builder: (context, state) => BlocProvider(
        create: (context) => TopChefsBloc(
          chefRepo: context.read(),
        ),
        child: TopChefsView(),
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
    GoRoute(
      path: Routes.login,
      builder: (context, state) => LoginPage(
        vm: AuthViewModel(
          repo: AuthRepository(client: ApiClient()),
        ),
      ),
    ),
    GoRoute(
      path: Routes.signUp,
      builder: (context, state) => SignUpPage(
        vm: SignUpViewModel(
          repo: AuthRepository(
            client: ApiClient(),
          ),
        ),
      ),
    ),
    GoRoute(
      path: Routes.profile,
      builder: (context, state) => BlocProvider(
        create: (context) => ProfileBloc(
          repo: context.read(),
        ),
        child: ProfileView(),
      ),
    ),
    GoRoute(
      path: Routes.notifications,
      builder: (context, state) => BlocProvider(
        create: (context) => NotificationsBloc(
          repo: context.read(),
        ),
        child: NotificationsView(),
      ),
    ),
    GoRoute(
      path: Routes.chefsProfile,
      builder: (context, state) => BlocProvider(
        create: (context) => TopChefsProfileBloc(userRepo: context.read<ProfileRepository>())
          ..add(
            TopChefsProfileLoading(
              userId: int.parse(state.pathParameters['userId']!),
            ),
          ),
        child: TopChefsProfileDetail(),
      ),
    ),
  ],
);
