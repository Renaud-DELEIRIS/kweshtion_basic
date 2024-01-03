// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kwesh_history.model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$KweshHistoryModelCWProxy {
  KweshHistoryModel id(String id);

  KweshHistoryModel answerId(String answerId);

  KweshHistoryModel kwesh(KweshModel kwesh);

  KweshHistoryModel createdAt(DateTime createdAt);

  KweshHistoryModel nbVoteOnAnswer(int nbVoteOnAnswer);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `KweshHistoryModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// KweshHistoryModel(...).copyWith(id: 12, name: "My name")
  /// ````
  KweshHistoryModel call({
    String? id,
    String? answerId,
    KweshModel? kwesh,
    DateTime? createdAt,
    int? nbVoteOnAnswer,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfKweshHistoryModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfKweshHistoryModel.copyWith.fieldName(...)`
class _$KweshHistoryModelCWProxyImpl implements _$KweshHistoryModelCWProxy {
  const _$KweshHistoryModelCWProxyImpl(this._value);

  final KweshHistoryModel _value;

  @override
  KweshHistoryModel id(String id) => this(id: id);

  @override
  KweshHistoryModel answerId(String answerId) => this(answerId: answerId);

  @override
  KweshHistoryModel kwesh(KweshModel kwesh) => this(kwesh: kwesh);

  @override
  KweshHistoryModel createdAt(DateTime createdAt) => this(createdAt: createdAt);

  @override
  KweshHistoryModel nbVoteOnAnswer(int nbVoteOnAnswer) =>
      this(nbVoteOnAnswer: nbVoteOnAnswer);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `KweshHistoryModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// KweshHistoryModel(...).copyWith(id: 12, name: "My name")
  /// ````
  KweshHistoryModel call({
    Object? id = const $CopyWithPlaceholder(),
    Object? answerId = const $CopyWithPlaceholder(),
    Object? kwesh = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? nbVoteOnAnswer = const $CopyWithPlaceholder(),
  }) {
    return KweshHistoryModel(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      answerId: answerId == const $CopyWithPlaceholder() || answerId == null
          ? _value.answerId
          // ignore: cast_nullable_to_non_nullable
          : answerId as String,
      kwesh: kwesh == const $CopyWithPlaceholder() || kwesh == null
          ? _value.kwesh
          // ignore: cast_nullable_to_non_nullable
          : kwesh as KweshModel,
      createdAt: createdAt == const $CopyWithPlaceholder() || createdAt == null
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime,
      nbVoteOnAnswer: nbVoteOnAnswer == const $CopyWithPlaceholder() ||
              nbVoteOnAnswer == null
          ? _value.nbVoteOnAnswer
          // ignore: cast_nullable_to_non_nullable
          : nbVoteOnAnswer as int,
    );
  }
}

extension $KweshHistoryModelCopyWith on KweshHistoryModel {
  /// Returns a callable class that can be used as follows: `instanceOfKweshHistoryModel.copyWith(...)` or like so:`instanceOfKweshHistoryModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$KweshHistoryModelCWProxy get copyWith =>
      _$KweshHistoryModelCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KweshHistoryModel _$KweshHistoryModelFromJson(Map<String, dynamic> json) =>
    KweshHistoryModel(
      id: json['id'] as String,
      answerId: json['answerId'] as String,
      kwesh: KweshModel.fromJson(json['kwesh'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
      nbVoteOnAnswer: json['nbVoteOnAnswer'] as int,
    );

Map<String, dynamic> _$KweshHistoryModelToJson(KweshHistoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'answerId': instance.answerId,
      'createdAt': instance.createdAt.toIso8601String(),
      'kwesh': instance.kwesh,
      'nbVoteOnAnswer': instance.nbVoteOnAnswer,
    };
