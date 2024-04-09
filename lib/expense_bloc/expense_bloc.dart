import 'dart:async';

import 'package:expense/expense_bloc/expense_event.dart';
import 'package:expense/expense_bloc/expense_state.dart';
import 'package:expense/model/expense_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
  ExpenseBloc() : super(const ExpenseInitial()) {
    on<AddExpense>(
      _expenseEvent,
    );
  }
  List<ExpenseModel> expenseModel = <ExpenseModel>[];

  FutureOr<void> _expenseEvent(AddExpense event, Emitter<ExpenseState> emit) {
    emit(const ExpenseLoading());
    try {
      expenseModel.add(event.expense!);
      emit(const ExpenseLoaded().copyWith(expenses: expenseModel));
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
