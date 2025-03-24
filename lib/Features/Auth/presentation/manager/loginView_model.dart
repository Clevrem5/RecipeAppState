import 'package:flutter/material.dart';
import '../../../../Core/data/repositories/auth repository.dart';

class AuthViewModel extends ChangeNotifier{
  final AuthRepository _repo;
  AuthViewModel({required AuthRepository repo}): _repo=repo;

  final formKey=GlobalKey<FormState>();
  final TextEditingController loginContr=TextEditingController();
  final TextEditingController passwordContr=TextEditingController();

  bool _isAuth=false;
  bool get isAuth=>_isAuth;

  Future<bool>submitForm()async{
    if (formKey.currentState!.validate()){
      String login= loginContr.text;
      String password= passwordContr.text;

      _isAuth=await _repo.login(login, password);
      notifyListeners();
    }
    return _isAuth;
  }

  Future<void> obtainToken(String login,String password)async{
    _isAuth=await _repo.login(login, password);
    notifyListeners();
  }

  Future<void>logOut()async{
    await _repo.logout();
    _isAuth=false;
    notifyListeners();
  }

}