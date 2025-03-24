
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:recipeapp3/Core/navigation/paths.dart';

class AuthSnecbar extends StatelessWidget {
  const AuthSnecbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 30),
        height: 286.h,
        width: 250.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Column(
          children: [
            GestureDetector(
              onTap: ()=>context.push(Routes.categories),
              child: Center(
                child: Text(
                  'Sign up succesful!',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}