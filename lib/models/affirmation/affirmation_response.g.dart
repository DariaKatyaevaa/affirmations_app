// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'affirmation_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AffirmationResponse _$$_AffirmationResponseFromJson(
        Map<String, dynamic> json) =>
    _$_AffirmationResponse(
      affirmation: Affirmation.fromJson(json['slip'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_AffirmationResponseToJson(
        _$_AffirmationResponse instance) =>
    <String, dynamic>{
      'slip': instance.affirmation,
    };
