import 'package:affirmations_app/ui/shared_widgets/progress_indicator.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: WhiteProgressIndicator()),
      backgroundColor: Colors.black,
    );
  }
}
