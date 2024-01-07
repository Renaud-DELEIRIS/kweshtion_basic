// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search.model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SearchModelCWProxy {
  SearchModel type(SearchType type);

  SearchModel targetId(String targetId);

  SearchModel displayAvatar(String? displayAvatar);

  SearchModel displayName(String displayName);

  SearchModel like(int? like);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SearchModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SearchModel(...).copyWith(id: 12, name: "My name")
  /// ````
  SearchModel call({
    SearchType? type,
    String? targetId,
    String? displayAvatar,
    String? displayName,
    int? like,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSearchModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSearchModel.copyWith.fieldName(...)`
class _$SearchModelCWProxyImpl implements _$SearchModelCWProxy {
  const _$SearchModelCWProxyImpl(this._value);

  final SearchModel _value;

  @override
  SearchModel type(SearchType type) => this(type: type);

  @override
  SearchModel targetId(String targetId) => this(targetId: targetId);

  @override
  SearchModel displayAvatar(String? displayAvatar) =>
      this(displayAvatar: displayAvatar);

  @override
  SearchModel displayName(String displayName) => this(displayName: displayName);

  @override
  SearchModel like(int? like) => this(like: like);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SearchModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SearchModel(...).copyWith(id: 12, name: "My name")
  /// ````
  SearchModel call({
    Object? type = const $CopyWithPlaceholder(),
    Object? targetId = const $CopyWithPlaceholder(),
    Object? displayAvatar = const $CopyWithPlaceholder(),
    Object? displayName = const $CopyWithPlaceholder(),
    Object? like = const $CopyWithPlaceholder(),
  }) {
    return SearchModel(
      type: type == const $CopyWithPlaceholder() || type == null
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as SearchType,
      targetId: targetId == const $CopyWithPlaceholder() || targetId == null
          ? _value.targetId
          // ignore: cast_nullable_to_non_nullable
          : targetId as String,
      displayAvatar: displayAvatar == const $CopyWithPlaceholder()
          ? _value.displayAvatar
          // ignore: cast_nullable_to_non_nullable
          : displayAvatar as String?,
      displayName:
          displayName == const $CopyWithPlaceholder() || displayName == null
              ? _value.displayName
              // ignore: cast_nullable_to_non_nullable
              : displayName as String,
      like: like == const $CopyWithPlaceholder()
          ? _value.like
          // ignore: cast_nullable_to_non_nullable
          : like as int?,
    );
  }
}

extension $SearchModelCopyWith on SearchModel {
  /// Returns a callable class that can be used as follows: `instanceOfSearchModel.copyWith(...)` or like so:`instanceOfSearchModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SearchModelCWProxy get copyWith => _$SearchModelCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchModel _$SearchModelFromJson(Map<String, dynamic> json) => SearchModel(
      type: $enumDecode(_$SearchTypeEnumMap, json['type']),
      targetId: json['targetId'] as String,
      displayAvatar: json['displayAvatar'] as String?,
      displayName: json['displayName'] as String,
      like: json['like'] as int?,
    );

Map<String, dynamic> _$SearchModelToJson(SearchModel instance) =>
    <String, dynamic>{
      'type': _$SearchTypeEnumMap[instance.type]!,
      'displayName': instance.displayName,
      'targetId': instance.targetId,
      'displayAvatar': instance.displayAvatar,
      'like': instance.like,
    };

const _$SearchTypeEnumMap = {
  SearchType.user: 'user',
  SearchType.category: 'category',
};
