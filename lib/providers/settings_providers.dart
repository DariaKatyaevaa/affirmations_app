import 'package:affirmations_app/models/text_type/text_type.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:affirmations_app/models/settings/settings_details/settings_details.dart';
import 'package:affirmations_app/models/settings/settings_state/settings_state.dart';
import 'package:affirmations_app/models/sound_type/sound_type.dart';
import 'package:affirmations_app/models/theme_type/theme_type.dart';

final textTypeProvider = Provider<TextType>((ref) {
  return ref.watch(settingsProvider).maybeWhen(
        data: (data) => data.textType,
        orElse: () => TextType.affirmation,
      );
});

final themeTypeProvider = Provider<ThemeType>((ref) {
  return ref.watch(settingsProvider).maybeWhen(
        data: (data) => data.themeType,
        orElse: () => ThemeType.gradientFirst,
      );
});

final soundTypeProvider = Provider<SoundType>((ref) {
  return ref.watch(settingsProvider).maybeWhen(
        data: (data) => data.soundType,
        orElse: () => SoundType.forest,
      );
});

final settingsProvider = StateNotifierProvider<SettingsNotifier, SettingsState>((ref) => SettingsNotifier());

class SettingsNotifier extends StateNotifier<SettingsState> {
  late SettingsDetails details;

  SettingsNotifier() : super(SettingsState.initial()) {
    loadData();
  }

  void loadData() async {
    state = SettingsState.loading();
    details = SettingsDetails(
      themeType: ThemeType.gradientFirst,
      soundType: SoundType.rain,
      textType: TextType.affirmation,
    );
    state = SettingsState.data(details: details);
  }

  void setThemeType(String category, int number) async {
    state = SettingsState.loading();
    var theme = ThemeType.values.firstWhere((type) => type.themeCategory.text == category && type.number == number);
    details = details.copyWith(themeType: theme);
    state = SettingsState.data(details: details);
  }

  void setTextType(String textType) async {
    state = SettingsState.loading();
    var type = TextType.values.firstWhere((type) => type.text == textType);
    details = details.copyWith(textType: type);
    state = SettingsState.data(details: details);
  }

  void setSoundType(String soundType) async {
    state = SettingsState.loading();
    var type = SoundType.values.firstWhere((type) => type.text == soundType);
    details = details.copyWith(soundType: type);
    state = SettingsState.data(details: details);
  }
}
