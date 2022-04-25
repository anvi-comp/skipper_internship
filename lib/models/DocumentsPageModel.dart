import 'package:flutter/foundation.dart';

class DocumentsPageModel {
  final String departmentName;
  final int id;
  final String description;
  final String status;

  DocumentsPageModel({
    @required this.departmentName = "",
    @required this.id = 0,
    @required this.description = "",
    @required this.status = "",
  });

  factory DocumentsPageModel.fromJson(Map<String, dynamic> json) {
    return DocumentsPageModel(
      departmentName: json['departmentName'] as String,
      id: json['id'] as int,
      description: json['des'] as String,
      status: json['status'] as String,
    );
  }
}