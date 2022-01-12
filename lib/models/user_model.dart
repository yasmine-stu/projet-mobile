import 'package:flutter/cupertino.dart';

class UserModel {
  // what the server returns to u
  final String? name;
  final String? address;
  final String? mobile;
  final String? email;
  final String? userId;

  UserModel({
    this.name,
    this.address,
    this.email,
    this.mobile,
    required this.userId,
  });
}
