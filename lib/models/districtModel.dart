import 'package:flutter/foundation.dart';

class districtModel {
  final String district;
  final int id;
  final String country;
  final String state;
  final String status;

  districtModel({
    @required this.district = "",
    @required this.id = 0,
    @required this.country = "",
    @required this.state = "",
    @required this.status = "",
  });

  factory districtModel.fromJson(Map<String, dynamic> json) {
    return districtModel(
      district: json['district'] as String,
      id: json['id'] as int,
      country: json['country'] as String,
      state: json['state'] as String,
      status: json['status'] as String,
    );
  }
}