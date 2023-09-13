import 'package:affirmations_app/models/affirmation/affirmation.dart';
import 'package:affirmations_app/providers/repositories_providers.dart';
import 'package:affirmations_app/repositories/affirmation/affirmations_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final affirmationProvider = StateNotifierProvider<AffirmationNotifier, AsyncValue<Affirmation>>(
  (ref) => AffirmationNotifier(ref.read(affirmationsRepositoryProvider)),
);

class AffirmationNotifier extends StateNotifier<AsyncValue<Affirmation>> {
  late List<Affirmation> affirmations;
  final AffirmationRepository affirmationRepository;

  AffirmationNotifier(this.affirmationRepository) : super(const AsyncLoading()) {
    affirmations = List<Affirmation>.empty(growable: true);
    getAffirmation(0);
  }

  void getAffirmation(int index) async {
    state = AsyncLoading();
    if (index < affirmations.length) {
      state = AsyncValue.data(affirmations[index]);
    } else {
      final affirmation = await _getUniqueAffirmation();
      affirmations.add(affirmation);
      state = AsyncValue.data(affirmation);
    }
  }

  Future<Affirmation> _getUniqueAffirmation() async {
    while (true) {
      final response = await affirmationRepository.getAffirmation();
      if (!affirmations.contains(response.affirmation)) {
        return response.affirmation;
      }
    }
  }
}
