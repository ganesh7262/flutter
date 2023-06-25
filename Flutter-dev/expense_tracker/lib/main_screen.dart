import 'package:flutter/material.dart';

class ExpScreen extends StatefulWidget {
  const ExpScreen({super.key});

  @override
  State<ExpScreen> createState() => _ExpScreenState();
}

class _ExpScreenState extends State<ExpScreen> {
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
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
          ),
          Text("Chart"),
          Text("expenses")
        ],
      ),
    );
  }
}
