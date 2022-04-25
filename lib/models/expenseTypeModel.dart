import 'package:flutter/foundation.dart';

class expenseTypeModel {
  final String expense;
  final int id;
  final String description;
  final String status;

  expenseTypeModel({
    @required this.expense = "",
    @required this.id = 0,
    @required this.description = "",
    @required this.status = "",
  });

  factory expenseTypeModel.fromJson(Map<String, dynamic> json) {
    return expenseTypeModel(
      expense: json['expense'] as String,
      id: json['id'] as int,
      description: json['des'] as String,
      status: json['status'] as String,
    );
  }
}