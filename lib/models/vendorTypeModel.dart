import 'package:flutter/foundation.dart';

class vendorTypeModel {
  final String vendortype;
  final int id;
  final String description;
  final String status;

  vendorTypeModel({
    @required this.vendortype = "",
    @required this.id = 0,
    @required this.description = "",
    @required this.status = "",
  });

  factory vendorTypeModel.fromJson(Map<String, dynamic> json) {
    return vendorTypeModel(
      vendortype: json['vendortype'] as String,
      id: json['id'] as int,
      description: json['des'] as String,
      status: json['status'] as String,
    );
  }
}