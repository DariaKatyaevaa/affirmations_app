import 'package:affirmations_app/ui/pages/favorites/widgets/favorite_quotes_list.dart';
import 'package:affirmations_app/ui/pages/favorites/widgets/favorites_affirmations_list.dart';
import 'package:affirmations_app/ui/pages/favorites/widgets/user_affirmations_list.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum FavoritesType {
  affirmations,
  quotes,
  user;

  String getTitle() => switch (this) {
        FavoritesType.affirmations => 'favoriteAffirmations'.tr(),
        FavoritesType.quotes => 'favoriteQuotes'.tr(),
        FavoritesType.user => 'myAffirmations'.tr(),
      };

  Widget getWidget() => switch (this) {
        FavoritesType.affirmations => FavoriteAffirmationsList(),
        FavoritesType.quotes => FavoriteQuotesList(),
        FavoritesType.user => UserAffirmationList(),
      };
}

class FavoritesPage extends StatelessWidget {
  final FavoritesType favoritesType;

  FavoritesPage({
    super.key,
    required this.favoritesType,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          favoritesType.getTitle(),
          style: TextStyle(fontSize: 24.0),
        ),
        backgroundColor: Colors.transparent,
      ),
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      backgroundColor: CupertinoColors.systemGroupedBackground,
      body: SafeArea(
        child: favoritesType.getWidget(),
      ),
    );
  }
}
