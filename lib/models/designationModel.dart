import 'package:flutter/foundation.dart';

class designationModel {
  final String departmentName;
  final String desgName;
  final int id;
  final String description;
  final String status;

  designationModel({
    @required this.departmentName = "",
    @required this.desgName = "",
    @required this.id = 0,
    @required this.description = "",
    @required this.status = "",
  });

  factory designationModel.fromJson(Map<String, dynamic> json) {
    return designationModel(
      departmentName: json['departmentName'] as String,
      desgName: json['desgName'] as String,
      id: json['id'] as int,
      description: json['des'] as String,
      status: json['status'] as String,
    );
  }
}