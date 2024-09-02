import 'package:flutter/material.dart';
import 'package:kh_easy_dev/services/navigate_page.dart';
import 'package:track_dog/core/text_styles.dart';
import 'package:track_dog/core/texts.dart';
import 'package:track_dog/i18n/strings.g.dart';
import 'package:track_dog/screens/login_register/login/login_screen.dart';
import 'package:track_dog/screens/login_register/register/register_screen.dart';
import 'package:track_dog/screens/report_lost_dog/report_lost_dog.dart';
import 'package:track_dog/services/translates/slang_settings.dart';
import 'package:track_dog/widgets/design/buttons/app_button.dart';
import 'package:track_dog/widgets/general/appbar.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(title: t.home_screen),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Column(
            children: [
              Text(
                getLanguageCode() == "he" ? greetingTextHe : greetingTextEn,
                style: AppTextStyle()
                    .description
                    .copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              AppButton(
                  text: t.want_login_exist_user,
                  onTap: () =>
                      KheasydevNavigatePage().push(context, LoginScreen())),
              const SizedBox(height: 12),
              AppButton(
                  text: t.want_report_lost_dog,
                  onTap: () =>
                      KheasydevNavigatePage().push(context, ReportLostDog())),
              const SizedBox(height: 12),
              AppButton(
                  text: t.want_register,
                  onTap: () =>
                      KheasydevNavigatePage().push(context, RegisterScreen())),
            ],
          ),
        ),
      ),
    );
  }
}
