import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipeapp3/Features/Reviews/presentation/manager/create_review/create_review_event.dart';
import 'package:recipeapp3/Features/zeroCommon/body/recipe_app_text.dart';

import '../../../../Core/utils/colors.dart';
import '../manager/create_review/create_review_bloc.dart';
import '../manager/create_review/create_review_state.dart';

class ReviewRatingStar extends StatelessWidget {
  const ReviewRatingStar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateReviewBloc, CreateReviewState>(
      builder: (context, state) => Column(
        spacing: 5,
        children: [
          Row(
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
                      colorFilter: ColorFilter.mode(
                          AppColors.redPinkMain, BlendMode.srcIn),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
          RecipeAppText(
            data: "Your overall rating",
            color: Colors.white,
            size: 12.sp,
          ),
        ],
      ),
    );
  }
}
