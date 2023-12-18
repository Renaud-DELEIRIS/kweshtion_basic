import 'package:json_annotation/json_annotation.dart';

part 'user.model.g.dart';

@JsonSerializable()
class UserModel {
  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
    this.avatar,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  final String id;
  final String username;
  final String email;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? avatar;

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
