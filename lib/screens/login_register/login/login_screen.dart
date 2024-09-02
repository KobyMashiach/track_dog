import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kh_easy_dev/services/navigate_page.dart';
import 'package:track_dog/core/colors.dart';
import 'package:track_dog/core/text_styles.dart';
import 'package:track_dog/i18n/strings.g.dart';
import 'package:track_dog/screens/home/home_screen.dart';
import 'package:track_dog/screens/login_register/login/bloc/login_screen_bloc.dart';
import 'package:track_dog/screens/login_register/register/password_recovery_screen.dart';
import 'package:track_dog/screens/login_register/register/register_screen.dart';
import 'package:track_dog/screens/report_lost_dog/report_lost_dog.dart';
import 'package:track_dog/widgets/design/buttons/app_button.dart';
import 'package:track_dog/widgets/design/fields/app_textfields.dart';
import 'package:track_dog/widgets/dialogs/general_dialog.dart';
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
    return BlocProvider(
      create: (context) => LoginScreenBloc(),
      child: BlocConsumer<LoginScreenBloc, LoginScreenState>(
        listenWhen: (previous, current) => current is LoginScreenStataNavi,
        buildWhen: (previous, current) => current is! LoginScreenStataNavi,
        listener: (context, state) async {
          switch (state.runtimeType) {
            case const (LoginScreenNaviToHomeScreen):
              KheasydevNavigatePage().pushAndRemoveUntil(context, HomeScreen());
            case const (LoginScreenNaviToRegisterScreen):
              KheasydevNavigatePage()
                  .pushAndRemoveUntil(context, RegisterScreen());

            case const (LoginScreenFailedLogin):
              final newState = state as LoginScreenFailedLogin;
              openWrongDialog(title: newState.message);
            case const (LoginScreenNaviToPasswordRecoveryScreen):
              bool? mailSendSuccess = await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const PasswordRecoveryScreen(),
                ),
              );

              if (mailSendSuccess == true) {
                openWrongDialog(
                  title: t.mail__recover_sent_title,
                  description: t.mail__recover_sent_description,
                );
              }

            case const (LoginScreenNaviToReportDogScreen):
              KheasydevNavigatePage().push(context, ReportLostDog());
          }
        },
        builder: (context, state) {
          final bloc = context.read<LoginScreenBloc>();
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

  List<Widget> bottomButtons(BuildContext context, LoginScreenBloc bloc) {
    return [
      AppButton(
          text: t.login,
          onTap: () {
            final valid = formValidation();
            if (valid) {
              bloc.add(LoginScreenEventLogin(
                  email: emailController.text,
                  password: passwordController.text));
            }
          }),
      const SizedBox(height: 12),
      AppButton(
        text: t.want_report_lost_dog,
        unfillColors: true,
        onTap: () => bloc.add(LoginScreenEventNavReportDogScreen()),
      ),
      const SizedBox(height: 24),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text.rich(
            TextSpan(
              text: t.forgot_password,
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
                      ..onTap = () =>
                          bloc.add(LoginScreenEventNavForgotPasswordScreen())),
              ],
            ),
          ),
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
                      ..onTap =
                          () => bloc.add(LoginScreenEventNavRegisterScreen())),
              ],
            ),
          ),
        ],
      ),
    ];
  }

  openWrongDialog(
      {bool shortPassword = false,
      bool emailNotValid = false,
      String? title,
      String? description}) {
    showDialog(
      context: context,
      builder: (context) => GeneralDialog(
        oneButton: true,
        primaryColor: AppColors.primaryColor,
        title: shortPassword
            ? t.short_password
            : emailNotValid
                ? t.email_not_valid
                : title ?? "",
        description: shortPassword
            ? t.short_password_description
            : emailNotValid
                ? t.email_not_valid_description
                : description ?? "",
      ),
    );
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

    return true;
  }
}
