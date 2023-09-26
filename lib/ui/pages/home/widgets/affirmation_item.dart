import 'package:affirmations_app/models/affirmation/affirmation.dart';
import 'package:affirmations_app/providers/favorite_affirmations_provider.dart';
import 'package:affirmations_app/ui/shared_widgets/progress_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pull_down_button/pull_down_button.dart';
import 'package:affirmations_app/providers/services_providers.dart';

class AffirmationItem extends ConsumerStatefulWidget {
  final Affirmation affirmation;
  final Color textColor;

  AffirmationItem({
    required this.affirmation,
    required this.textColor,
  });

  @override
  ConsumerState<AffirmationItem> createState() => _AffirmationItemState();
}

class _AffirmationItemState extends ConsumerState<AffirmationItem> {
  bool _isButtonsVisible = true;

  @override
  Widget build(BuildContext context) {
    final favoriteAffirmations = ref.watch(favoriteAffirmationProvider);
    final screenshotShareService = ref.read(screenshotShareServiceProvider);
    return favoriteAffirmations.maybeWhen(
      orElse: () => WhiteProgressIndicator(),
      data: (data) {
        final favoriteAffirmationsNotifier = ref.read(favoriteAffirmationProvider.notifier);
        final isFavorite = favoriteAffirmationsNotifier.hasAffirmation(widget.affirmation);
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 60.0),
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              Text(
                widget.affirmation.text,
                style: TextStyle(
                  color: widget.textColor,
                  fontSize: 28.0,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              Visibility(
                visible: _isButtonsVisible,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (!isFavorite) {
                          favoriteAffirmationsNotifier.addAffirmation(widget.affirmation);
                        } else {
                          favoriteAffirmationsNotifier.removeAffirmation(widget.affirmation);
                        }
                      },
                      child: Icon(
                        isFavorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                        size: 32.0,
                        color: widget.textColor,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    PullDownButton(
                      itemBuilder: (context) => [
                        PullDownMenuItem(
                          title: 'save'.tr(),
                          onTap: () async {
                            setState(() {
                              _isButtonsVisible = false;
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                behavior: SnackBarBehavior.floating,
                                margin: EdgeInsets.symmetric(horizontal: 100),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                                content: Center(child: Text('image saved')),
                                duration: Duration(seconds: 2),
                              ),
                            );
                            await screenshotShareService.saveImage();
                            setState(() {
                              _isButtonsVisible = true;
                            });
                          },
                          icon: CupertinoIcons.arrow_down_square,
                        ),
                        PullDownMenuItem(
                          title: 'share'.tr(),
                          onTap: () async {
                            setState(() {
                              _isButtonsVisible = false;
                            });
                            await screenshotShareService.saveAndShare();
                            setState(() {
                              _isButtonsVisible = true;
                            });
                          },
                          icon: CupertinoIcons.arrowshape_turn_up_right,
                        ),
                      ],
                      buttonBuilder: (context, showMenu) => GestureDetector(
                        onTap: showMenu,
                        child: Icon(
                          Icons.pending_outlined,
                          size: 32.0,
                          color: widget.textColor,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
