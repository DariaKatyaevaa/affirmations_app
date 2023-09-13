import 'package:affirmations_app/models/affirmation/affirmation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'affirmation_response.freezed.dart';

part 'affirmation_response.g.dart';

@freezed
class AffirmationResponse with _$AffirmationResponse {
  factory AffirmationResponse({
    @JsonKey(name: 'slip') required Affirmation affirmation,
  }) = _AffirmationResponse;

  factory AffirmationResponse.fromJson(Map<String, dynamic> json) => _$AffirmationResponseFromJson(json);
}
