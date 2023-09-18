import 'package:affirmations_app/ui/pages/favorites/widgets/favorite_list_item.dart';
import 'package:affirmations_app/ui/shared_widgets/progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:affirmations_app/providers/favorite_quotes_provider.dart';

class FavoriteQuotesList extends ConsumerWidget {
  const FavoriteQuotesList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteQuotes = ref.watch(favoriteQuotesProvider);
    return favoriteQuotes.maybeWhen(
      data: (quotes) => Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: ListView.builder(
          itemCount: quotes.length,
          itemBuilder: (context, index) => FavoriteListItem(
            text: quotes[index].text,
            author: quotes[index].author,
            removeFunction: () => ref.read(favoriteQuotesProvider.notifier).removeQuote(quotes[index]),
          ),
        ),
      ),
      orElse: () => WhiteProgressIndicator(),
    );
  }
}
