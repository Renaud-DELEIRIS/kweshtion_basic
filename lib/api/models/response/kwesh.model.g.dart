// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kwesh.model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$KweshModelCWProxy {
  KweshModel id(String id);

  KweshModel question(String question);

  KweshModel answers(List<AnswerModel> answers);

  KweshModel createdAt(DateTime createdAt);

  KweshModel updatedAt(DateTime updatedAt);

  KweshModel author(UserModel author);

  KweshModel answer(String? answer);

  KweshModel skipped(bool? skipped);

  KweshModel expiresAt(DateTime? expiresAt);

  KweshModel category(CategoryModel? category);

  KweshModel tag(Tag tag);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `KweshModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// KweshModel(...).copyWith(id: 12, name: "My name")
  /// ````
  KweshModel call({
    String? id,
    String? question,
    List<AnswerModel>? answers,
    DateTime? createdAt,
    DateTime? updatedAt,
    UserModel? author,
    String? answer,
    bool? skipped,
    DateTime? expiresAt,
    CategoryModel? category,
    Tag? tag,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfKweshModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfKweshModel.copyWith.fieldName(...)`
class _$KweshModelCWProxyImpl implements _$KweshModelCWProxy {
  const _$KweshModelCWProxyImpl(this._value);

  final KweshModel _value;

  @override
  KweshModel id(String id) => this(id: id);

  @override
  KweshModel question(String question) => this(question: question);

  @override
  KweshModel answers(List<AnswerModel> answers) => this(answers: answers);

  @override
  KweshModel createdAt(DateTime createdAt) => this(createdAt: createdAt);

  @override
  KweshModel updatedAt(DateTime updatedAt) => this(updatedAt: updatedAt);

  @override
  KweshModel author(UserModel author) => this(author: author);

  @override
  KweshModel answer(String? answer) => this(answer: answer);

  @override
  KweshModel skipped(bool? skipped) => this(skipped: skipped);

  @override
  KweshModel expiresAt(DateTime? expiresAt) => this(expiresAt: expiresAt);

  @override
  KweshModel category(CategoryModel? category) => this(category: category);

  @override
  KweshModel tag(Tag tag) => this(tag: tag);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `KweshModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// KweshModel(...).copyWith(id: 12, name: "My name")
  /// ````
  KweshModel call({
    Object? id = const $CopyWithPlaceholder(),
    Object? question = const $CopyWithPlaceholder(),
    Object? answers = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? updatedAt = const $CopyWithPlaceholder(),
    Object? author = const $CopyWithPlaceholder(),
    Object? answer = const $CopyWithPlaceholder(),
    Object? skipped = const $CopyWithPlaceholder(),
    Object? expiresAt = const $CopyWithPlaceholder(),
    Object? category = const $CopyWithPlaceholder(),
    Object? tag = const $CopyWithPlaceholder(),
  }) {
    return KweshModel(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      question: question == const $CopyWithPlaceholder() || question == null
          ? _value.question
          // ignore: cast_nullable_to_non_nullable
          : question as String,
      answers: answers == const $CopyWithPlaceholder() || answers == null
          ? _value.answers
          // ignore: cast_nullable_to_non_nullable
          : answers as List<AnswerModel>,
      createdAt: createdAt == const $CopyWithPlaceholder() || createdAt == null
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime,
      updatedAt: updatedAt == const $CopyWithPlaceholder() || updatedAt == null
          ? _value.updatedAt
          // ignore: cast_nullable_to_non_nullable
          : updatedAt as DateTime,
      author: author == const $CopyWithPlaceholder() || author == null
          ? _value.author
          // ignore: cast_nullable_to_non_nullable
          : author as UserModel,
      answer: answer == const $CopyWithPlaceholder()
          ? _value.answer
          // ignore: cast_nullable_to_non_nullable
          : answer as String?,
      skipped: skipped == const $CopyWithPlaceholder()
          ? _value.skipped
          // ignore: cast_nullable_to_non_nullable
          : skipped as bool?,
      expiresAt: expiresAt == const $CopyWithPlaceholder()
          ? _value.expiresAt
          // ignore: cast_nullable_to_non_nullable
          : expiresAt as DateTime?,
      category: category == const $CopyWithPlaceholder()
          ? _value.category
          // ignore: cast_nullable_to_non_nullable
          : category as CategoryModel?,
      tag: tag == const $CopyWithPlaceholder() || tag == null
          ? _value.tag
          // ignore: cast_nullable_to_non_nullable
          : tag as Tag,
    );
  }
}

extension $KweshModelCopyWith on KweshModel {
  /// Returns a callable class that can be used as follows: `instanceOfKweshModel.copyWith(...)` or like so:`instanceOfKweshModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$KweshModelCWProxy get copyWith => _$KweshModelCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KweshModel _$KweshModelFromJson(Map<String, dynamic> json) => KweshModel(
      id: json['id'] as String,
      question: json['question'] as String,
      answers: (json['answers'] as List<dynamic>)
          .map((e) => AnswerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      author: UserModel.fromJson(json['author'] as Map<String, dynamic>),
      answer: json['answer'] as String?,
      skipped: json['skipped'] as bool?,
      expiresAt: json['expiresAt'] == null
          ? null
          : DateTime.parse(json['expiresAt'] as String),
      category: json['category'] == null
          ? null
          : CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
      tag: $enumDecodeNullable(_$TagEnumMap, json['tag']) ?? Tag.other,
    );

Map<String, dynamic> _$KweshModelToJson(KweshModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'answers': instance.answers,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'author': instance.author,
      'category': instance.category,
      'tag': _$TagEnumMap[instance.tag]!,
      'answer': instance.answer,
      'expiresAt': instance.expiresAt?.toIso8601String(),
      'skipped': instance.skipped,
    };

const _$TagEnumMap = {
  Tag.decideForMe: 'decideForMe',
  Tag.hypothetical: 'hypothetical',
  Tag.politicsAndLaws: 'politicsAndLaws',
  Tag.sports: 'sports',
  Tag.demographics: 'demographics',
  Tag.currentEvents: 'currentEvents',
  Tag.wouldYouRather: 'wouldYouRather',
  Tag.gaming: 'gaming',
  Tag.other: 'other',
};
