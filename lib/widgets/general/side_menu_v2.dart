import 'package:track_dog/core/colors.dart';
import 'package:track_dog/i18n/strings.g.dart';
import 'package:track_dog/core/global_vars.dart';
import 'package:track_dog/services/translates/slang_settings.dart';
import 'package:track_dog/widgets/general/appbar.dart';
import 'package:flutter/material.dart';
import 'package:kh_easy_dev/kh_easy_dev.dart';

appSideMenuV2(BuildContext context, String pageName) {
  return kheasydevAppDrawerV2(
    name: "קובי",
    profileImage:
        "https://media.easy.co.il/images/UserPics/10116330_1673229445567.png",
    color: AppColors.primaryColor,
    contactsScreenButtomBackground: AppColors.buttomBackground,
    contactsScreenDialogColor: AppColors.primaryColor,
    appBar: appAppBar(title: t.contact_us),
    context: context,
    appDetails: (globalAppName, globalAppVersion),
    languageCode: getLanguageCode(),
    buttonsTextSize: 24,
    buttons: [
      // DrawerButtonModel(
      //   text: t.home_screen,
      //   enableColor: pageName == 'home',
      //   icon: Icon(Icons.home),
      //   page: HomeScreen(),
      // ),
      // DrawerButtonModel(
      //   text: t.settings,
      //   enableColor: pageName == 'settings',
      //   icon: Icon(Icons.settings),
      //   page: SettingsScreen(),
      // ),
    ],
  );
}
