// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SettingsDetails {
  ThemeType get themeType => throw _privateConstructorUsedError;
  TextType get textType => throw _privateConstructorUsedError;
  SoundType get soundType => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SettingsDetailsCopyWith<SettingsDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsDetailsCopyWith<$Res> {
  factory $SettingsDetailsCopyWith(
          SettingsDetails value, $Res Function(SettingsDetails) then) =
      _$SettingsDetailsCopyWithImpl<$Res, SettingsDetails>;
  @useResult
  $Res call({ThemeType themeType, TextType textType, SoundType soundType});
}

/// @nodoc
class _$SettingsDetailsCopyWithImpl<$Res, $Val extends SettingsDetails>
    implements $SettingsDetailsCopyWith<$Res> {
  _$SettingsDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeType = null,
    Object? textType = null,
    Object? soundType = null,
  }) {
    return _then(_value.copyWith(
      themeType: null == themeType
          ? _value.themeType
          : themeType // ignore: cast_nullable_to_non_nullable
              as ThemeType,
      textType: null == textType
          ? _value.textType
          : textType // ignore: cast_nullable_to_non_nullable
              as TextType,
      soundType: null == soundType
          ? _value.soundType
          : soundType // ignore: cast_nullable_to_non_nullable
              as SoundType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SettingsDetailsCopyWith<$Res>
    implements $SettingsDetailsCopyWith<$Res> {
  factory _$$_SettingsDetailsCopyWith(
          _$_SettingsDetails value, $Res Function(_$_SettingsDetails) then) =
      __$$_SettingsDetailsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ThemeType themeType, TextType textType, SoundType soundType});
}

/// @nodoc
class __$$_SettingsDetailsCopyWithImpl<$Res>
    extends _$SettingsDetailsCopyWithImpl<$Res, _$_SettingsDetails>
    implements _$$_SettingsDetailsCopyWith<$Res> {
  __$$_SettingsDetailsCopyWithImpl(
      _$_SettingsDetails _value, $Res Function(_$_SettingsDetails) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeType = null,
    Object? textType = null,
    Object? soundType = null,
  }) {
    return _then(_$_SettingsDetails(
      themeType: null == themeType
          ? _value.themeType
          : themeType // ignore: cast_nullable_to_non_nullable
              as ThemeType,
      textType: null == textType
          ? _value.textType
          : textType // ignore: cast_nullable_to_non_nullable
              as TextType,
      soundType: null == soundType
          ? _value.soundType
          : soundType // ignore: cast_nullable_to_non_nullable
              as SoundType,
    ));
  }
}

/// @nodoc

class _$_SettingsDetails implements _SettingsDetails {
  const _$_SettingsDetails(
      {required this.themeType,
      required this.textType,
      required this.soundType});

  @override
  final ThemeType themeType;
  @override
  final TextType textType;
  @override
  final SoundType soundType;

  @override
  String toString() {
    return 'SettingsDetails(themeType: $themeType, textType: $textType, soundType: $soundType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SettingsDetails &&
            (identical(other.themeType, themeType) ||
                other.themeType == themeType) &&
            (identical(other.textType, textType) ||
                other.textType == textType) &&
            (identical(other.soundType, soundType) ||
                other.soundType == soundType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, themeType, textType, soundType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SettingsDetailsCopyWith<_$_SettingsDetails> get copyWith =>
      __$$_SettingsDetailsCopyWithImpl<_$_SettingsDetails>(this, _$identity);
}

abstract class _SettingsDetails implements SettingsDetails {
  const factory _SettingsDetails(
      {required final ThemeType themeType,
      required final TextType textType,
      required final SoundType soundType}) = _$_SettingsDetails;

  @override
  ThemeType get themeType;
  @override
  TextType get textType;
  @override
  SoundType get soundType;
  @override
  @JsonKey(ignore: true)
  _$$_SettingsDetailsCopyWith<_$_SettingsDetails> get copyWith =>
      throw _privateConstructorUsedError;
}
