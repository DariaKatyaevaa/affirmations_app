import 'package:freezed_annotation/freezed_annotation.dart';

part 'quote.freezed.dart';

part 'quote.g.dart';

@freezed
class Quote with _$Quote {
  factory Quote({
    @JsonKey(name: 'quoteText') required String text,
    @JsonKey(name: 'quoteAuthor') required String author,
  }) = _Quote;

  factory Quote.fromJson(Map<String, dynamic> json) => _$QuoteFromJson(json);
}
