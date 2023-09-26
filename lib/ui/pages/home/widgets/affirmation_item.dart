import 'package:affirmations_app/models/affirmation/affirmation.dart';
import 'package:affirmations_app/providers/favorite_affirmations_provider.dart';
import 'package:affirmations_app/ui/shared_widgets/progress_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
//import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:pull_down_button/pull_down_button.dart';
//import 'package:screenshot/screenshot.dart';

class AffirmationItem extends ConsumerWidget {
  final Affirmation affirmation;
  final Color textColor;
  //final ScreenshotController screenshotController = ScreenshotController();

  AffirmationItem({
    required this.affirmation,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteAffirmations = ref.watch(favoriteAffirmationProvider);
    return favoriteAffirmations.maybeWhen(
      orElse: () => WhiteProgressIndicator(),
      data: (data) {
        final favoriteAffirmationsNotifier = ref.read(favoriteAffirmationProvider.notifier);
        final isFavorite = favoriteAffirmationsNotifier.hasAffirmation(affirmation);
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 60.0),
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              Text(
                affirmation.text,
                style: TextStyle(
                  color: textColor,
                  fontSize: 28.0,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Consumer(builder: (context, ref, _) {
                    return GestureDetector(
                      onTap: () {
                        if (!isFavorite) {
                          favoriteAffirmationsNotifier.addAffirmation(affirmation);
                        } else {
                          favoriteAffirmationsNotifier.removeAffirmation(affirmation);
                        }
                      },
                      child: Icon(
                        isFavorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                        size: 32.0,
                        color: textColor,
                      ),
                    );
                  }),
                  SizedBox(
                    width: 10,
                  ),
                  PullDownButton(
                    itemBuilder: (context) => [
                      PullDownMenuItem(
                        title: 'share'.tr(),
                        onTap: () async {
                          // await screenshotController.captureFromWidget(HomePage()).then((value) async {
                          //   await ImageGallerySaver.saveImage(value);
                          // });
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
