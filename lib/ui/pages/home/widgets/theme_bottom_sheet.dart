import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:affirmations_app/providers/settings_providers.dart';

class ThemeBottomSheet extends HookConsumerWidget {
  const ThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.read(settingsProvider.notifier);
    return DraggableScrollableSheet(
      maxChildSize: 0.87,
      initialChildSize: 0.87,
      minChildSize: 0.8,
      expand: false,
      builder: (context, controller) => Column(
        children: [
          SizedBox(height: 20),
          Text(
            'chooseTheme'.tr(),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                themeCategory('gradient'),
                SizedBox(height: 10),
                themeCategoryList('gradient', settings),
                SizedBox(height: 10),
                themeCategory('nature'),
                SizedBox(height: 10),
                themeCategoryList('nature', settings),
                SizedBox(height: 10),
                themeCategory('sky'),
                SizedBox(height: 10),
                themeCategoryList('sky', settings),
                SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget themeCategoryList(String category, SettingsNotifier settings) {
    final selectedThemeType = settings.details.themeType;
    return Container(
      height: 300,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 3,
        physics: ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          bool isSelected = selectedThemeType.number == index + 1 && selectedThemeType.themeCategory.text == category;
          return Padding(
            padding: EdgeInsets.only(left: 20.0, right: index == 2 ? 20.0 : 0.0),
            child: GestureDetector(
              onTap: () {
                settings.setThemeType(category, index + 1);
                Navigator.of(context).pop();
              },
              child: Container(
                decoration: BoxDecoration(
                  border: isSelected ? Border.all(color: Colors.black38, width: 3.0) : null,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20), // Image border
                  child: SizedBox.fromSize(
                    size: Size(200, 300), // Image radius
                    child: Image.asset(
                      "assets/images/$category/${index + 1}.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  Widget themeCategory(String category) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Text(
        category.tr(),
        style: TextStyle(
          color: Colors.black,
          fontSize: 22,
        ),
      ),
    );
  }
}
