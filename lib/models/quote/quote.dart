import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'quote.freezed.dart';

part 'quote.g.dart';

@freezed
class Quote extends HiveObject with _$Quote {
  @HiveType(typeId: 1, adapterName: 'QuoteAdapter')
  factory Quote({
    @JsonKey(name: 'quoteText') @HiveField(0) required String text,
    @JsonKey(name: 'quoteAuthor') @HiveField(1) required String author,
  }) = _Quote;

  Quote._();

  factory Quote.fromJson(Map<String, dynamic> json) => _$QuoteFromJson(json);
}
