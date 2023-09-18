import 'package:affirmations_app/ui/pages/home/widgets/affirmation_item.dart';
import 'package:affirmations_app/ui/pages/home/widgets/quote_item.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:affirmations_app/models/text_type/text_type.dart';
import 'package:affirmations_app/providers/affirmation_provider.dart';
import 'package:affirmations_app/providers/quote_provider.dart';
import 'package:affirmations_app/providers/settings_providers.dart';
import 'package:affirmations_app/ui/shared_widgets/progress_indicator.dart';

class MainTextPageView extends HookConsumerWidget {
  const MainTextPageView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textType = ref.watch(textTypeProvider);
    final themeType = ref.watch(themeTypeProvider);
    final affirmation = ref.watch(affirmationProvider);
    final quote = ref.watch(quoteProvider);
    return PageView.builder(
      onPageChanged: (index) => textType == TextType.affirmation
          ? ref.read(affirmationProvider.notifier).getAffirmation(index)
          : ref.read(quoteProvider.notifier).getQuote(index),
      itemBuilder: (context, index) => textType == TextType.affirmation
          ? affirmation.maybeWhen(
              orElse: () => WhiteProgressIndicator(),
              data: (data) => AffirmationItem(
                affirmation: data,
                textColor: themeType.textColor,
              ),
            )
          : quote.maybeWhen(
              orElse: () => WhiteProgressIndicator(),
              data: (data) => QuoteItem(
                quote: data,
                textColor: themeType.textColor,
              ),
            ),
      scrollDirection: Axis.vertical,
    );
  }
}
