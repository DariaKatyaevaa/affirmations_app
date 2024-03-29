// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quote.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Quote _$QuoteFromJson(Map<String, dynamic> json) {
  return _Quote.fromJson(json);
}

/// @nodoc
mixin _$Quote {
  @JsonKey(name: 'quoteText')
  @HiveField(0)
  String get text => throw _privateConstructorUsedError;
  @JsonKey(name: 'quoteAuthor')
  @HiveField(1)
  String get author => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuoteCopyWith<Quote> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuoteCopyWith<$Res> {
  factory $QuoteCopyWith(Quote value, $Res Function(Quote) then) =
      _$QuoteCopyWithImpl<$Res, Quote>;
  @useResult
  $Res call(
      {@JsonKey(name: 'quoteText') @HiveField(0) String text,
      @JsonKey(name: 'quoteAuthor') @HiveField(1) String author});
}

/// @nodoc
class _$QuoteCopyWithImpl<$Res, $Val extends Quote>
    implements $QuoteCopyWith<$Res> {
  _$QuoteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? author = null,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuoteCopyWith<$Res> implements $QuoteCopyWith<$Res> {
  factory _$$_QuoteCopyWith(_$_Quote value, $Res Function(_$_Quote) then) =
      __$$_QuoteCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'quoteText') @HiveField(0) String text,
      @JsonKey(name: 'quoteAuthor') @HiveField(1) String author});
}

/// @nodoc
class __$$_QuoteCopyWithImpl<$Res> extends _$QuoteCopyWithImpl<$Res, _$_Quote>
    implements _$$_QuoteCopyWith<$Res> {
  __$$_QuoteCopyWithImpl(_$_Quote _value, $Res Function(_$_Quote) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? author = null,
  }) {
    return _then(_$_Quote(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 1, adapterName: 'QuoteAdapter')
class _$_Quote extends _Quote {
  _$_Quote(
      {@JsonKey(name: 'quoteText') @HiveField(0) required this.text,
      @JsonKey(name: 'quoteAuthor') @HiveField(1) required this.author})
      : super._();

  factory _$_Quote.fromJson(Map<String, dynamic> json) =>
      _$$_QuoteFromJson(json);

  @override
  @JsonKey(name: 'quoteText')
  @HiveField(0)
  final String text;
  @override
  @JsonKey(name: 'quoteAuthor')
  @HiveField(1)
  final String author;

  @override
  String toString() {
    return 'Quote(text: $text, author: $author)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Quote &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.author, author) || other.author == author));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, text, author);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuoteCopyWith<_$_Quote> get copyWith =>
      __$$_QuoteCopyWithImpl<_$_Quote>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuoteToJson(
      this,
    );
  }
}

abstract class _Quote extends Quote {
  factory _Quote(
      {@JsonKey(name: 'quoteText') @HiveField(0) required final String text,
      @JsonKey(name: 'quoteAuthor')
      @HiveField(1)
      required final String author}) = _$_Quote;
  _Quote._() : super._();

  factory _Quote.fromJson(Map<String, dynamic> json) = _$_Quote.fromJson;

  @override
  @JsonKey(name: 'quoteText')
  @HiveField(0)
  String get text;
  @override
  @JsonKey(name: 'quoteAuthor')
  @HiveField(1)
  String get author;
  @override
  @JsonKey(ignore: true)
  _$$_QuoteCopyWith<_$_Quote> get copyWith =>
      throw _privateConstructorUsedError;
}
