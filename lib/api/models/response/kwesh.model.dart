import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:kweshtion_basic/api/models/response/answer.model.dart';
import 'package:kweshtion_basic/api/models/response/category.model.dart';
import 'package:kweshtion_basic/api/models/response/user.model.dart';
import 'package:kweshtion_basic/enum/tag.enum.dart';

part 'kwesh.model.g.dart';

@JsonSerializable()
@CopyWith()
class KweshModel {
  KweshModel({
    required this.id,
    required this.question,
    required this.answers,
    required this.createdAt,
    required this.updatedAt,
    required this.author,
    required this.answer,
    this.skipped,
    this.expiresAt,
    this.category,
    this.tag = Tag.other,
  });

  factory KweshModel.fromJson(Map<String, dynamic> json) =>
      _$KweshModelFromJson(json);

  final String id;
  final String question;
  final List<AnswerModel> answers;
  final DateTime createdAt;
  final DateTime updatedAt;
  final UserModel author;
  final CategoryModel? category;
  final Tag tag;
  final String? answer;
  final DateTime? expiresAt;
  final bool? skipped;

  Map<String, dynamic> toJson() => _$KweshModelToJson(this);
}
