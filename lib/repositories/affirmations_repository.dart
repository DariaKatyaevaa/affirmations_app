import 'package:affirmations_app/models/affirmation/affirmation.dart';
import 'package:affirmations_app/models/affirmation_response/affrimation_response.dart';

abstract class AffirmationRepository {
  Future<AffirmationResponse> getAffirmations({int page = 1});

  Future<Affirmation> getAffirmation(String id);
}
