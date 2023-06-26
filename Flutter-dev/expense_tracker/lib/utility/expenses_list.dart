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
        itemBuilder: (ctx, idx) => ExpenseItem(expense[idx]));
  }
}

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.exp, {super.key});

  final Expense exp;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(children: [
          Text(exp.title),
          Row(
            children: [
              Text('\$${exp.amount.toStringAsFixed(2)}'),
              const Spacer(),
              Row(
                children: [Icon(Icons.alarm), Text(exp.dateTime.toString())],
              )
            ],
          )
        ]),
      ),
    );
  }
}
