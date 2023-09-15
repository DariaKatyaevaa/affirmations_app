import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      backgroundColor: Colors.white,
      body: CupertinoListSection.insetGrouped(
        header: Container(
            padding: EdgeInsets.only(top: 100),
            child: const Text(
              '',
              style: TextStyle(fontSize: 32),
            )),
        children: <CupertinoListTile>[
          CupertinoListTile.notched(
            title: Text('favoriteAffirmations'.tr()),
            leading: Icon(CupertinoIcons.heart),
            trailing: const CupertinoListTileChevron(),
          ),
          CupertinoListTile.notched(
            title: Text('myAffirmations'.tr()),
            leading: Icon(CupertinoIcons.smiley),
            trailing: const CupertinoListTileChevron(),
          ),
        ],
      ),
    );
  }
}
