class StorageKeys {
  static const String currentLocale = 'current_locale';
  static const String soundType = 'sound_type';
  static const String themeType = 'theme_type';
  static const String textType = 'text_type';
  static const String list = 'list';
}

class StorageBoxNames {
  static const String settingsBox = 'settings';
  static const String favoriteAffirmations = 'favorite_affirmations';
  static const String favoriteQuotes = 'favorite_quotes';
  static const String myAffirmations = 'my_affirmations';
}

abstract class StorageService {
  Future<void> init();

  Future<void> remove({required int index, required String boxName});

  dynamic get(String key, {required String boxName});

  List<dynamic> getAll({required String boxName});

  Future<void> clear();

  Future<void> clearBox({required String boxName});

  bool has(String key, {required String boxName});

  Future<void> set({String? key, required dynamic data, required String boxName});

  Future<void> add({required dynamic data, required String boxName});
}
