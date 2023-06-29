import 'package:expense_tracker/utility/expenseclass.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewExp extends StatefulWidget {
  const NewExp({super.key});

  @override
  State<NewExp> createState() => _NewExpState();
}

class _NewExpState extends State<NewExp> {
  final _titleController = TextEditingController();
  final _expenseController = TextEditingController();
  DateTime? _pickedDate = DateTime.now();
  Category _dropDownSelected = Category.food;

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstdate = DateTime(now.year - 1, now.month, now.day);
    final date = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstdate,
        lastDate: now);
    setState(() {
      _pickedDate = date;
    });
  }

  void _submitExpenseData() {
    final enteredAmount = double.tryParse(_expenseController.text);
    final amountValid = enteredAmount == null || enteredAmount <= 0;
    if (_titleController.text.trim().isEmpty || amountValid) {
      showDialog(
          context: context,
          builder: ((context) => AlertDialog(
                title: const Center(child: Text("Invalid Input")),
                content: const Text(
                    "Please make sure valid Title, amount, has been selected..."),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Close"))
                ],
              )));
      return;
    }

    final newExpense = Expense(
        title: _titleController.text,
        amount: double.parse(_expenseController.text),
        dateTime: _pickedDate!,
        category: _dropDownSelected);
    Navigator.pop(context, newExpense);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _expenseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              autofocus: true,
              maxLength: 50,
              decoration: const InputDecoration(label: Text("Title")),
              controller: _titleController,
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                        label: Text("Amount"), prefixText: "\$ "),
                    keyboardType: TextInputType.number,
                    controller: _expenseController,
                  ),
                ),
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(formatter.format(_pickedDate!).toString()),
                    IconButton(
                      onPressed: _presentDatePicker,
                      icon: const Icon(Icons.calendar_month),
                    )
                  ],
                ))
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                DropdownButton(
                  value: _dropDownSelected,
                  items: Category.values
                      .map(
                        (category) => DropdownMenuItem(
                          value: category,
                          child: Text(
                            category.name.toUpperCase(),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (val) {
                    setState(() {
                      _dropDownSelected = val!;
                    });
                  },
                ),
                const Spacer(),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context, null);
                    },
                    child: const Text("Cancel")),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      _submitExpenseData();
                    },
                    child: const Text("Save expense")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
