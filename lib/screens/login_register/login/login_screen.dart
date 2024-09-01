import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kh_easy_dev/services/navigate_page.dart';
import 'package:kh_easy_dev/widgets/input/app_button_widget.dart';
import 'package:track_dog/core/colors.dart';
import 'package:track_dog/core/text_styles.dart';
import 'package:track_dog/i18n/strings.g.dart';
import 'package:track_dog/screens/login_register/register/register_screen.dart';
import 'package:track_dog/widgets/design/fields/app_textfields.dart';
import 'package:track_dog/widgets/general/appbar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(title: t.login_screen),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 36),
              Icon(
                Icons.login,
                size: 60,
                color: AppColors.primaryColor,
              ),
              const SizedBox(height: 36),
              Text(
                t.login,
                style: AppTextStyle().bigTitle,
              ),
              AppTextField(
                hintText: t.email,
                controller: emailController,
              ),
              AppTextField(
                hintText: t.password,
                controller: passwordController,
                checkIfPassword: true,
              ),
              Spacer(),
              if (MediaQuery.of(context).viewInsets.bottom == 0)
                ...bottomButtons(context)
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> bottomButtons(BuildContext context) {
    return [
      kheasydevAppButton(
          text: t.login,
          primaryColor: AppColors.primaryColor,
          onTap: () {
            final valid = checkValidation();
          }),
      const SizedBox(height: 24),
      Text.rich(
        TextSpan(
          text: t.no_account,
          style: AppTextStyle().smallDescription,
          children: [
            TextSpan(text: "?"),
            TextSpan(text: " "),
            TextSpan(
                text: t.click_here,
                style: AppTextStyle()
                    .smallDescription
                    .copyWith(fontWeight: FontWeight.bold),
                recognizer: TapGestureRecognizer()
                  ..onTap = () => KheasydevNavigatePage()
                      .pushAndRemoveUntil(context, RegisterScreen())),
          ],
        ),
      ),
    ];
  }

  checkValidation() {
    if (emailController.text.isEmpty) return false;
    if (passwordController.text.length < 6) return false;
  }
}
