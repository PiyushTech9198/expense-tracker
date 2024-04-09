import 'package:expense/expense_bloc/expense_bloc.dart';
import 'package:expense/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExpenseBloc(),
      child: MaterialApp(
          title: 'Expense Tracker',
          theme: ThemeData(
            primaryColor:
                Colors.teal, 
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.teal, 
              primary: Colors.teal,
              primaryContainer: Colors.tealAccent, 
              secondary:
                  Colors.greenAccent, 
              surface: Colors.white, 
              onPrimary: Colors.white, 
              onSecondary: Colors.black, 
              onError: Colors.red, 
            ),
          ),
          home: const HomeScreen()),
    );
  }
}
