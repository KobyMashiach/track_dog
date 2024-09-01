// import 'package:track_dog/screens/home_screen/home_screen.dart';
// import 'package:track_dog/screens/settings/setting_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:kh_easy_dev/kh_easy_dev.dart';
// import 'package:kh_easy_dev/services/navigate_page.dart';
// import 'package:track_dog/core/colors.dart';
// import 'package:track_dog/widgets/general/appbar.dart';

// appSideMenu(BuildContext context, {required int index}) {
//   return KheasydevSideMenu(
//     selectedIndex: index,
//     shadowColor: AppColor.primaryColor,
//     disableColor: AppColor.disableColor,
//     // appName: 'Iron Post',
//     sidebarItems: [
//       SideBarModel(
//           icon: Icons.home_outlined,
//           label: "מסך בית",
//           onTap: () {
//             KheasydevNavigatePage().pushAndRemoveUntil(context, HomeScreen());
//           }),
//       SideBarModel(
//           icon: Icons.home_outlined,
//           label: "הגדרות",
//           onTap: () {
//             KheasydevNavigatePage()
//                 .pushAndRemoveUntil(context, SettingsScreen());
//           }),
//     ],
//     buttomBackground: AppColor.buttomBackground,
//     appBar: appAppBar(title: 'יצירת קשר'),
//   );
// }
