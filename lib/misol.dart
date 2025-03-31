void main(List<String>args) {
  Clevrem<num>(5, 6);
  Clevrem<String>("Bekzod", "Clevrem");
  String a="a'lochi";
  print(a);
}

T? Clevrem<T>(T? value, T? value2) {
  if (value is num && value2 is num) {
    print("bu num shaklida ${value * value2}");
    return (value * value2) as T;
  } else if (value is String || value2 is String) {
    print("bu String shaklida yig'indini topib bo'lmaydi!!!");
    return null;
  }
}
