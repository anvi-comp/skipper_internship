import 'package:flutter/foundation.dart';

class partyTypeModel {
  final String partytype;
  final int id;
  final String description;
  final String status;

  partyTypeModel({
    @required this.partytype = "",
    @required this.id = 0,
    @required this.description = "",
    @required this.status = "",
  });

  factory partyTypeModel.fromJson(Map<String, dynamic> json) {
    return partyTypeModel(
      partytype: json['partytype'] as String,
      id: json['id'] as int,
      description: json['des'] as String,
      status: json['status'] as String,
    );
  }
}