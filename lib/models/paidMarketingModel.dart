import 'package:flutter/foundation.dart';

class paidMarketingModel {
  final String paidmarket;
  final int id;
  final String description;
  final String status;

  paidMarketingModel({
    @required this.paidmarket = "",
    @required this.id = 0,
    @required this.description = "",
    @required this.status = "",
  });

  factory paidMarketingModel.fromJson(Map<String, dynamic> json) {
    return paidMarketingModel(
      paidmarket: json['paidmarket'] as String,
      id: json['id'] as int,
      description: json['des'] as String,
      status: json['status'] as String,
    );
  }
}