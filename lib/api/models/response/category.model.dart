import 'package:json_annotation/json_annotation.dart';
import 'package:kweshtion_basic/api/models/response/user.model.dart';

part 'category.model.g.dart';

@JsonSerializable()
class CategoryModel {
  CategoryModel({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.author,
    this.avatar,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  final String id;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;
  final UserModel author;
  final String? avatar;

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}
