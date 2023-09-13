// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'affirmation_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AffirmationResponse _$AffirmationResponseFromJson(Map<String, dynamic> json) {
  return _AffirmationResponse.fromJson(json);
}

/// @nodoc
mixin _$AffirmationResponse {
  @JsonKey(name: 'slip')
  Affirmation get affirmation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AffirmationResponseCopyWith<AffirmationResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AffirmationResponseCopyWith<$Res> {
  factory $AffirmationResponseCopyWith(
          AffirmationResponse value, $Res Function(AffirmationResponse) then) =
      _$AffirmationResponseCopyWithImpl<$Res, AffirmationResponse>;
  @useResult
  $Res call({@JsonKey(name: 'slip') Affirmation affirmation});

  $AffirmationCopyWith<$Res> get affirmation;
}

/// @nodoc
class _$AffirmationResponseCopyWithImpl<$Res, $Val extends AffirmationResponse>
    implements $AffirmationResponseCopyWith<$Res> {
  _$AffirmationResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? affirmation = null,
  }) {
    return _then(_value.copyWith(
      affirmation: null == affirmation
          ? _value.affirmation
          : affirmation // ignore: cast_nullable_to_non_nullable
              as Affirmation,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AffirmationCopyWith<$Res> get affirmation {
    return $AffirmationCopyWith<$Res>(_value.affirmation, (value) {
      return _then(_value.copyWith(affirmation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AffirmationResponseCopyWith<$Res>
    implements $AffirmationResponseCopyWith<$Res> {
  factory _$$_AffirmationResponseCopyWith(_$_AffirmationResponse value,
          $Res Function(_$_AffirmationResponse) then) =
      __$$_AffirmationResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'slip') Affirmation affirmation});

  @override
  $AffirmationCopyWith<$Res> get affirmation;
}

/// @nodoc
class __$$_AffirmationResponseCopyWithImpl<$Res>
    extends _$AffirmationResponseCopyWithImpl<$Res, _$_AffirmationResponse>
    implements _$$_AffirmationResponseCopyWith<$Res> {
  __$$_AffirmationResponseCopyWithImpl(_$_AffirmationResponse _value,
      $Res Function(_$_AffirmationResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? affirmation = null,
  }) {
    return _then(_$_AffirmationResponse(
      affirmation: null == affirmation
          ? _value.affirmation
          : affirmation // ignore: cast_nullable_to_non_nullable
              as Affirmation,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AffirmationResponse implements _AffirmationResponse {
  _$_AffirmationResponse({@JsonKey(name: 'slip') required this.affirmation});

  factory _$_AffirmationResponse.fromJson(Map<String, dynamic> json) =>
      _$$_AffirmationResponseFromJson(json);

  @override
  @JsonKey(name: 'slip')
  final Affirmation affirmation;

  @override
  String toString() {
    return 'AffirmationResponse(affirmation: $affirmation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AffirmationResponse &&
            (identical(other.affirmation, affirmation) ||
                other.affirmation == affirmation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, affirmation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AffirmationResponseCopyWith<_$_AffirmationResponse> get copyWith =>
      __$$_AffirmationResponseCopyWithImpl<_$_AffirmationResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AffirmationResponseToJson(
      this,
    );
  }
}

abstract class _AffirmationResponse implements AffirmationResponse {
  factory _AffirmationResponse(
          {@JsonKey(name: 'slip') required final Affirmation affirmation}) =
      _$_AffirmationResponse;

  factory _AffirmationResponse.fromJson(Map<String, dynamic> json) =
      _$_AffirmationResponse.fromJson;

  @override
  @JsonKey(name: 'slip')
  Affirmation get affirmation;
  @override
  @JsonKey(ignore: true)
  _$$_AffirmationResponseCopyWith<_$_AffirmationResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
