// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:expense/model/expense_model.dart';

abstract class ExpenseEvent extends Equatable {
  const ExpenseEvent();

  @override
  List<Object?> get props => [];
}

class AddExpense extends ExpenseEvent {
  final ExpenseModel? expense;

  const AddExpense({this.expense});

  @override
  List<Object?> get props => [expense];

  AddExpense copyWith({
    ExpenseModel? expense,
  }) {
    return AddExpense(
      expense: expense ?? this.expense,
    );
  }
}
