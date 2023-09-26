import 'package:affirmations_app/models/theme_type/theme_type.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pull_down_button/pull_down_button.dart';
import 'package:affirmations_app/providers/services_providers.dart';
import 'package:affirmations_app/providers/settings_providers.dart';

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
        trailing: Consumer(builder: (context, ref, _) {
          return PullDownButton(
            itemBuilder: (context) => [
              PullDownMenuItem(
                title: 'removeFromFavorites'.tr(),
                icon: CupertinoIcons.heart_slash,
                onTap: removeFunction,
              ),
              PullDownMenuItem(
                title: 'share'.tr(),
                onTap: () async {
                  final screenshotShareService = ref.read(screenshotShareServiceProvider);
                  final themeType = ref.read(themeTypeProvider);
                  await screenshotShareService.shareFromWidget(
                    _WidgetToShare(
                      text: text,
                      author: author,
                      themeType: themeType,
                    ),
                  );
                },
                icon: CupertinoIcons.arrowshape_turn_up_right,
              ),
            ],
            buttonBuilder: (context, showMenu) => GestureDetector(
              onTap: showMenu,
              child: Icon(Icons.more_vert),
            ),
          );
        }),
      ),
    );
  }
}

class _WidgetToShare extends StatelessWidget {
  final String text;
  final ThemeType themeType;
  final String? author;

  _WidgetToShare({required this.text, required this.themeType, this.author});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(themeType.toAsset()),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 60.0),
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: TextStyle(
                  color: themeType.textColor,
                  fontSize: 28.0,
                ),
                textAlign: TextAlign.center,
              ),
              if (author != null)
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 16),
                    Text(
                      author!,
                      style: TextStyle(
                        color: themeType.textColor,
                        fontSize: 24.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                )
            ],
          ),
        ),
      ],
    );
  }
}
