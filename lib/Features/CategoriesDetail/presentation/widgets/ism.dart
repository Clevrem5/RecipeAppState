import 'package:bloc/bloc.dart';

class NameCubit extends Cubit<String> {
  NameCubit() : super('Akbar'); // Boshlang‘ich qiymat

  void changeName() {
    emit('Guli'); // Yangi qiymatni emit qilamiz
  }
  void changeName2() {
    emit('Akbar'); // Yangi qiymatni emit qilamiz
  }
}
