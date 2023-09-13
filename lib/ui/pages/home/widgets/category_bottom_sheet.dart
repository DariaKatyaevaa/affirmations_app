import 'package:affirmations_app/models/sound_type/sound_type.dart';
import 'package:affirmations_app/models/text_type/text_type.dart';
import 'package:affirmations_app/models/theme_type/theme_type.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

typedef void OnTextTypeTapFunction(String textType);
typedef void OnSoundTypeTapFunction(String soundType);

class CategoryBottomSheet extends StatefulWidget {
  final OnTextTypeTapFunction onTextTypeTap;
  final OnSoundTypeTapFunction onSoundTypeTap;
  final int selectedSoundTypeIndex;
  final int selectedTextTypeIndex;

  const CategoryBottomSheet({
    super.key,
    required this.selectedSoundTypeIndex,
    required this.selectedTextTypeIndex,
    required this.onTextTypeTap,
    required this.onSoundTypeTap,
  });

  @override
  State<CategoryBottomSheet> createState() => _CategoryBottomSheetState();
}

class _CategoryBottomSheetState extends State<CategoryBottomSheet> {
  List<bool> _categories = List.generate(ThemeCategory.values.length, (index) => false);
  List<bool> _sounds = List.generate(SoundType.values.length, (index) => false);

  @override
  void initState() {
    super.initState();
    _categories[widget.selectedTextTypeIndex] = true;
    _sounds[widget.selectedSoundTypeIndex] = true;
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      maxChildSize: 0.3,
      initialChildSize: 0.3,
      builder: (context, c) => Column(
        children: [
          SizedBox(height: 30),
          Text(
            'category'.tr(),
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          categoryList(
            context,
            TextType.values.map((e) => e.text).toList(),
            _categories,
          ),
          SizedBox(height: 20),
          Text(
            'sounds'.tr(),
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          categoryList(
            context,
            SoundType.values.map((e) => e.text).toList(),
            _sounds,
            isSound: true,
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget categoryList(
    BuildContext context,
    List<String> category,
    List<bool> selectedList, {
    bool isSound = false,
  }) {
    return Expanded(
      child: ListView.builder(
        itemCount: category.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                for (var i = 0; i < selectedList.length; i++) {
                  selectedList[i] = i == index ? true : false;
                }
              });
              if (isSound) {
                widget.onSoundTypeTap(category[index]);
              } else {
                widget.onTextTypeTap(category[index]);
              }
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 25.0),
              margin: EdgeInsets.only(
                left: index == 0 ? 10.0 : 5.0,
                right: 5.0,
                bottom: 5.0,
                top: 5.0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                border: Border.all(color: Colors.black),
                color: selectedList[index] ? Colors.black : null,
              ),
              child: Center(
                child: Text(
                  category[index].tr(),
                  style: TextStyle(
                    color: selectedList[index] ? Colors.white : Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
