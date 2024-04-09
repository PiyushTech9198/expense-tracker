// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:expense/model/expense_model.dart';

abstract class ExpenseState extends Equatable {
  const ExpenseState();

  @override
  List<Object?> get props => [];
}

class ExpenseLoaded extends ExpenseState {
  final List<ExpenseModel?>? expenses;

  const ExpenseLoaded({this.expenses});

  @override
  List<Object?> get props => [expenses];

  ExpenseLoaded copyWith({
    List<ExpenseModel>? expenses,
  }) {
    return ExpenseLoaded(
      expenses: expenses ?? this.expenses,
    );
  }
}

class ExpenseInitial extends ExpenseState {
  const ExpenseInitial();

  @override
  List<Object?> get props => [];
}

class ExpenseLoading extends ExpenseState {
  const ExpenseLoading();

  @override
  List<Object?> get props => [];
}
