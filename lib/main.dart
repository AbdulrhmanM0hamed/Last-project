import 'package:doctor_app/Login/onbording.dart';
import 'package:doctor_app/Settings/notify_page.dart';
import 'package:doctor_app/generated/l10n.dart';
import 'package:doctor_app/pages/doctor_page.dart';
import 'package:doctor_app/pages/doctor_profile_page.dart';
import 'package:doctor_app/pages/schedule.dart';
import 'package:doctor_app/theme/colors.dart';
import 'package:doctor_app/widgets/languge_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'pages/home.dart';
import 'generated/l10n.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: LanguageManager.supportedLocales,
      locale: LanguageManager.appLocale,
      theme: ThemeData(
        fontFamily: 'Cairo', // تحديد الخط العام هنا
      ),
      home: OnBoardingView(),
    );
  }
}

bool isArabic() {
  return Intl.getCurrentLocale() == 'ar';
}
