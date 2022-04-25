import 'package:flutter/foundation.dart';

class DepartmentModel {
  final String departmentName;
  final int id;
  final String description;
  final String status;

  DepartmentModel({
    @required this.departmentName = "",
    @required this.id = 0,
    @required this.description = "",
    @required this.status = "",
  });

  factory DepartmentModel.fromJson(Map<String, dynamic> json) {
    return DepartmentModel(
      departmentName: json['departmentName'] as String,
      id: json['id'] as int,
      description: json['des'] as String,
      status: json['status'] as String,
    );
  }
}