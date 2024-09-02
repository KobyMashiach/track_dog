import 'package:flutter/material.dart';
import 'package:track_dog/i18n/strings.g.dart';
import 'package:track_dog/widgets/general/appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(title: t.home_screen),
    );
  }
}
