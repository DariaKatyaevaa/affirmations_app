import 'package:affirmations_app/providers/services_providers.dart';
import 'package:affirmations_app/providers/settings_providers.dart';
import 'package:affirmations_app/router/route_names.dart';
import 'package:affirmations_app/ui/pages/home/widgets/sound_widget.dart';
import 'package:affirmations_app/ui/pages/home/widgets/category_bottom_sheet.dart';
import 'package:affirmations_app/ui/pages/home/widgets/custom_icon_button.dart';
import 'package:affirmations_app/ui/pages/home/widgets/theme_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:affirmations_app/ui/pages/home/widgets/main_text_page_view.dart';
import 'package:screenshot/screenshot.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Consumer(builder: (context, ref, _) {
            final themeType = ref.watch(themeTypeProvider);
            final screenshotShareService = ref.read(screenshotShareServiceProvider);
            return Screenshot(
              controller: screenshotShareService.screenshotController,
              child: Stack(
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
                  MainTextPageView(),
                ],
              ),
            );
          }),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 20.0),
                          CustomIconButton(
                            onTap: () => context.goNamed(RouteNames.profile),
                            iconData: Icons.account_circle_rounded,
                          ),
                          SizedBox(width: 10.0),
                          CustomIconButton(
                            onTap: () => _showThemeBottomSheet(context),
                            iconData: Icons.palette_rounded,
                          ),
                        ],
                      ),
                      SoundWidget(),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 20.0),
                      Consumer(
                        builder: (context, ref, _) {
                          return CustomIconButton(
                            onTap: () => _showCategoryBottomSheet(context, ref),
                            iconData: Icons.interests_rounded,
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showCategoryBottomSheet(BuildContext context, WidgetRef ref) {
    final settings = ref.read(settingsProvider.notifier);
    showModalBottomSheet(
      elevation: 0,
      backgroundColor: Colors.white70,
      context: context,
      isScrollControlled: true,
      builder: (context) => CategoryBottomSheet(
        onSoundTypeTap: settings.setSoundType,
        onTextTypeTap: settings.setTextType,
        selectedSoundTypeIndex: settings.details.soundType.index,
        selectedTextTypeIndex: settings.details.textType.index,
      ),
    );
  }

  void _showThemeBottomSheet(BuildContext context) => showModalBottomSheet(
        elevation: 0,
        backgroundColor: Colors.white70,
        context: context,
        isScrollControlled: true,
        builder: (context) => ThemeBottomSheet(),
      );
}
