import 'package:affirmations_app/models/quote/quote.dart';
import 'package:affirmations_app/providers/services_providers.dart';
import 'package:affirmations_app/services/storage/storage_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final favoriteQuotesProvider = StateNotifierProvider<FavoriteQuotesNotifier, AsyncValue<List<Quote>>>(
  (ref) => FavoriteQuotesNotifier(ref.watch(storageServiceProvider)),
);

class FavoriteQuotesNotifier extends StateNotifier<AsyncValue<List<Quote>>> {
  final StorageService _storageService;
  late List<Quote> favoriteQuotes;

  FavoriteQuotesNotifier(this._storageService) : super(AsyncLoading()) {
    _fetchQuotes();
  }

  void _fetchQuotes() {
    state = AsyncLoading();
    var a = _storageService.getAll(boxName: StorageBoxNames.favoriteQuotes);
    favoriteQuotes = a.map((q) => q as Quote).toList();
    state = AsyncData(favoriteQuotes);
  }

  Future<void> addQuote(Quote quote) async {
    state = AsyncLoading();
    favoriteQuotes.add(quote);
    await _storageService.add(
      data: quote,
      boxName: StorageBoxNames.favoriteQuotes,
    );
    state = AsyncData(favoriteQuotes);
  }

  Future<void> removeQuote(Quote quote) async {
    state = AsyncLoading();
    final index = favoriteQuotes.indexOf(quote);
    favoriteQuotes.removeAt(index);
    await _storageService.remove(
      index: index,
      boxName: StorageBoxNames.favoriteQuotes,
    );
    state = AsyncData(favoriteQuotes);
  }

  bool hasQuote(Quote quote) => favoriteQuotes.contains(quote);
}
