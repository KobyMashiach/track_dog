import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:track_dog/firebase_options.dart';
import 'package:track_dog/i18n/strings.g.dart';
import 'package:track_dog/screens/login_register/login/login_screen.dart';
import 'package:track_dog/screens/login_register/register/register_screen.dart';
import 'package:track_dog/services/package_info.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await getAppFutureInfo();
  LocaleSettings.useDeviceLocale();
  runApp(TranslationProvider(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[100],
        fontFamily:
            GoogleFonts.amaticSc(fontWeight: FontWeight.bold).fontFamily,
        textTheme: TextTheme(
          bodyLarge: GoogleFonts.amaticSc(
            textStyle: TextStyle(fontSize: 28),
          ),
          bodyMedium: GoogleFonts.amaticSc(
            textStyle: TextStyle(fontSize: 24),
          ),
          bodySmall: GoogleFonts.amaticSc(
            textStyle: TextStyle(fontSize: 20),
          ),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      locale: TranslationProvider.of(context).flutterLocale,
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      home: RegisterScreen(),
    );
  }
}
