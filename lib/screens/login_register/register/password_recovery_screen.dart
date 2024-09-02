import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kh_easy_dev/services/navigate_page.dart';
import 'package:track_dog/core/colors.dart';
import 'package:track_dog/core/text_styles.dart';
import 'package:track_dog/i18n/strings.g.dart';
import 'package:track_dog/screens/login_register/login/bloc/login_screen_bloc.dart';
import 'package:track_dog/widgets/design/buttons/app_button.dart';
import 'package:track_dog/widgets/design/fields/app_textfields.dart';
import 'package:track_dog/widgets/dialogs/general_dialog.dart';
import 'package:track_dog/widgets/general/appbar.dart';

class PasswordRecoveryScreen extends StatefulWidget {
  const PasswordRecoveryScreen({super.key});

  @override
  State<PasswordRecoveryScreen> createState() => _PasswordRecoveryScreenState();
}

class _PasswordRecoveryScreenState extends State<PasswordRecoveryScreen> {
  late TextEditingController emailController;

  @override
  void initState() {
    emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginScreenBloc(),
      child: BlocConsumer<LoginScreenBloc, LoginScreenState>(
        listenWhen: (previous, current) => current is LoginScreenStataNavi,
        buildWhen: (previous, current) => current is! LoginScreenStataNavi,
        listener: (context, state) {
          switch (state.runtimeType) {
            case const (LoginScreenNaviToLoginScreen):
              KheasydevNavigatePage().pop(context, value: true);

            case const (LoginScreenFailedLogin):
              final newState = state as LoginScreenFailedLogin;
              openWrongDialog(title: newState.message);
          }
        },
        builder: (context, state) {
          final bloc = context.read<LoginScreenBloc>();
          return Scaffold(
            appBar: appAppBar(title: t.login_screen),
            body: Padding(
              padding: const EdgeInsets.all(24),
              child: Center(
                child: state is LoginScreenLoading
                    ? CircularProgressIndicator()
                    : Column(
                        children: [
                          const SizedBox(height: 36),
                          Icon(
                            Icons.refresh_outlined,
                            size: 60,
                            color: AppColors.primaryColor,
                          ),
                          const SizedBox(height: 36),
                          Text(
                            t.password_recovery,
                            style: AppTextStyle().bigTitle,
                          ),
                          AppTextField(
                            hintText: t.email,
                            controller: emailController,
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
          text: t.send_mail,
          onTap: () {
            final valid = formValidation();
            if (valid) {
              bloc.add(
                  LoginScreenEventSendMailRecover(email: emailController.text));
            }
          }),
    ];
  }

  openWrongDialog({
    bool emailNotValid = false,
    String? title,
  }) {
    showDialog(
      context: context,
      builder: (context) => GeneralDialog(
        oneButton: true,
        primaryColor: AppColors.primaryColor,
        title: emailNotValid ? t.email_not_valid : title ?? "",
        description: emailNotValid ? t.email_not_valid_description : "",
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

    return true;
  }
}
