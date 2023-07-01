import 'package:expense_tracker/utility/expenseclass.dart';
import 'package:flutter/material.dart';

class ExpensesListWid extends StatelessWidget {
  const ExpensesListWid(
      {super.key, required this.expense, required this.helperRemoveExp});
  final List<Expense> expense;
  final Function(Expense expense) helperRemoveExp;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: expense.length,
        itemBuilder: (ctx, idx) => Dismissible(
            onDismissed: (dis) => helperRemoveExp(expense[idx]),
            key: ValueKey(expense[idx]),
            child: ExpenseItem(expense[idx])));
  }
}

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.exp, {super.key});

  final Expense exp;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Center(
            child: Text(
              exp.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            children: [
              Text('\$${exp.amount.toStringAsFixed(2)}'),
              const Spacer(),
              Row(
                children: [
                  Icon(categoryIcons[exp.category]),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(exp.formattedDate)
                ],
              )
            ],
          )
        ]),
      ),
    );
  }
}
