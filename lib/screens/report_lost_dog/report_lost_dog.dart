import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:track_dog/dev/maps.dart';
import 'package:track_dog/i18n/strings.g.dart';
import 'package:track_dog/widgets/design/fields/app_textfields.dart';
import 'package:track_dog/widgets/general/appbar.dart';

class ReportLostDog extends StatelessWidget {
  const ReportLostDog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(title: t.report_lost_dog),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(child: AppTextField(hintText: t.full_name)),
                  const SizedBox(width: 12),
                  Expanded(child: AppTextField(hintText: t.contact_phone)),
                ],
              ),
              // AppButton(
              //     text: "text",
              //     onTap: () {
              //       KheasydevNavigatePage().push(context, MapSample());
              //     })
              AddressPickerWidget(
                onAddressSelected: (address, location) {
                  log("Selected Address: $address");
                  log("Selected Location: ${location.latitude}, ${location.longitude}");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
