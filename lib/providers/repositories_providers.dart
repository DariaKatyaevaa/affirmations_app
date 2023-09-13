import 'package:affirmations_app/repositories/affirmation/http_affirmations_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'services_providers.dart';

final affirmationsRepositoryProvider = Provider<HttpAffirmationsRepository>(
  (ref) => HttpAffirmationsRepository(
    api: ref.read(dioServiceProvider),
  ),
);
