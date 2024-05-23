import 'package:doctor_app/main.dart';
import 'package:flutter/material.dart';

class LanguageManager {
  static const List<Locale> supportedLocales = [
    Locale('en'),
    Locale('ar'),
  ];

  static Locale appLocale = supportedLocales[0]; // Default locale is English

  static void changeLocale(BuildContext context, Locale newLocale) {
    if (appLocale != newLocale) {
      appLocale = newLocale;
      // Notify the framework that the locale has changed
      _updateLocale(context, newLocale);
    }
  }

  static void _updateLocale(BuildContext context, Locale newLocale) {
    // Reload the root navigator's state to reflect the new locale
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (_) => MyApp(),
    ));
  }
}
