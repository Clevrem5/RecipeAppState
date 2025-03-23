import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../Core/navigation/paths.dart';
import '../../../zeroCommon/body/recipeAuthText_field.dart';
import '../../../zeroCommon/body/recipeElevetedButton.dart';
import '../../../zeroCommon/body/recipe_numTextField.dart';

class LoginPageListView extends StatelessWidget {
  LoginPageListView({
    super.key,
  });

  final controller = TextEditingController();
  final controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 36),
      children: [
        SizedBox(height:135.h ),
        Form(
          child: Column(
            spacing: 10,
            children: [
              RecipeAuthTextField(
                label: "Email",
                hint: "example@example.com",
                validator: (value) => null,
                controller: controller,
              ),
              RecipeNumberTextField(
                label: "Password",
                hint: "● ● ● ● ● ● ● ●",
                validator: (value) => null,
                controller: controller2,
                isView: true,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 90.w,
        ),
        Center(
          child: Column(
            spacing: 20,
            children: [
              RecipeLogElevatedButton(
                text: "Login",
                callback: () {
                  context.go(Routes.profile);
                },
              ),
              RecipeLogElevatedButton(
                text: "Sign Up",
                callback: () {
                  context.go(Routes.signUp);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}