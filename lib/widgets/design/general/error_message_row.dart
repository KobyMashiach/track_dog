import 'package:flutter/material.dart';
import 'package:track_dog/core/colors.dart';
import 'package:track_dog/core/text_styles.dart';

Widget errorMessageRow(String message) {
  return Row(
    children: [
      Icon(
        Icons.info_outline,
        color: AppColors.error,
        size: 20,
      ),
      const SizedBox(width: 12),
      Text(
        message,
        style: AppTextStyle().error,
      ),
    ],
  );
}
