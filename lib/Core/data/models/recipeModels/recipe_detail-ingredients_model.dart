class IngredientsModel {
  final int  order;
  final String name,amount;

  IngredientsModel({
    required this.order,
    required this.name,
    required this.amount,
  });

  factory IngredientsModel.fromJson(Map<String, dynamic> json) {
    return IngredientsModel(
      order: json['order'],
      name: json['name'],
      amount: json['amount'],
    );
  }
}
