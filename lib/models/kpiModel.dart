import 'package:flutter/foundation.dart';

class kpiModel {
  final String kpi;
  final int id;
  final String description;
  final String status;

  kpiModel({
    @required this.kpi = "",
    @required this.id = 0,
    @required this.description = "",
    @required this.status = "",
  });

  factory kpiModel.fromJson(Map<String, dynamic> json) {
    return kpiModel(
      kpi: json['kpi'] as String,
      id: json['id'] as int,
      description: json['des'] as String,
      status: json['status'] as String,
    );
  }
}