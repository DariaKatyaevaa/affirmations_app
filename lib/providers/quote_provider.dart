import 'package:affirmations_app/models/quote/quote.dart';
import 'package:affirmations_app/providers/repositories_providers.dart';
import 'package:affirmations_app/repositories/affirmation/affirmations_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final quoteProvider = StateNotifierProvider<QuoteNotifier, AsyncValue<Quote>>(
      (ref) => QuoteNotifier(ref.read(affirmationsRepositoryProvider)),
);

class QuoteNotifier extends StateNotifier<AsyncValue<Quote>> {
  late List<Quote> quotes;
  final AffirmationRepository affirmationRepository;

  QuoteNotifier(this.affirmationRepository) : super(const AsyncLoading()) {
    quotes = List<Quote>.empty(growable: true);
    getQuote(0);
  }

  void getQuote(int index) async {
    state = AsyncLoading();
    if (index < quotes.length) {
      state = AsyncValue.data(quotes[index]);
    } else {
      final quote = await _getUniqueQuote();
      quotes.add(quote);
      state = AsyncValue.data(quote);
    }
  }

  Future<Quote> _getUniqueQuote() async {
    while (true) {
      try {
        final quote = await affirmationRepository.getQuote();
        if (!quotes.contains(quote)) {
          return quote;
        }
      } catch(_) {
        print(_);
        continue;
      }
    }
  }
}
