import 'package:flutter/material.dart';
import 'package:kh_easy_dev/widgets/input/app_button_widget.dart';
import 'package:track_dog/core/colors.dart';

Widget AppButton({
  Function()? onTap,
  required String text,
  bool unfillColors = false,
  bool disableColors = false,
  EdgeInsets? padding,
  EdgeInsets? margin,
  double? textSize,
  Color? primaryColor,
  Color? textColor,
}) {
  return kheasydevAppButton(
      text: text,
      onTap: onTap,
      unfillColors: unfillColors,
      disableColors: disableColors,
      margin: margin ?? EdgeInsets.zero,
      textSize: textSize,
      textColor: textColor,
      primaryColor: AppColors.primaryColor);
}
