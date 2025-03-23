import 'package:flutter/material.dart';
import '../../data/repositories/auth repository.dart';

class SignUpViewModel extends ChangeNotifier {
  SignUpViewModel({required AuthRepository repo}) : _repo = repo;

  final AuthRepository _repo;
  final formKey = GlobalKey<FormState>();
  final firstNameContr = TextEditingController();
  final lastNameContr = TextEditingController();
  final userNameContr = TextEditingController();
  final emailContr = TextEditingController();
  final phoneNumberContr = TextEditingController();
  final passwordContr = TextEditingController();
  final confirmPasswordContr = TextEditingController();
  DateTime? _selectedData;

  DateTime? get selectedData => _selectedData;

  set selectedData(DateTime? value) {
    _selectedData = value ?? _selectedData;
    notifyListeners();
  }

  Future<bool> signUp() async {
    final result = await _repo.signUp(
      firstName: firstNameContr.text,
      lastName: lastNameContr.text,
      userName: userNameContr.text,
      email: emailContr.text,
      phoneNumber: phoneNumberContr.text,
      dateOfBirth: selectedData ?? DateTime.now(),
      password: passwordContr.text,
    );
    print("malumot ketdi ${result}");
    return result;
  }
}
