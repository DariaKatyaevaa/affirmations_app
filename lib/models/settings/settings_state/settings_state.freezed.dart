// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SettingsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(SettingsDetails details) data,
    required TResult Function(String? error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(SettingsDetails details)? data,
    TResult? Function(String? error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(SettingsDetails details)? data,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SettingsStateInitial value) initial,
    required TResult Function(_SettingsStateLoading value) loading,
    required TResult Function(_SetttingsStateData value) data,
    required TResult Function(_SettingsStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SettingsStateInitial value)? initial,
    TResult? Function(_SettingsStateLoading value)? loading,
    TResult? Function(_SetttingsStateData value)? data,
    TResult? Function(_SettingsStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SettingsStateInitial value)? initial,
    TResult Function(_SettingsStateLoading value)? loading,
    TResult Function(_SetttingsStateData value)? data,
    TResult Function(_SettingsStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsStateCopyWith<$Res> {
  factory $SettingsStateCopyWith(
          SettingsState value, $Res Function(SettingsState) then) =
      _$SettingsStateCopyWithImpl<$Res, SettingsState>;
}

/// @nodoc
class _$SettingsStateCopyWithImpl<$Res, $Val extends SettingsState>
    implements $SettingsStateCopyWith<$Res> {
  _$SettingsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_SettingsStateInitialCopyWith<$Res> {
  factory _$$_SettingsStateInitialCopyWith(_$_SettingsStateInitial value,
          $Res Function(_$_SettingsStateInitial) then) =
      __$$_SettingsStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SettingsStateInitialCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res, _$_SettingsStateInitial>
    implements _$$_SettingsStateInitialCopyWith<$Res> {
  __$$_SettingsStateInitialCopyWithImpl(_$_SettingsStateInitial _value,
      $Res Function(_$_SettingsStateInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SettingsStateInitial implements _SettingsStateInitial {
  const _$_SettingsStateInitial();

  @override
  String toString() {
    return 'SettingsState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_SettingsStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(SettingsDetails details) data,
    required TResult Function(String? error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(SettingsDetails details)? data,
    TResult? Function(String? error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(SettingsDetails details)? data,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SettingsStateInitial value) initial,
    required TResult Function(_SettingsStateLoading value) loading,
    required TResult Function(_SetttingsStateData value) data,
    required TResult Function(_SettingsStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SettingsStateInitial value)? initial,
    TResult? Function(_SettingsStateLoading value)? loading,
    TResult? Function(_SetttingsStateData value)? data,
    TResult? Function(_SettingsStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SettingsStateInitial value)? initial,
    TResult Function(_SettingsStateLoading value)? loading,
    TResult Function(_SetttingsStateData value)? data,
    TResult Function(_SettingsStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _SettingsStateInitial implements SettingsState {
  const factory _SettingsStateInitial() = _$_SettingsStateInitial;
}

/// @nodoc
abstract class _$$_SettingsStateLoadingCopyWith<$Res> {
  factory _$$_SettingsStateLoadingCopyWith(_$_SettingsStateLoading value,
          $Res Function(_$_SettingsStateLoading) then) =
      __$$_SettingsStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SettingsStateLoadingCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res, _$_SettingsStateLoading>
    implements _$$_SettingsStateLoadingCopyWith<$Res> {
  __$$_SettingsStateLoadingCopyWithImpl(_$_SettingsStateLoading _value,
      $Res Function(_$_SettingsStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SettingsStateLoading implements _SettingsStateLoading {
  const _$_SettingsStateLoading();

  @override
  String toString() {
    return 'SettingsState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_SettingsStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(SettingsDetails details) data,
    required TResult Function(String? error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(SettingsDetails details)? data,
    TResult? Function(String? error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(SettingsDetails details)? data,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SettingsStateInitial value) initial,
    required TResult Function(_SettingsStateLoading value) loading,
    required TResult Function(_SetttingsStateData value) data,
    required TResult Function(_SettingsStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SettingsStateInitial value)? initial,
    TResult? Function(_SettingsStateLoading value)? loading,
    TResult? Function(_SetttingsStateData value)? data,
    TResult? Function(_SettingsStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SettingsStateInitial value)? initial,
    TResult Function(_SettingsStateLoading value)? loading,
    TResult Function(_SetttingsStateData value)? data,
    TResult Function(_SettingsStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _SettingsStateLoading implements SettingsState {
  const factory _SettingsStateLoading() = _$_SettingsStateLoading;
}

/// @nodoc
abstract class _$$_SetttingsStateDataCopyWith<$Res> {
  factory _$$_SetttingsStateDataCopyWith(_$_SetttingsStateData value,
          $Res Function(_$_SetttingsStateData) then) =
      __$$_SetttingsStateDataCopyWithImpl<$Res>;
  @useResult
  $Res call({SettingsDetails details});

  $SettingsDetailsCopyWith<$Res> get details;
}

/// @nodoc
class __$$_SetttingsStateDataCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res, _$_SetttingsStateData>
    implements _$$_SetttingsStateDataCopyWith<$Res> {
  __$$_SetttingsStateDataCopyWithImpl(
      _$_SetttingsStateData _value, $Res Function(_$_SetttingsStateData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? details = null,
  }) {
    return _then(_$_SetttingsStateData(
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as SettingsDetails,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $SettingsDetailsCopyWith<$Res> get details {
    return $SettingsDetailsCopyWith<$Res>(_value.details, (value) {
      return _then(_value.copyWith(details: value));
    });
  }
}

/// @nodoc

class _$_SetttingsStateData implements _SetttingsStateData {
  const _$_SetttingsStateData({required this.details});

  @override
  final SettingsDetails details;

  @override
  String toString() {
    return 'SettingsState.data(details: $details)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SetttingsStateData &&
            (identical(other.details, details) || other.details == details));
  }

  @override
  int get hashCode => Object.hash(runtimeType, details);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SetttingsStateDataCopyWith<_$_SetttingsStateData> get copyWith =>
      __$$_SetttingsStateDataCopyWithImpl<_$_SetttingsStateData>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(SettingsDetails details) data,
    required TResult Function(String? error) error,
  }) {
    return data(details);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(SettingsDetails details)? data,
    TResult? Function(String? error)? error,
  }) {
    return data?.call(details);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(SettingsDetails details)? data,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(details);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SettingsStateInitial value) initial,
    required TResult Function(_SettingsStateLoading value) loading,
    required TResult Function(_SetttingsStateData value) data,
    required TResult Function(_SettingsStateError value) error,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SettingsStateInitial value)? initial,
    TResult? Function(_SettingsStateLoading value)? loading,
    TResult? Function(_SetttingsStateData value)? data,
    TResult? Function(_SettingsStateError value)? error,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SettingsStateInitial value)? initial,
    TResult Function(_SettingsStateLoading value)? loading,
    TResult Function(_SetttingsStateData value)? data,
    TResult Function(_SettingsStateError value)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class _SetttingsStateData implements SettingsState {
  const factory _SetttingsStateData({required final SettingsDetails details}) =
      _$_SetttingsStateData;

  SettingsDetails get details;
  @JsonKey(ignore: true)
  _$$_SetttingsStateDataCopyWith<_$_SetttingsStateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SettingsStateErrorCopyWith<$Res> {
  factory _$$_SettingsStateErrorCopyWith(_$_SettingsStateError value,
          $Res Function(_$_SettingsStateError) then) =
      __$$_SettingsStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String? error});
}

/// @nodoc
class __$$_SettingsStateErrorCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res, _$_SettingsStateError>
    implements _$$_SettingsStateErrorCopyWith<$Res> {
  __$$_SettingsStateErrorCopyWithImpl(
      _$_SettingsStateError _value, $Res Function(_$_SettingsStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$_SettingsStateError(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_SettingsStateError implements _SettingsStateError {
  const _$_SettingsStateError({this.error});

  @override
  final String? error;

  @override
  String toString() {
    return 'SettingsState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SettingsStateError &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SettingsStateErrorCopyWith<_$_SettingsStateError> get copyWith =>
      __$$_SettingsStateErrorCopyWithImpl<_$_SettingsStateError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(SettingsDetails details) data,
    required TResult Function(String? error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(SettingsDetails details)? data,
    TResult? Function(String? error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(SettingsDetails details)? data,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SettingsStateInitial value) initial,
    required TResult Function(_SettingsStateLoading value) loading,
    required TResult Function(_SetttingsStateData value) data,
    required TResult Function(_SettingsStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SettingsStateInitial value)? initial,
    TResult? Function(_SettingsStateLoading value)? loading,
    TResult? Function(_SetttingsStateData value)? data,
    TResult? Function(_SettingsStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SettingsStateInitial value)? initial,
    TResult Function(_SettingsStateLoading value)? loading,
    TResult Function(_SetttingsStateData value)? data,
    TResult Function(_SettingsStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _SettingsStateError implements SettingsState {
  const factory _SettingsStateError({final String? error}) =
      _$_SettingsStateError;

  String? get error;
  @JsonKey(ignore: true)
  _$$_SettingsStateErrorCopyWith<_$_SettingsStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
