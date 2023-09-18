import 'package:affirmations_app/models/affirmation/affirmation.dart';
import 'package:affirmations_app/providers/user_affirmations_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:affirmations_app/ui/shared_widgets/progress_indicator.dart';
import 'package:affirmations_app/ui/pages/favorites/widgets/favorite_list_item.dart';

class UserAffirmationList extends ConsumerWidget {
  const UserAffirmationList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAffirmations = ref.watch(userAffirmationProvider);
    return userAffirmations.maybeWhen(
      data: (affirmations) => affirmations.isEmpty
          ? addAffirmationButton(context)
          : Stack(
              fit: StackFit.expand,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: ListView.builder(
                    itemCount: affirmations.length,
                    itemBuilder: (context, index) => FavoriteListItem(
                      text: affirmations[index].text,
                      removeFunction: () =>
                          ref.read(userAffirmationProvider.notifier).removeAffirmation(affirmations[index]),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () => showAddAffirmationBottomSheet(context),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF73AFAF),
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        padding: EdgeInsets.all(8.0),
                        margin: EdgeInsets.only(right: 16.0, bottom: 10.0),
                        child: Icon(
                          Icons.add_rounded,
                          size: 32.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
      orElse: () => WhiteProgressIndicator(),
    );
  }

  Center addAffirmationButton(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.add_circle,
                size: 28.0,
                color: Colors.white,
              ),
              SizedBox(width: 10.0),
              Text(
                "addAffirmation".tr(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF73AFAF),
          elevation: 0,
        ),
        onPressed: () => showAddAffirmationBottomSheet(context),
      ),
    );
  }

  Future<dynamic> showAddAffirmationBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.white,
      builder: (context) => _AddAffirmationBottomSheet(),
    );
  }
}

class _AddAffirmationBottomSheet extends StatefulWidget {
  @override
  State<_AddAffirmationBottomSheet> createState() => _AddAffirmationBottomSheetState();
}

class _AddAffirmationBottomSheetState extends State<_AddAffirmationBottomSheet> {
  final TextEditingController controller = TextEditingController();
  bool validate = false;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final userAffirmations = ref.read(userAffirmationProvider.notifier);
      return Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Text(
                      'cancel'.tr(),
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF73AFAF),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (controller.text.isEmpty) {
                        setState(() {
                          validate = true;
                        });
                      } else {
                        userAffirmations.addAffirmation(Affirmation(
                          id: controller.text.hashCode,
                          text: controller.text,
                        ));
                        Navigator.of(context).pop();
                      }
                    },
                    child: Text(
                      'save'.tr(),
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF73AFAF),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 40.0),
              Text(
                'enterYourAffirmation'.tr(),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  focusColor: Color(0xFF73AFAF),
                  hoverColor: Color(0xFF73AFAF),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF73AFAF),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(30)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF73AFAF),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(30)),
                ),
                cursorColor: Color(0xFF73AFAF),
                enabled: true,
                maxLines: 3,
                onSubmitted: (text) => userAffirmations.addAffirmation(Affirmation(
                  id: text.hashCode,
                  text: text,
                )),
              ),
              SizedBox(height: 40.0),
            ],
          ),
        ),
      );
    });
  }
}
