import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipeapp3/Core/client.dart';
import 'package:recipeapp3/Core/data/models/categories_model.dart';
import 'package:recipeapp3/Core/data/repositories/auth%20repository.dart';
import 'package:recipeapp3/Features/Auth/presentation/manager/loginView_model.dart';
import 'package:recipeapp3/Features/Auth/presentation/manager/singupViewModel.dart';
import 'package:recipeapp3/Features/Auth/presentation/pages/login_view.dart';
import 'package:recipeapp3/Features/Auth/presentation/pages/signUp_view.dart';
import 'package:recipeapp3/Features/Categories/presentation/manager/categories_View_model.dart';
import 'package:recipeapp3/Features/CategoriesDetail/presentation/widgets/ism.dart';
import 'package:recipeapp3/Features/Create_Recipe_Clevrem/pages/create_recipe_bekzod.dart';
import 'package:recipeapp3/Features/HomePage/presentation/pages/cubit.dart';
import 'package:recipeapp3/Features/MyRecipes/presentation/manager/my-recipes_bloc.dart';
import 'package:recipeapp3/Features/MyRecipes/presentation/pages/my-recipes_view.dart';
import 'package:recipeapp3/Features/Notification/presentation/manager/notifications_bloc.dart';
import 'package:recipeapp3/Features/Notification/presentation/pages/notifications_view.dart';
import 'package:recipeapp3/Features/Profile/presentation/manager/profile_bloc.dart';
import 'package:recipeapp3/Features/Profile/presentation/manager/profile_event.dart';
import 'package:recipeapp3/Features/Profile/presentation/pages/Profile_view.dart';
import 'package:recipeapp3/Features/RecipeDetail/presentation/manager/recipe_detail_bloc.dart';
import 'package:recipeapp3/Features/RecipeDetail/presentation/pages/recipe_detail_view.dart';
import 'package:recipeapp3/Features/Reviews/presentation/manager/create_review/create_review_bloc.dart';
import 'package:recipeapp3/Features/Reviews/presentation/manager/review/review_bloc.dart';
import 'package:recipeapp3/Features/Reviews/presentation/pages/create_review_view.dart';
import 'package:recipeapp3/Features/Reviews/presentation/pages/reviews_view.dart';
import 'package:recipeapp3/Features/Topchefs/presentation/manager/topcefs_profile/top_chefs_profile_bloc.dart';
import 'package:recipeapp3/Features/Topchefs/presentation/pages/chefs_profile_view.dart';
import 'package:recipeapp3/Features/TrendingRecipe/presentation/manager/trending_recipe_bloc.dart';
import 'package:recipeapp3/Features/TrendingRecipe/presentation/pages/trending_recipe_view.dart';

import '../../Features/Categories/presentation/pages/categories_view.dart';
import '../../Features/CategoriesDetail/presentation/manager/category_detail_view_model.dart';
import '../../Features/CategoriesDetail/presentation/pages/Categories_detail_view.dart';
import '../../Features/Topchefs/presentation/manager/topcefs/top_chefs_bloc.dart';
import '../../Features/Topchefs/presentation/pages/chefs_view.dart';
import '../../main.dart';
import 'paths.dart';

final router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: Routes.login,
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
      pageBuilder: (context, state) => CustomTransitionPage(
        transitionDuration: Duration(seconds: 2),
        reverseTransitionDuration: Duration(seconds: 2),
        child: ChangeNotifierProvider(
          create: (context) => CategoryDetailViewModel(
            recipeRepo: context.read(),
            catRepo: context.read(),
            selected: state.extra as CategoryModel,
          ),
          child: CategoriesDetailView(),
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final curve = CurvedAnimation(parent: animation, curve: Curves.bounceInOut);
          return ScaleTransition(
            scale: Tween<double>(begin: 0, end: 1).animate(curve),
            child: child,
          );
        },
      ),
    ),
    GoRoute(
      path: Routes.reView,
      pageBuilder: (context, state) => CustomTransitionPage(
        transitionDuration: Duration(seconds: 2),
        reverseTransitionDuration: Duration(seconds: 2),
        child: BlocProvider(
            create: (context) => ReviewsBloc(
                  recipeRepo: context.read(),
                  recipeId: int.parse(state.pathParameters['recipeId']!),
                ),
            child: ReviewsPage()),
        transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
          opacity: Tween<double>(begin: 0.0, end: 1.0).animate(animation),
          child: child,
        ),
      ),
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
      pageBuilder: (context, state) => CustomTransitionPage(
        transitionDuration: Duration(seconds: 2),
        reverseTransitionDuration: Duration(seconds: 2),
        child: BlocProvider(
          create: (context) => TrendingRecipeBloc(
            trendRepo: context.read(),
          ),
          child: TrendingRecipeView(),
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final curve = CurvedAnimation(parent: animation, curve: Curves.bounceIn);
          return SlideTransition(
            position: Tween<Offset>(
              begin: Offset(0, 1),
              end: Offset(0, 0),
            ).animate(curve),
            child: child,
          );
        },
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
          userId: int.parse(state.pathParameters['userId']!),
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
        create: (context) {
          return TopChefsProfileBloc(
            userRepo: context.read(),
            userId: int.parse(state.pathParameters['UserId']!),
          );
        },
        child: TopChefsProfileDetail(),
      ),
    ),
    GoRoute(
      path: Routes.myRecipes,
      builder: (context, state) => BlocProvider(
        create: (context) {
          return MyRecipesBloc(
            repo: context.read(),
          );
        },
        child: MyRecipesView(),
      ),
    ),
    // GoRoute(
    //   path: Routes.createRecipe,
    //   pageBuilder: (context, state) => CustomTransitionPage(
    //     transitionDuration: Duration(seconds: 5),
    //     child: CreateRecipeView(),
    //     transitionsBuilder: (context, animation, secondaryAnimation, child) => SlideTransition(
    //       position: Tween<Offset>(begin: Offset(1, 0), end: Offset.zero).animate(animation),
    //     ),
    //   ),
    // )
    //,
    GoRoute(
      path: Routes.createRecipe,
      builder: (context, state) => CreateRecipeView(),
    )
  ],
);
