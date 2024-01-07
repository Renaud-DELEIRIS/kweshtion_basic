import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search.model.g.dart';

enum SearchType { user, category }

@JsonSerializable()
@CopyWith()
class SearchModel {
  SearchModel({
    required this.type,
    required this.targetId,
    this.displayAvatar,
    required this.displayName,
    this.like,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) =>
      _$SearchModelFromJson(json);

  final SearchType type;
  final String displayName;
  final String targetId;
  final String? displayAvatar;
  final int? like;

  Map<String, dynamic> toJson() => _$SearchModelToJson(this);
}
