class ExpenseModel {
  final String? title;
  final double? amount;
  final String? category;

  ExpenseModel({this.title, this.amount, this.category});
}

class ExpenseCategoryModel {
  final String? food;
  final String? transportation;
  final String? utilities;
  ExpenseCategoryModel({
    required this.food,
    required this.transportation,
    required this.utilities,
  });
}
