import 'package:affirmations_app/providers/favorite_affirmations_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:affirmations_app/ui/shared_widgets/progress_indicator.dart';
import 'package:affirmations_app/ui/pages/favorites/widgets/favorite_list_item.dart';

class FavoriteAffirmationsList extends ConsumerWidget {
  const FavoriteAffirmationsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteAffirmations = ref.watch(favoriteAffirmationProvider);
    return favoriteAffirmations.maybeWhen(
      data: (affirmations) => Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: ListView.builder(
          itemCount: affirmations.length,
          itemBuilder: (context, index) => FavoriteListItem(
            text: affirmations[index].text,
            removeFunction: () => ref.read(favoriteAffirmationProvider.notifier).removeAffirmation(affirmations[index]),
          ),
        ),
      ),
      orElse: () => WhiteProgressIndicator(),
    );
  }
}
