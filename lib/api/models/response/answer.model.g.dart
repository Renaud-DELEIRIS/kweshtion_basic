// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer.model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AnswerModelCWProxy {
  AnswerModel id(String id);

  AnswerModel answer(String answer);

  AnswerModel nbVotes(int nbVotes);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AnswerModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AnswerModel(...).copyWith(id: 12, name: "My name")
  /// ````
  AnswerModel call({
    String? id,
    String? answer,
    int? nbVotes,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAnswerModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAnswerModel.copyWith.fieldName(...)`
class _$AnswerModelCWProxyImpl implements _$AnswerModelCWProxy {
  const _$AnswerModelCWProxyImpl(this._value);

  final AnswerModel _value;

  @override
  AnswerModel id(String id) => this(id: id);

  @override
  AnswerModel answer(String answer) => this(answer: answer);

  @override
  AnswerModel nbVotes(int nbVotes) => this(nbVotes: nbVotes);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AnswerModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AnswerModel(...).copyWith(id: 12, name: "My name")
  /// ````
  AnswerModel call({
    Object? id = const $CopyWithPlaceholder(),
    Object? answer = const $CopyWithPlaceholder(),
    Object? nbVotes = const $CopyWithPlaceholder(),
  }) {
    return AnswerModel(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      answer: answer == const $CopyWithPlaceholder() || answer == null
          ? _value.answer
          // ignore: cast_nullable_to_non_nullable
          : answer as String,
      nbVotes: nbVotes == const $CopyWithPlaceholder() || nbVotes == null
          ? _value.nbVotes
          // ignore: cast_nullable_to_non_nullable
          : nbVotes as int,
    );
  }
}

extension $AnswerModelCopyWith on AnswerModel {
  /// Returns a callable class that can be used as follows: `instanceOfAnswerModel.copyWith(...)` or like so:`instanceOfAnswerModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AnswerModelCWProxy get copyWith => _$AnswerModelCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnswerModel _$AnswerModelFromJson(Map<String, dynamic> json) => AnswerModel(
      id: json['id'] as String,
      answer: json['answer'] as String,
      nbVotes: json['nbVotes'] as int,
    );

Map<String, dynamic> _$AnswerModelToJson(AnswerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'answer': instance.answer,
      'nbVotes': instance.nbVotes,
    };
