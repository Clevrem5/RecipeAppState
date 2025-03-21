import 'package:flutter/material.dart';

class AppSizes{
  static late  double Wratio;
  static late  double hRatio;
  static void init(BuildContext context){
    var size= MediaQuery.sizeOf(context);
    Wratio=size.width/430;
    hRatio=size.height/932;
  }
}