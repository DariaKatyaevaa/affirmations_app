import 'package:affirmations_app/models/sound_type/sound_type.dart';
import 'package:affirmations_app/models/text_type/text_type.dart';
import 'package:affirmations_app/models/theme_type/theme_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_details.freezed.dart';

@freezed
abstract class SettingsDetails with _$SettingsDetails {
  const factory SettingsDetails({
    required ThemeType themeType,
    required TextType textType,
    required SoundType soundType,
  }) = _SettingsDetails;
}
