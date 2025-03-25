import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipeapp3/Core/utils/colors.dart';
import 'package:recipeapp3/Features/Notification/presentation/manager/notifications_bloc.dart';
import 'package:recipeapp3/Features/Notification/presentation/manager/notifications_state.dart';
import 'package:recipeapp3/Features/zeroCommon/Appbar/recipe_app_bar.dart';
import 'package:recipeapp3/Features/zeroCommon/body/recipe_app_button_container.dart';
import 'package:recipeapp3/Features/zeroCommon/body/recipe_app_text.dart';

import '../../../zeroCommon/bottomNavigation/recipe_bottom_Navigation.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: RecipeAppBar(
        title: "Notifications",
        actions: [],
      ),
      body: BlocBuilder<NotificationsBloc, NotificationsState>(
        builder: (context, state) {
          final notific = state.notific;
          switch (state.notificStatus) {
            case NotificationsStatus.idle:
              return Center(child: Text("Loaded"));
            case NotificationsStatus.success:
              return ListView.separated(
                padding: EdgeInsets.fromLTRB(36.w, 15.h, 36.w, 150.h),
                itemCount: state.notific!.length,
                separatorBuilder: (context, index) => SizedBox(height: 15.h),
                itemBuilder: (context, index) => Column(
                  children: [
                    Container(
                      width: 355.w,
                      height: 75.h,
                      padding: EdgeInsets.fromLTRB(15.w, 11.h, 18.w, 15.h),
                      decoration: BoxDecoration(
                        color: AppColors.pinkColor,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Row(mainAxisAlignment: MainAxisAlignment.start,
                        spacing: 10.h,
                        children: [

                          Column(crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 5.7.h,
                            children: [
                              RecipeAppText(
                                data: notific![index].title,
                                color: AppColors.redPinkMain,
                                size: 15.sp,
                                height: 1,
                                weight: FontWeight.w600,
                              ),
                              SizedBox(width:250.w ,
                                height: 28.h,
                                child: RecipeAppText(
                                  data: notific[index].subtitle,
                                  color: AppColors.beigeColor,
                                  size: 12.sp,
                                  line: 2,
                                  height: 1,
                                  weight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            case NotificationsStatus.loading:
              return Center(
                child: CircularProgressIndicator(),
              );
            case NotificationsStatus.error:
              return Center(child: Text("Something went Wrong!!!......"));
          }
        },
      ),
      bottomNavigationBar: RecipeBottomNavigation(),
    );
  }
}
