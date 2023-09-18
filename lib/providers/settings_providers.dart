import 'package:affirmations_app/models/text_type/text_type.dart';
import 'package:affirmations_app/providers/services_providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:affirmations_app/models/settings/settings_details/settings_details.dart';
import 'package:affirmations_app/models/settings/settings_state/settings_state.dart';
import 'package:affirmations_app/models/sound_type/sound_type.dart';
import 'package:affirmations_app/models/theme_type/theme_type.dart';
import 'package:affirmations_app/services/storage/storage_service.dart';

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

final settingsProvider = StateNotifierProvider<SettingsNotifier, SettingsState>(
  (ref) => SettingsNotifier(ref.watch(storageServiceProvider)),
);

class SettingsNotifier extends StateNotifier<SettingsState> {
  final StorageService _storageService;

  late SettingsDetails details;

  SettingsNotifier(this._storageService) : super(SettingsState.initial()) {
    _loadData();
  }

  void _loadData() async {
    state = SettingsState.loading();
    SoundType soundType = _storageService.get(
          StorageKeys.soundType,
          boxName: StorageBoxNames.settingsBox,
        ) ??
        SoundType.rain;
    ThemeType themeType = _storageService.get(
          StorageKeys.themeType,
          boxName: StorageBoxNames.settingsBox,
        ) ??
        ThemeType.gradientFirst;
    TextType textType = _storageService.get(
          StorageKeys.textType,
          boxName: StorageBoxNames.settingsBox,
        ) ??
        TextType.affirmation;
    details = SettingsDetails(
      themeType: themeType,
      soundType: soundType,
      textType: textType,
    );
    state = SettingsState.data(details: details);
  }

  void setThemeType(String category, int number) async {
    state = SettingsState.loading();
    var theme = ThemeType.values.firstWhere(
      (type) => type.themeCategory.text == category && type.number == number,
    );
    details = details.copyWith(themeType: theme);
    await _storageService.set(
      key: StorageKeys.themeType,
      data: theme,
      boxName: StorageBoxNames.settingsBox,
    );
    state = SettingsState.data(details: details);
  }

  void setTextType(String textType) async {
    state = SettingsState.loading();
    var type = TextType.values.firstWhere((type) => type.text == textType);
    details = details.copyWith(textType: type);
    await _storageService.set(
      key: StorageKeys.textType,
      data: type,
      boxName: StorageBoxNames.settingsBox,
    );
    state = SettingsState.data(details: details);
  }

  void setSoundType(String soundType) async {
    state = SettingsState.loading();
    var type = SoundType.values.firstWhere((type) => type.text == soundType);
    details = details.copyWith(soundType: type);
    await _storageService.set(
      key: StorageKeys.soundType,
      data: type,
      boxName: StorageBoxNames.settingsBox,
    );
    state = SettingsState.data(details: details);
  }
}
