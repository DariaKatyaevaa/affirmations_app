import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
part 'affirmation.freezed.dart';
part 'affirmation.g.dart';

@freezed
class Affirmation extends HiveObject with _$Affirmation {
  @HiveType(typeId: 0, adapterName: 'AffirmationAdapter')
  factory Affirmation({
    @JsonKey(name: 'id')  @HiveField(0) required int id,
    @JsonKey(name: 'advice')  @HiveField(1) required String text,
  }) = _Affirmation;

  Affirmation._();

  factory Affirmation.fromJson(Map<String, dynamic> json) => _$AffirmationFromJson(json);
}
