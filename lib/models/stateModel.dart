import 'package:flutter/foundation.dart';

class stateModel {
  final String state;
  final int id;
  final String country;
  final String status;

  stateModel({
    @required this.state = "",
    @required this.id = 0,
    @required this.country = "",
    @required this.status = "",
  });

  factory stateModel.fromJson(Map<String, dynamic> json) {
    return stateModel(
      state: json['state'] as String,
      id: json['id'] as int,
      country: json['country'] as String,
      status: json['status'] as String,
    );
  }
}