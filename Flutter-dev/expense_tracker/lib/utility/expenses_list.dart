import 'package:expense_tracker/utility/expenseclass.dart';
import 'package:flutter/material.dart';

class ExpensesListWid extends StatelessWidget {
  const ExpensesListWid({super.key, required this.expense});
  final List<Expense> expense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: expense.length,
        itemBuilder: (ctx, idx) => Text(expense[idx].title));
  }
}
