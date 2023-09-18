import 'package:affirmations_app/models/quote/quote.dart';
import 'package:affirmations_app/providers/favorite_quotes_provider.dart';
import 'package:affirmations_app/ui/shared_widgets/progress_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pull_down_button/pull_down_button.dart';

class QuoteItem extends ConsumerWidget {
  final Quote quote;
  final Color textColor;

  const QuoteItem({
    required this.quote,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteQuotes = ref.watch(favoriteQuotesProvider);
    return favoriteQuotes.maybeWhen(
      orElse: () => WhiteProgressIndicator(),
      data: (data) {
        final favoriteQuotesNotifier = ref.read(favoriteQuotesProvider.notifier);
        final isFavorite = favoriteQuotesNotifier.hasQuote(quote);
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 60.0),
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              Text(
                quote.text,
                style: TextStyle(
                  color: textColor,
                  fontSize: 28.0,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Text(
                quote.author,
                style: TextStyle(
                  color: textColor,
                  fontSize: 24.0,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (!isFavorite) {
                        favoriteQuotesNotifier.addQuote(quote);
                      } else {
                        favoriteQuotesNotifier.removeQuote(quote);
                      }
                    },
                    child: Icon(
                      isFavorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                      size: 32.0,
                      color: textColor,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  PullDownButton(
                    itemBuilder: (context) => [
                      PullDownMenuItem(
                        title: 'share'.tr(),
                        onTap: () {
                          //todo
                        },
                        icon: CupertinoIcons.arrowshape_turn_up_right,
                      ),
                    ],
                    buttonBuilder: (context, showMenu) => GestureDetector(
                      onTap: showMenu,
                      child: Icon(
                        Icons.pending_outlined,
                        size: 32.0,
                        color: textColor,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
