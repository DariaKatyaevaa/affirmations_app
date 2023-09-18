import 'package:affirmations_app/models/affirmation/affirmation.dart';
import 'package:affirmations_app/providers/services_providers.dart';
import 'package:affirmations_app/services/storage/storage_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userAffirmationProvider = StateNotifierProvider<UserAffirmationNotifier, AsyncValue<List<Affirmation>>>(
      (ref) => UserAffirmationNotifier(ref.watch(storageServiceProvider)),
);

class UserAffirmationNotifier extends StateNotifier<AsyncValue<List<Affirmation>>> {
  final StorageService _storageService;
  late List<Affirmation> userAffirmations;

  UserAffirmationNotifier(this._storageService) : super(AsyncLoading()) {
    _fetchAffirmations();
  }

  void _fetchAffirmations() {
    state = AsyncLoading();
    userAffirmations =
        _storageService.getAll(boxName: StorageBoxNames.myAffirmations).map((q) => q as Affirmation).toList();
    state = AsyncData(userAffirmations);
  }

  Future<void> addAffirmation(Affirmation affirmation) async {
    state = AsyncLoading();
    userAffirmations.add(affirmation);
    await _storageService.add(
      data: affirmation,
      boxName: StorageBoxNames.myAffirmations,
    );
    state = AsyncData(userAffirmations);
  }

  Future<void> removeAffirmation(Affirmation affirmation) async {
    state = AsyncLoading();
    final index = userAffirmations.indexOf(affirmation);
    userAffirmations.removeAt(index);
    await _storageService.remove(
      index: index,
      boxName: StorageBoxNames.myAffirmations,
    );
    state = AsyncData(userAffirmations);
  }

  bool hasAffirmation(Affirmation affirmation) => userAffirmations.contains(affirmation);
}
