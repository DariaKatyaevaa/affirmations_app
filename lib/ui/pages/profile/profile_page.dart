import 'package:affirmations_app/providers/services_providers.dart';
import 'package:affirmations_app/router/route_names.dart';
import 'package:affirmations_app/router/route_paths.dart';
import 'package:affirmations_app/ui/pages/favorites/favorites_page.dart';
import 'package:affirmations_app/ui/shared_widgets/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../router/app_router.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.read(authServiceProvider);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'myProfile'.tr(),
          style: TextStyle(fontSize: 24.0),
        ),
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          CupertinoListSection.insetGrouped(
            header: Container(
                padding: EdgeInsets.only(top: 100.0, bottom: auth.currentUser != null ? 20.0 : 0),
                child: Center(
                  child: Text(
                    auth.currentUser != null ? '${auth.currentUser!.email}' : '',
                    style: TextStyle(
                      fontSize: 18.0,
                      // color: Colors.grey,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                )),
            children: <CupertinoListTile>[
              CupertinoListTile.notched(
                title: Text('favoriteAffirmations'.tr()),
                leading: Icon(CupertinoIcons.heart),
                trailing: const CupertinoListTileChevron(),
                onTap: () => _goToFavorites(context, FavoritesType.affirmations),
              ),
              CupertinoListTile.notched(
                title: Text('favoriteQuotes'.tr()),
                leading: Icon(CupertinoIcons.bookmark),
                trailing: const CupertinoListTileChevron(),
                onTap: () => _goToFavorites(context, FavoritesType.quotes),
              ),
              CupertinoListTile.notched(
                title: Text('myAffirmations'.tr()),
                leading: Icon(CupertinoIcons.smiley),
                trailing: const CupertinoListTileChevron(),
                onTap: () => _goToFavorites(context, FavoritesType.user),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: [
              SafeArea(
                child: CustomButton(
                  onPressed: () async {
                    await auth.signOut();
                    context.go(RoutePaths.auth);
                  },
                  buttonText: 'logout'.tr(),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  void _goToFavorites(BuildContext context, FavoritesType type) => context.pushNamed(
        RouteNames.favorites,
        extra: type,
      );
}
