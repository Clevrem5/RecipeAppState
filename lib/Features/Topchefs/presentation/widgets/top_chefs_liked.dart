import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:recipeapp3/Core/data/models/topchefs_model.dart';
import 'package:recipeapp3/Features/CategoriesDetail/presentation/widgets/recipe_image_with_like.dart';
import 'package:recipeapp3/Features/Topchefs/presentation/widgets/following_button.dart';
import 'package:recipeapp3/Features/Topchefs/presentation/widgets/recipe_reverse_rating.dart';
import 'package:recipeapp3/Features/Topchefs/presentation/widgets/share_buttuon.dart';
import 'package:recipeapp3/Features/zeroCommon/body/recipe_app_text.dart';
import '../../../../Core/navigation/paths.dart';
import '../../../../Core/utils/colors.dart';
import '../manager/topcefs/top_chefs_state.dart';

class TopChefsLiked extends StatelessWidget {
  TopChefsLiked({
    super.key,
    required this.state,
  });

  TopChefsState state;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 18.w,
      children: [
        for (var chef in state.mostLikedChefs)
          SizedBox(
            width: 170.w,
            height: 226.h,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                GestureDetector(
                  onTap: () {
                    context.push(Routes.getChefsProfile(chef.id));
                  },
                  child: Container(
                    width: 160.w,
                    height: 76.h,
                    padding: EdgeInsets.fromLTRB(15.w, 6.h, 15.w, 10.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(14),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RecipeAppText(
                          data: "${chef.firstName} ${chef.lastName}",
                          color: AppColors.beigeColor,
                          size: 12.sp,
                        ),
                        RecipeAppText(
                          data: "@${chef.username}",
                          color: AppColors.redPinkMain,
                          size: 12.sp,
                          weight: FontWeight.w300,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RecipeReverseRating(),
                            Row(
                              spacing: 2.h,
                              children: [
                                FollowingButton(),
                                shareButtuon(),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: RecipeImageWithLike<TopChefModel>(
                    recipe: chef,
                    getPhotoUrl: (chef) => chef.image,
                    width: 170.w,
                    height: 153.h,
                    shadow: false,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
