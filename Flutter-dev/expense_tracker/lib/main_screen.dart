import 'package:expense_tracker/utility/new_exp_modal_sheet.dart';
// import 'package:expense_tracker/utility/stat.dart';
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
    final expIdx = _registeredExpense.indexOf(exp);
    setState(() {
      _registeredExpense.remove(exp);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text("Expense Deleted"),
      action: SnackBarAction(
        label: "Undo",
        onPressed: () {
          setState(() {
            _registeredExpense.insert(expIdx, exp);
          });
        },
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text("No Expenses found, Start adding some!"),
    );
    if (_registeredExpense.isNotEmpty) {
      mainContent = ExpensesListWid(
        expense: _registeredExpense,
        helperRemoveExp: helperRemoveExp,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Tracker"),
        actions: [
          IconButton(
              onPressed: _displayModalOverlayExpense,
              icon: const Icon(
                Icons.add,
              ))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: double.infinity,
          ),
          // UserStats(userExpenses: _registeredExpense),
          Expanded(child: mainContent),
        ],
      ),
    );
  }
}
