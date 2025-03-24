
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../../Core/utils/colors.dart';
import '../../../../zeroCommon/body/recipe_textButton.dart';
import '../../manager/create_review/create_review_bloc.dart';


class CreateReviewCancelAndSubmitSection extends StatelessWidget {
  const CreateReviewCancelAndSubmitSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 20.w,
      children: [
        RecipeTextButtonContainer(
          text: "Cancel",
          textColor: AppColors.pinkSub,
          containerColor: AppColors.pinkColor,
          containerWidth: 168.w,
          containerHeight: 29.h,
          callback: () => context.pop(),
        ),
        RecipeTextButtonContainer(
          text: "Submit",
          textColor: Colors.white,
          containerColor: AppColors.redPinkMain,
          containerWidth: 168.w,
          containerHeight: 29.h,
          callback: () => context.read<CreateReviewBloc>().add(CreateReviewSubmit()),
        ),
      ],
    );
  }
}
