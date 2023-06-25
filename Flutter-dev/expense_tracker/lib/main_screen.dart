import 'package:flutter/material.dart';
import 'utility/expenseclass.dart';
import 'package:expense_tracker/utility/expenses_list.dart';

class ExpScreen extends StatefulWidget {
  const ExpScreen({super.key});

  @override
  State<ExpScreen> createState() => _ExpScreenState();
}

class _ExpScreenState extends State<ExpScreen> {
  final List<Expense> _registeredExpense = [
    Expense(
        title: "stationary",
        amount: 200.32,
        dateTime: DateTime.now(),
        category: Category.work),
    Expense(
        title: "cinema",
        amount: 200.32,
        dateTime: DateTime.now(),
        category: Category.leisure),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Tracker"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: TextButton(
                onPressed: () {
                  print("object");
                },
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                )),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: double.infinity,
          ),
          Text(_registeredExpense[0].title.toString()),
          ExpensesListWid(expense: _registeredExpense)
        ],
      ),
    );
  }
}
