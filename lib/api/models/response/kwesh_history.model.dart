import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:kweshtion_basic/api/models/response/kwesh.model.dart';

part 'kwesh_history.model.g.dart';

@JsonSerializable()
@CopyWith()
class KweshHistoryModel {
  KweshHistoryModel({
    required this.id,
    required this.answerId,
    required this.kwesh,
    required this.createdAt,
    required this.nbVoteOnAnswer,
  });

  factory KweshHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$KweshHistoryModelFromJson(json);

  final String id;
  final String answerId;
  final DateTime createdAt;
  final KweshModel kwesh;
  final int nbVoteOnAnswer;

  Map<String, dynamic> toJson() => _$KweshHistoryModelToJson(this);
}
