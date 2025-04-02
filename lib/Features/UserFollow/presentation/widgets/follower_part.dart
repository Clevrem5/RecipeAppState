import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipeapp3/Features/UserFollow/presentation/widgets/follower_part_users.dart';

import '../../../../Core/utils/colors.dart';
import '../../../zeroCommon/body/recipe_text_field_simple.dart';
import '../manager/following_event.dart';
import '../manager/following_state.dart';

class FollowerPart extends StatelessWidget {
  const FollowerPart({
    super.key,
    required this.contr,
  });

  final TextEditingController contr;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          RecipeTextFieldSimple(
            validator: (value) => null,
            controller: contr,
            width: 355,
            height: 34,
            hint: 'Search',
            isCenter: false,
            textColor: AppColors.redPinkMain,
          ),
          SizedBox(height: 20.h),
          Expanded(
            child: BlocBuilder<FollowBloc, FollowState>(
              builder: (context, state) => switch(state.followStatus) {
                null => Center(child: Text("bosh keldi"),),
                FollowStatus.idle => Center(child: Text("Loaded")),
                FollowStatus.success => ListView(
                  padding: EdgeInsets.only(bottom: 200.h),
                  children: List.generate(
                    state.followers!.length,
                        (index) => SizedBox.fromSize(
                      size: Size(0, 75.h),
                      child: Column(
                        children: [
                          FollowerPartUsers(followers: state.followers![index],),
                        ],
                      ),
                    ),
                  ),
                ),
                FollowStatus.loading => Center(child: LinearProgressIndicator(),),
                FollowStatus.error => Center(child: Text("Something went wrong...")),
              },
            ),
          ),
        ],
      ),
    );
  }
}

/*
ListView(
              padding: EdgeInsets.only(bottom: 200.h),
              children: List.generate(
                10,
                (index) => SizedBox.fromSize(
                  size: Size(0, 75.h),
                  child: Column(
                    children: [
                      FollowerPartUsers(),
                    ],
                  ),
                ),
              ),
            )
 */
