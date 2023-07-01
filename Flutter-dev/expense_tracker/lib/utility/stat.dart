import 'package:expense_tracker/utility/expenseclass.dart';
import 'package:flutter/material.dart';

class UserStats extends StatelessWidget {
  UserStats({super.key, required this.userExpenses});
  final List<Expense> userExpenses;
  double totalSpending = 0;
  Map<Category, double> cat_sum = {
    Category.food: 0,
    Category.leisure: 0,
    Category.travel: 0,
    Category.work: 0
  };

  void category_sum() {
    for (var exp in userExpenses) {
      totalSpending += exp.amount;
      cat_sum.update(exp.category, (value) => value + exp.amount);
    }
    print(cat_sum);
  }

  @override
  Widget build(BuildContext context) {
    category_sum();
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            width: double.infinity,
          ),
          Text("Total Spending = ${totalSpending.toString()}"),
        ],
      ),
    );
  }
}
