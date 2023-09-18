import 'dart:developer';
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:affirmations_app/services/storage/storage_service.dart';
import 'package:affirmations_app/providers/services_providers.dart';

final localeProvider = StateNotifierProvider<LocaleNotifier, String>(
  (ref) {
    final storageService = ref.watch(storageServiceProvider);
    late String initialLocale;

    try {
      initialLocale = storageService.get(
            StorageKeys.currentLocale,
            boxName: StorageBoxNames.settingsBox,
          ) ??
          Platform.localeName.substring(0, 2);
    } catch (e) {
      log('Error setting initial locale: $e');
      initialLocale = 'en';
    }

    return LocaleNotifier(storageService, initialLocale: initialLocale);
  },
);

class LocaleNotifier extends StateNotifier<String> {
  LocaleNotifier(
    this.storageServiceProvider, {
    required String initialLocale,
  }) : super(initialLocale);

  final StorageService storageServiceProvider;

  String get language => state;

  void setLocale(String localeCode) {
    state = localeCode;
    storageServiceProvider.set(
      key: StorageKeys.currentLocale,
      data: localeCode,
      boxName: StorageBoxNames.settingsBox,
    );
  }
}
