import 'package:affirmations_app/models/affirmation/affirmation.dart';
import 'package:affirmations_app/models/quote/quote.dart';
import 'package:affirmations_app/models/sound_type/sound_type.dart';
import 'package:affirmations_app/models/text_type/text_type.dart';
import 'package:affirmations_app/models/theme_type/theme_type.dart';
import 'package:hive_flutter/hive_flutter.dart';

import './storage_service.dart';

class HiveStorageService implements StorageService {
  late Box _settingsBox;
  late Box<Affirmation> _favoriteAffirmationsBox;
  late Box<Quote> _favoriteQuotesBox;
  late Box<Affirmation> _myAffirmationsBox;

  @override
  Future<void> init() async {
    await Hive.initFlutter();
    _registerAdapters();
    await _openBoxes();
  }

  void _registerAdapters() {
    Hive.registerAdapter(SoundTypeAdapter());
    Hive.registerAdapter(ThemeTypeAdapter());
    Hive.registerAdapter(TextTypeAdapter());
    Hive.registerAdapter(QuoteAdapter());
    Hive.registerAdapter(AffirmationAdapter());
  }

  Future<void> _openBoxes() async {
    _settingsBox = await Hive.openBox(StorageBoxNames.settingsBox);
    _favoriteAffirmationsBox = await Hive.openBox<Affirmation>(StorageBoxNames.favoriteAffirmations);
    _favoriteQuotesBox = await Hive.openBox<Quote>(StorageBoxNames.favoriteQuotes);
    _myAffirmationsBox = await Hive.openBox<Affirmation>(StorageBoxNames.myAffirmations);
  }

  Box _getTargetBox(String boxName) => switch (boxName) {
        StorageBoxNames.settingsBox => _settingsBox,
        StorageBoxNames.favoriteQuotes => _favoriteQuotesBox,
        StorageBoxNames.myAffirmations => _myAffirmationsBox,
        StorageBoxNames.favoriteAffirmations => _favoriteAffirmationsBox,
        _ => _settingsBox
      };

  @override
  Future<void> remove({
    required int index,
    required String boxName,
  }) async {
    _getTargetBox(boxName).deleteAt(index);
  }

  @override
  dynamic get(
    String key, {
    required String boxName,
  }) {
    return _getTargetBox(boxName).get(key);
  }

  @override
  List<dynamic> getAll({required String boxName}) {
    return _getTargetBox(boxName).values.toList();
  }

  @override
  bool has(String key, {required String boxName}) {
    return _getTargetBox(boxName).containsKey(key);
  }

  @override
  Future<void> set({
    String? key,
    required dynamic data,
    required String boxName,
  }) async {
    _getTargetBox(boxName).put(key, data);
  }

  @override
  Future<void> clear() async {
    await _myAffirmationsBox.clear();
    await _favoriteQuotesBox.clear();
    await _favoriteAffirmationsBox.clear();
    await _settingsBox.clear();
  }

  @override
  Future<void> clearBox({required String boxName}) async {
    await _getTargetBox(boxName).clear();
  }

  @override
  Future<void> add({required data, required String boxName}) async {
    await _getTargetBox(boxName).add(data);
  }
}
