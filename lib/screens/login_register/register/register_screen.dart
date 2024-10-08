import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kh_easy_dev/services/navigate_page.dart';
import 'package:track_dog/core/colors.dart';
import 'package:track_dog/core/text_styles.dart';
import 'package:track_dog/i18n/strings.g.dart';
import 'package:track_dog/screens/home/home_screen.dart';
import 'package:track_dog/screens/login_register/login/login_screen.dart';
import 'package:track_dog/screens/login_register/register/bloc/register_screen_bloc.dart';
import 'package:track_dog/widgets/design/buttons/app_button.dart';
import 'package:track_dog/widgets/design/fields/app_textfields.dart';
import 'package:track_dog/widgets/dialogs/general_dialog.dart';
import 'package:track_dog/widgets/general/appbar.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController passwordVerificationController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    passwordVerificationController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    passwordVerificationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterScreenBloc(),
      child: BlocConsumer<RegisterScreenBloc, RegisterScreenState>(
        listenWhen: (previous, current) => current is RegisterScreenStataNavi,
        buildWhen: (previous, current) => current is! RegisterScreenStataNavi,
        listener: (context, state) {
          switch (state.runtimeType) {
            case const (RegisterScreenNaviToHomeScreen):
              KheasydevNavigatePage().pushAndRemoveUntil(context, HomeScreen());
            case const (RegisterScreenNaviToLoginScreen):
              KheasydevNavigatePage()
                  .pushAndRemoveUntil(context, LoginScreen());

            case const (RegisterScreenFailedRegister):
              final newState = state as RegisterScreenFailedRegister;
              openWrongDialog(title: newState.message);
          }
        },
        builder: (context, state) {
          final bloc = context.read<RegisterScreenBloc>();
          return Scaffold(
            appBar: appAppBar(title: t.register_screen),
            body: Padding(
              padding: const EdgeInsets.all(24),
              child: Center(
                child: state is RegisterScreenLoading
                    ? CircularProgressIndicator()
                    : Column(
                        children: [
                          const SizedBox(height: 36),
                          Icon(
                            Icons.lock_outline,
                            size: 60,
                            color: AppColors.primaryColor,
                          ),
                          const SizedBox(height: 36),
                          Text(
                            t.register,
                            style: AppTextStyle().bigTitle,
                          ),
                          AppTextField(
                            hintText: t.email,
                            controller: emailController,
                            keyboard: TextInputType.emailAddress,
                          ),
                          AppTextField(
                            hintText: t.password,
                            controller: passwordController,
                            checkIfPassword: true,
                          ),
                          AppTextField(
                            hintText: t.password_verification,
                            controller: passwordVerificationController,
                            checkIfPassword: true,
                          ),
                          const SizedBox(height: 12),
                          Spacer(),
                          if (MediaQuery.of(context).viewInsets.bottom == 0)
                            ...bottomButtons(context, bloc)
                        ],
                      ),
              ),
            ),
          );
        },
      ),
    );
  }

  List<Widget> bottomButtons(BuildContext context, RegisterScreenBloc bloc) {
    return [
      AppButton(
          text: t.register,
          primaryColor: AppColors.primaryColor,
          onTap: () {
            final valid = formValidation();
            if (valid) {
              bloc.add(RegisterScreenEventRegister(
                  email: emailController.text,
                  password: passwordController.text));
            }
          }),
      const SizedBox(height: 24),
      Text.rich(
        TextSpan(
          text: t.have_account,
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
                  ..onTap =
                      () => bloc.add(RegisterScreenEventNavLoginScreen())),
          ],
        ),
      ),
    ];
  }

  bool formValidation() {
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailController.text);
    if (!emailValid) {
      openWrongDialog(emailNotValid: true);
      return false;
    }

    if (passwordController.text.isEmpty) {
      openWrongDialog(shortPassword: true);
      return false;
    }
    if (passwordController.text != passwordVerificationController.text) {
      openWrongDialog(passwordsDontMatch: true);
      return false;
    }

    return true;
  }

  openWrongDialog({
    bool shortPassword = false,
    bool passwordsDontMatch = false,
    bool emailExist = false,
    bool emailNotValid = false,
    String? title,
  }) {
    showDialog(
      context: context,
      builder: (context) => GeneralDialog(
        oneButton: true,
        primaryColor: AppColors.primaryColor,
        title: shortPassword
            ? t.short_password
            : passwordsDontMatch
                ? t.password_dont_match
                : emailExist
                    ? t.email_exist
                    : emailNotValid
                        ? t.email_not_valid
                        : title ?? "",
        description: shortPassword
            ? t.short_password_description
            : passwordsDontMatch
                ? t.password_dont_match_description
                : emailExist
                    ? t.email_exist_description
                    : emailNotValid
                        ? t.email_not_valid_description
                        : "",
      ),
    );
  }
}
