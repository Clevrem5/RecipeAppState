import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../zeroCommon/Appbar/autPageAppBar.dart';
import '../manager/singupViewModel.dart';
import '../widgets/signUp_body.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key, required this.vm});

  final SignUpViewModel vm;

  final con = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignUpViewModel(
        repo: context.read(),
      ),
      builder: (context, child) {
        final vm = context.read<SignUpViewModel>();
        return Scaffold(
          appBar: AuthPageAppBar(
            title: "Sign Up",
          ),
          body: SignUpPageBody(vm: vm),
        );
      },
    );
  }
}