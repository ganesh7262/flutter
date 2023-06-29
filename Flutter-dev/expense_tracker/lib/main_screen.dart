import 'package:expense_tracker/utility/new_exp_modal_sheet.dart';
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

  void _displayModalOverlayExpense() async {
    final newExp = await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) => const NewExp());
    setState(() {
      if (newExp == null) return;
      _registeredExpense.add(newExp);
    });
  }

  void helperRemoveExp(Expense exp) {
    setState(() {
      _registeredExpense.remove(exp);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Tracker"),
        actions: [
          IconButton(
              onPressed: _displayModalOverlayExpense,
              icon: const Icon(
                Icons.add,
                color: Colors.black,
              ))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: double.infinity,
          ),
          Text("Chart"),
          ExpensesListWid(
            expense: _registeredExpense,
            helperRemoveExp: helperRemoveExp,
          )
        ],
      ),
    );
  }
}
