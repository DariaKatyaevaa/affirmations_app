import 'package:affirmations_app/providers/services_providers.dart';
import 'package:affirmations_app/ui/pages/auth/login_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:affirmations_app/models/theme_type/theme_type.dart';
import 'package:affirmations_app/ui/shared_widgets/custom_button.dart';
import 'package:affirmations_app/ui/shared_widgets/custom_text_field.dart';
import 'package:affirmations_app/router/route_names.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String _errorMessage = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ThemeType.gradientFirst.toAsset()),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.fromLTRB(0, 500, 0, 0),
          shrinkWrap: true,
          reverse: true,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 470,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Icon(
                                    Icons.arrow_back,
                                    color: Colors.black,
                                  ),
                                ),
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      "signup".tr(),
                                      style: TextStyle(
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff4f4f4f),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "email".tr(),
                                    style: TextStyle(fontSize: 18, color: Color(0xff8d8d8d)),
                                  ),
                                  const SizedBox(height: 10),
                                  CustomTextField(
                                    onChanged: () => validateEmail(emailController.text),
                                    controller: emailController,
                                    hintText: "hello@gmail.com",
                                    obscureText: false,
                                    prefixIcon: const Icon(Icons.mail_outline),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                                    child: Text(
                                      _errorMessage,
                                      style: TextStyle(fontSize: 12, color: Colors.red),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    "password".tr(),
                                    style: TextStyle(fontSize: 18, color: Color(0xff8d8d8d)),
                                  ),
                                  const SizedBox(height: 10),
                                  CustomTextField(
                                    controller: passwordController,
                                    hintText: "**************",
                                    obscureText: true,
                                    prefixIcon: const Icon(Icons.lock_outline),
                                  ),
                                  const SizedBox(height: 16),
                                  Consumer(builder: (context, ref, _) {
                                    return CustomButton(
                                      onPressed: () => registerUser(ref),
                                      buttonText: 'register'.tr(),
                                    );
                                  }),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(35, 0, 0, 0),
                                    child: Row(
                                      children: [
                                        Text(
                                          "alreadyHaveAccount".tr(),
                                          style: TextStyle(fontSize: 15, color: Color(0xff8d8d8d)),
                                        ),
                                        TextButton(
                                          child: Text(
                                            "login".tr(),
                                            style: TextStyle(fontSize: 15, color: Color(0xff44564a)),
                                          ),
                                          onPressed: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => const LoginPage(),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void registerUser(WidgetRef ref) async {
    try {
      final auth = ref.read(authServiceProvider);
      await auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      context.goNamed(RouteNames.home);
    } on FirebaseAuthException catch (e) {
      showErrorMessage(e.code);
    }
  }

  void showErrorMessage(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(message),
          );
        });
  }

  void validateEmail(String val) {
    if (val.isEmpty) {
      setState(() {
        _errorMessage = "Email can not be empty";
      });
    } else if (!EmailValidator.validate(val, true)) {
      setState(() {
        _errorMessage = "Invalid Email Address";
      });
    } else {
      setState(() {
        _errorMessage = "";
      });
    }
  }
}
