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

  void _presentDatePicker() {
    final now = DateTime.now();
    final firstdate = DateTime(now.year - 1, now.month, now.day);
    showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstdate,
        lastDate: now);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _expenseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
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
                  const Text("selected date"),
                  IconButton(
                    onPressed: _presentDatePicker,
                    icon: const Icon(Icons.calendar_month),
                  )
                ],
              ))
            ],
          ),
          Row(
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel")),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    print(_titleController.text);
                    print(_expenseController.text);
                  },
                  child: const Text("Save expense")),
            ],
          ),
        ],
      ),
    );
  }
}
