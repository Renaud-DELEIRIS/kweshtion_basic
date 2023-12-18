import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'answer.model.g.dart';

@JsonSerializable()
@CopyWith()
class AnswerModel {
  AnswerModel({
    required this.id,
    required this.answer,
    required this.nbVotes,
  });

  factory AnswerModel.fromJson(Map<String, dynamic> json) =>
      _$AnswerModelFromJson(json);

  final String id;
  final String answer;
  final int nbVotes;

  Map<String, dynamic> toJson() => _$AnswerModelToJson(this);
}
