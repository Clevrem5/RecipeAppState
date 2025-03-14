import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipeapp3/Features/Reviews/presentation/manager/create_review/create_review_event.dart';
import 'package:recipeapp3/Features/zeroCommon/Appbar/recipe_app_bar.dart';
import 'package:recipeapp3/Features/zeroCommon/bottomNavigation/recipe_bottom_Navigation.dart';

import '../../../../../Core/utils/colors.dart';
import '../../manager/create_review/create_review_bloc.dart';
import '../../manager/create_review/create_review_state.dart';

class CreateReviewView extends StatelessWidget {
  const CreateReviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: RecipeAppBar(
        title: "Leave A Review",
      ),
      body: ListView(
        children: [
          BlocBuilder<CreateReviewBloc, CreateReviewState>(
            builder: (context, state) => Row(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                (index) {
                  return GestureDetector(
                    onTap: () => context.read<CreateReviewBloc>().add(
                          CreateReviewRate(currentIndex: index),
                        ),
                    child: SizedBox(
                      width: 29,
                      height: 29,
                      child: SvgPicture.asset(
                        "assets/icons/star-${index <= (state.currentIndex ?? -1) ? "full" : "empty"}.svg",
                        colorFilter: ColorFilter.mode(AppColors.redPinkMain, BlendMode.srcIn),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: RecipeBottomNavigation(),
    );
  }
}
