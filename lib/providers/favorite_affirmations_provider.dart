import 'package:affirmations_app/models/affirmation/affirmation.dart';
import 'package:affirmations_app/providers/services_providers.dart';
import 'package:affirmations_app/services/storage/storage_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final favoriteAffirmationProvider = StateNotifierProvider<FavoriteAffirmationNotifier, AsyncValue<List<Affirmation>>>(
  (ref) => FavoriteAffirmationNotifier(ref.watch(storageServiceProvider)),
);

class FavoriteAffirmationNotifier extends StateNotifier<AsyncValue<List<Affirmation>>> {
  final StorageService _storageService;
  late List<Affirmation> favoriteAffirmations;

  FavoriteAffirmationNotifier(this._storageService) : super(AsyncLoading()) {
    _fetchAffirmations();
  }

  void _fetchAffirmations() {
    state = AsyncLoading();
    favoriteAffirmations =
        _storageService.getAll(boxName: StorageBoxNames.favoriteAffirmations).map((q) => q as Affirmation).toList();
    state = AsyncData(favoriteAffirmations);
  }

  Future<void> addAffirmation(Affirmation affirmation) async {
    state = AsyncLoading();
    favoriteAffirmations.add(affirmation);
    await _storageService.add(
      data: affirmation,
      boxName: StorageBoxNames.favoriteAffirmations,
    );
    state = AsyncData(favoriteAffirmations);
  }

  Future<void> removeAffirmation(Affirmation affirmation) async {
    state = AsyncLoading();
    final index = favoriteAffirmations.indexOf(affirmation);
    favoriteAffirmations.removeAt(index);
    await _storageService.remove(
      index: index,
      boxName: StorageBoxNames.favoriteAffirmations,
    );
    state = AsyncData(favoriteAffirmations);
  }

  bool hasAffirmation(Affirmation affirmation) => favoriteAffirmations.contains(affirmation);
}
