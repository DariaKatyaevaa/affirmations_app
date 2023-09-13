import 'package:freezed_annotation/freezed_annotation.dart';
part 'affirmation.freezed.dart';
part 'affirmation.g.dart';

@freezed
class Affirmation with _$Affirmation {
  factory Affirmation({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'advice') required String text,
  }) = _Affirmation;

  factory Affirmation.fromJson(Map<String, dynamic> json) => _$AffirmationFromJson(json);
}
