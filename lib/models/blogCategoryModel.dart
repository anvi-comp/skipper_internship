import 'package:flutter/foundation.dart';

class blogCategoryModel {
  final String blogCat;
  final int id;
  final String description;
  final String status;

  blogCategoryModel({
    @required this.blogCat = "",
    @required this.id = 0,
    @required this.description = "",
    @required this.status = "",
  });

  factory blogCategoryModel.fromJson(Map<String, dynamic> json) {
    return blogCategoryModel(
      blogCat: json['blogCat'] as String,
      id: json['id'] as int,
      description: json['des'] as String,
      status: json['status'] as String,
    );
  }
}