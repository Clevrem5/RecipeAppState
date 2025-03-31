import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../Core/navigation/paths.dart';
import '../../../../Core/utils/sizes.dart';
import '../../../zeroCommon/Appbar/autPageAppBar.dart';
import '../../../zeroCommon/body/recipeAuthText_field.dart';
import '../../../zeroCommon/body/recipeElevetedButton.dart';
import '../../../zeroCommon/body/recipe_numTextField.dart';
import '../manager/loginView_model.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    super.key,
    required this.vm,
  });

  final AuthViewModel vm;

  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);
    return ListenableBuilder(
      listenable: vm,
      builder: (context, child) => Scaffold(
        appBar: AuthPageAppBar(title: "Login",),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 36),
          children: [
            SizedBox(height: 135 * AppSizes.hRatio),
            Form(
              key: vm.formKey,
              child: Column(
                spacing: 10,
                children: [
                  RecipeAuthTextField(
                    label: "Email",
                    hint: "example@example.com",
                    validator: (value) => null,
                    controller: vm.loginContr,
                  ),
                  RecipeNumberTextField(
                    label: "Password",
                    hint: "● ● ● ● ● ● ● ●",
                    validator: (value) => null,
                    controller: vm.passwordContr,
                    isView: true,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 90 * AppSizes.hRatio,
            ),
            Column(
              spacing: 20,
              children: [
                RecipeLogElevatedButton(
                    text: "Login",
                    callback: () async {
                      if (await vm.submitForm() && context.mounted) {
                        context.push(Routes.myRecipes,);
                      }
                    }),
                RecipeLogElevatedButton(
                  text: "Sign Up",
                  callback: () {
                    context.go(Routes.signUp);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}