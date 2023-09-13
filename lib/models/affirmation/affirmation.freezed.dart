// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'affirmation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Affirmation _$AffirmationFromJson(Map<String, dynamic> json) {
  return _Affirmation.fromJson(json);
}

/// @nodoc
mixin _$Affirmation {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'advice')
  String get text => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AffirmationCopyWith<Affirmation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AffirmationCopyWith<$Res> {
  factory $AffirmationCopyWith(
          Affirmation value, $Res Function(Affirmation) then) =
      _$AffirmationCopyWithImpl<$Res, Affirmation>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id, @JsonKey(name: 'advice') String text});
}

/// @nodoc
class _$AffirmationCopyWithImpl<$Res, $Val extends Affirmation>
    implements $AffirmationCopyWith<$Res> {
  _$AffirmationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AffirmationCopyWith<$Res>
    implements $AffirmationCopyWith<$Res> {
  factory _$$_AffirmationCopyWith(
          _$_Affirmation value, $Res Function(_$_Affirmation) then) =
      __$$_AffirmationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id, @JsonKey(name: 'advice') String text});
}

/// @nodoc
class __$$_AffirmationCopyWithImpl<$Res>
    extends _$AffirmationCopyWithImpl<$Res, _$_Affirmation>
    implements _$$_AffirmationCopyWith<$Res> {
  __$$_AffirmationCopyWithImpl(
      _$_Affirmation _value, $Res Function(_$_Affirmation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
  }) {
    return _then(_$_Affirmation(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Affirmation implements _Affirmation {
  _$_Affirmation(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'advice') required this.text});

  factory _$_Affirmation.fromJson(Map<String, dynamic> json) =>
      _$$_AffirmationFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'advice')
  final String text;

  @override
  String toString() {
    return 'Affirmation(id: $id, text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Affirmation &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AffirmationCopyWith<_$_Affirmation> get copyWith =>
      __$$_AffirmationCopyWithImpl<_$_Affirmation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AffirmationToJson(
      this,
    );
  }
}

abstract class _Affirmation implements Affirmation {
  factory _Affirmation(
      {@JsonKey(name: 'id') required final int id,
      @JsonKey(name: 'advice') required final String text}) = _$_Affirmation;

  factory _Affirmation.fromJson(Map<String, dynamic> json) =
      _$_Affirmation.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'advice')
  String get text;
  @override
  @JsonKey(ignore: true)
  _$$_AffirmationCopyWith<_$_Affirmation> get copyWith =>
      throw _privateConstructorUsedError;
}
