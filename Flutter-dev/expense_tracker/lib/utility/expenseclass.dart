import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();

final formatter = DateFormat.yMd();

enum Category { food, leisure, travel, work }

const categoryIcons = {
  Category.food: Icons.restaurant,
  Category.leisure: Icons.movie,
  Category.travel: Icons.flight,
  Category.work: Icons.work
};

class Expense {
  Expense(
      {required this.title,
      required this.amount,
      required this.dateTime,
      required this.category})
      : id = uuid.v4();
  final String id;
  final String title;
  final double amount;
  final DateTime dateTime;
  final Category category;

  String get formattedDate {
    return formatter.format(dateTime);
  }
}
