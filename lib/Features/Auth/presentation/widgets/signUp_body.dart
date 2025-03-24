import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:recipeapp3/Core/utils/colors.dart';
import 'package:recipeapp3/Features/Auth/presentation/widgets/auth_snakbar.dart';
import 'package:recipeapp3/Features/zeroCommon/body/recipe_app_text.dart';

import '../../../../Core/navigation/paths.dart';
import '../../../zeroCommon/body/recipeAuthText_field.dart';
import '../../../zeroCommon/body/recipeElevetedButton.dart';
import '../../../zeroCommon/body/recipeTextField.dart';
import '../../../zeroCommon/body/recipe_numTextField.dart';
import '../manager/singupViewModel.dart';

class SignUpPageBody extends StatelessWidget {
  const SignUpPageBody({
    super.key,
    required this.vm,
  });

  final SignUpViewModel vm;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.fromLTRB(30, 25, 30, 0),
      children: [
        Form(
          key: vm.formKey,
          child: Column(
            spacing: 10,
            children: [
              RecipeAuthTextField(
                label: "First Name",
                hint: "John Doe",
                validator: (value) => null,
                controller: vm.firstNameContr,
              ),
              RecipeAuthTextField(
                label: "Last Name",
                hint: "Clevrem",
                validator: (value) => null,
                controller: vm.lastNameContr,
              ),
              RecipeAuthTextField(
                label: "UserName",
                hint: "Clevrem",
                validator: (value) => null,
                controller: vm.userNameContr,
              ),
              RecipeAuthTextField(
                label: "Email",
                hint: "Example@example.com",
                validator: (value) => null,
                controller: vm.emailContr,
              ),
              RecipeAuthTextField(
                label: "Mobile Number",
                hint: "+998945987905",
                validator: (value) => null,
                controller: vm.phoneNumberContr,
              ),
              RecipeDataTextField(),
              RecipeNumberTextField(
                label: "Password",
                hint: "● ● ● ● ● ● ● ●",
                validator: (value) => null,
                controller: vm.passwordContr,
              ),
              RecipeNumberTextField(
                label: "Confirm Password",
                hint: "● ● ● ● ● ● ● ●",
                controller: vm.confirmPasswordContr,
                validator: (value) {
                  if (vm.confirmPasswordContr.text != vm.passwordContr.text) {
                    return "Kiritilgan parol bir-xil bo'lishi shart";
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 40,
            right: 40,
            bottom: 90,
          ),
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // TextFor(
              //   text: "     By continuing, you agree to "
              //       "Terms of Use and Privacy Policy.",
              //   size: 14,
              //   height: true,
              //   family: "League Spartan",
              //   line: true,
              // ),
              RecipeAppText(
                data: "     By continuing, you agree to "
                    "Terms of Use and Privacy Policy.",
                color: Colors.white,
                size: 14.sp,
                line: 2,
                height: 1,
                font: false,
              ),
              RecipeLogElevatedButton(
                text: "Sing Up",
                size: Size(195, 45),
                textColor: Colors.white,
                color: AppColors.pinkColor,
                callback: () async {
                  if (vm.formKey.currentState!.validate()) {
                    if (await vm.signUp() && context.mounted) {
                      await showDialog(
                        context: context,
                        builder: (context) => AuthSnecbar(),
                      );
                    }
                  }
                },
              ),
              GestureDetector(
                onTap: () {
                  context.go(Routes.login);
                },
                child: RecipeAppText(
                  data: "    Already have an account?  Log In",
                  color: Colors.white,
                  size: 13.sp,
                  height: 1,
                  line: 2,
                  font: false,
                ),
                // child: TextFor(
                //   text: "    Already have an account?  Log In",
                //   size: 13,
                //   height: true,
                //   family: "League Spartan",
                //   line: true,
                // ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
