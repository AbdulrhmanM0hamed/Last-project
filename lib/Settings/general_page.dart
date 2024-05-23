import 'package:doctor_app/generated/l10n.dart';
import 'package:doctor_app/main.dart'; // Assuming this imports LanguageManager
import 'package:doctor_app/widgets/languge_manger.dart';
import 'package:flutter/material.dart';

import 'package:doctor_app/generated/l10n.dart';
import 'package:doctor_app/main.dart'; // Assuming this imports LanguageManager
import 'package:doctor_app/widgets/languge_manger.dart';
import 'package:flutter/material.dart';

class GeneralPage extends StatefulWidget {
  @override
  State<GeneralPage> createState() => _GeneralPageState();
}

class _GeneralPageState extends State<GeneralPage> {
  Locale _currentLocale = Locale('en'); // اللغة الافتراضية هي الإنجليزية

  @override
  void initState() {
    super.initState();
    _currentLocale = LanguageManager
        .appLocale; // تحديد اللغة الحالية للتطبيق عند بدء التشغيل
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('General Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Language'),
            trailing: DropdownButton<Locale>(
              value: _currentLocale,
              items: LanguageManager.supportedLocales.map((locale) {
                return DropdownMenuItem<Locale>(
                  value: locale,
                  child:
                      Text(locale.languageCode == 'en' ? 'English' : 'العربية'),
                );
              }).toList(),
              onChanged: (newLocale) {
                _changeLanguage(context, newLocale!);
              },
            ),
          ),
          // ... other settings
        ],
      ),
    );
  }

  void _changeLanguage(BuildContext context, Locale newLocale) {
    final currentLocale = Localizations.localeOf(context);

    setState(() {
      _currentLocale = newLocale;
      if (currentLocale == newLocale) {
        _currentLocale = newLocale;
      }
    });

    LanguageManager.changeLocale(context, newLocale); // تحديث لغة التطبيق
  }
}
