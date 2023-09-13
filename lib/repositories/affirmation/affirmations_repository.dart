import 'package:affirmations_app/models/affirmation/affirmation_response.dart';
import 'package:affirmations_app/models/quote/quote.dart';

abstract class AffirmationRepository {
  Future<AffirmationResponse> getAffirmation();

  Future<Quote> getQuote();
}
