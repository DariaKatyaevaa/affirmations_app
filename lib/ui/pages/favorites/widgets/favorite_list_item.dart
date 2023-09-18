import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_down_button/pull_down_button.dart';

class FavoriteListItem extends StatelessWidget {
  final String text;
  final String? author;
  final VoidCallback removeFunction;

  const FavoriteListItem({
    super.key,
    required this.text,
    required this.removeFunction,
    this.author,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: ListTile(
        contentPadding: EdgeInsets.all(10.0),
        title: Text(text),
        subtitle: author != null ? Text(author!) : null,
        trailing: PullDownButton(
          itemBuilder: (context) => [
            PullDownMenuItem(
              title: 'removeFromFavorites'.tr(),
              icon: CupertinoIcons.heart_slash,
              onTap: removeFunction,
            ),
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
            child: Icon(Icons.more_vert),
          ),
        ),
      ),
    );
  }
}
