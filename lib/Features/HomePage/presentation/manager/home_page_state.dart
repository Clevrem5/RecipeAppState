import 'package:equatable/equatable.dart';
import 'package:recipeapp3/Core/data/models/topchefs_model.dart';

enum HomePageStatus{idle,error ,loading,success}



class HomePageState extends Equatable{
  final List<TopChefModel> topchefs=[];

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}