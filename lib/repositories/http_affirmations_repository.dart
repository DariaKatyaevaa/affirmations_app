import 'package:affirmations_app/models/affirmation/affirmation.dart';
import 'package:affirmations_app/models/affirmation_response/affrimation_response.dart';
import 'package:affirmations_app/repositories/affirmations_repository.dart';

class HttpAffirmationsRepository extends AffirmationRepository {
  @override
  Future<Affirmation> getAffirmation(String id) {
    // TODO: implement getAffirmation
    throw UnimplementedError();
  }

  @override
  Future<AffirmationResponse> getAffirmations({int page = 1}) {
    // TODO: implement getAffirmations
    throw UnimplementedError();
  }
}
