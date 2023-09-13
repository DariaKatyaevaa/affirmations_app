import 'dart:convert';

import 'package:affirmations_app/constants/endpoints.dart';
import 'package:affirmations_app/models/affirmation/affirmation_response.dart';
import 'package:affirmations_app/models/quote/quote.dart';
import 'package:affirmations_app/repositories/affirmation/affirmations_repository.dart';
import 'package:affirmations_app/services/api/dio_service.dart';

class HttpAffirmationsRepository implements AffirmationRepository {
  final DioService api;

  HttpAffirmationsRepository({required this.api});

  @override
  Future<AffirmationResponse> getAffirmation() => api.request(
        url: AppEndpoints.adviceSlipsApi,
        method: HttpMethod.get,
        builder: (data) => AffirmationResponse.fromJson(json.decode(data)),
      );

  @override
  Future<Quote> getQuote() => api.request(
        url: AppEndpoints.quoteApi,
        method: HttpMethod.get,
        builder: (data) => Quote.fromJson(data),
        parameters: {
          'method': 'getQuote',
          'format': 'json',
          'lang': 'en',
          'key': 268456,
        },
      );
}
