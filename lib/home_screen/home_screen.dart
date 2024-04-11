import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:expense/add_expense_screen/add_expense_screen.dart';
import 'package:expense/expense_bloc/expense_bloc.dart';
import 'package:expense/expense_bloc/expense_state.dart';
import 'package:expense/model/expense_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Expense Tracker',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: BlocBuilder<ExpenseBloc, ExpenseState>(
        builder: (context, state) {
          if (state is ExpenseInitial) {
            return const Center(child: Text("No Expenses"));
          } else if (state is ExpenseLoaded) {
            return _buildExpenseChart(context, state.expenses);
          } else {
            return const Center(child: Text("Error"));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddExpenseScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildExpenseChart(
      BuildContext context, List<ExpenseModel?>? expenses) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          const Text(
            'Expense Distribution Chart',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 200,
            child: SfCircularChart(
              series: <CircularSeries>[
                PieSeries<ExpenseModel?, String>(
                  dataSource: expenses!,
                  xValueMapper: (ExpenseModel? expense, _) =>
                      expense?.category!,
                  yValueMapper: (ExpenseModel? expense, _) => expense?.amount!,
                  dataLabelSettings: const DataLabelSettings(isVisible: true),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Center(
            child: Text(
              'Expense List',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(height: 10),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: expenses.length,
            itemBuilder: (context, index) {
              final expense = expenses[index];
              return ListTile(
                title: Text(
                  expense?.title! ?? '',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w400),
                ),
                subtitle: Text(
                    'Category: ${expense?.category}\nAmount: \$${expense?.amount!.toStringAsFixed(2)}'),
              );
            },
          ),
        ],
      ),
    );
  }
}
