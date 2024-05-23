// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Get the Best\nMedical Service`
  String get title_of_get_theBest {
    return Intl.message(
      'Get the Best\nMedical Service',
      name: 'title_of_get_theBest',
      desc: '',
      args: [],
    );
  }

  /// `Get the best medical service for treating skin diseases .`
  String get discreption_of_get_theBest {
    return Intl.message(
      'Get the best medical service for treating skin diseases .',
      name: 'discreption_of_get_theBest',
      desc: '',
      args: [],
    );
  }

  /// `👋 Hello!`
  String get hello {
    return Intl.message(
      '👋 Hello!',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `Search Medical`
  String get search_medical {
    return Intl.message(
      'Search Medical',
      name: 'search_medical',
      desc: '',
      args: [],
    );
  }

  /// `Services`
  String get service {
    return Intl.message(
      'Services',
      name: 'service',
      desc: '',
      args: [],
    );
  }

  /// `Doctors`
  String get doctor {
    return Intl.message(
      'Doctors',
      name: 'doctor',
      desc: '',
      args: [],
    );
  }

  /// `Pharmacies`
  String get pharmacies {
    return Intl.message(
      'Pharmacies',
      name: 'pharmacies',
      desc: '',
      args: [],
    );
  }

  /// `Report`
  String get report {
    return Intl.message(
      'Report',
      name: 'report',
      desc: '',
      args: [],
    );
  }

  /// `A I`
  String get ai {
    return Intl.message(
      'A I',
      name: 'ai',
      desc: '',
      args: [],
    );
  }

  /// `Popular Doctor`
  String get popular_Doctor {
    return Intl.message(
      'Popular Doctor',
      name: 'popular_Doctor',
      desc: '',
      args: [],
    );
  }

  /// `Dr.Ahmed Ibrahim `
  String get ahmed {
    return Intl.message(
      'Dr.Ahmed Ibrahim ',
      name: 'ahmed',
      desc: '',
      args: [],
    );
  }

  /// `Dr.Mohamed Fathy `
  String get mohamed {
    return Intl.message(
      'Dr.Mohamed Fathy ',
      name: 'mohamed',
      desc: '',
      args: [],
    );
  }

  /// `Dr.Abdelrahman Mohamed`
  String get abdelrahman {
    return Intl.message(
      'Dr.Abdelrahman Mohamed',
      name: 'abdelrahman',
      desc: '',
      args: [],
    );
  }

  /// `Dr.Abanoub Nabil`
  String get abanoub {
    return Intl.message(
      'Dr.Abanoub Nabil',
      name: 'abanoub',
      desc: '',
      args: [],
    );
  }

  /// `Dr.kerolos Mores`
  String get kerolos {
    return Intl.message(
      'Dr.kerolos Mores',
      name: 'kerolos',
      desc: '',
      args: [],
    );
  }

  /// `Dr.Heba Ali `
  String get heba {
    return Intl.message(
      'Dr.Heba Ali ',
      name: 'heba',
      desc: '',
      args: [],
    );
  }

  /// `Dr.Asmaa Zayed`
  String get Asmaa {
    return Intl.message(
      'Dr.Asmaa Zayed',
      name: 'Asmaa',
      desc: '',
      args: [],
    );
  }

  /// `Dr.laila Al-Sharqawi`
  String get laila {
    return Intl.message(
      'Dr.laila Al-Sharqawi',
      name: 'laila',
      desc: '',
      args: [],
    );
  }

  /// `Dermatologist`
  String get dermatologist {
    return Intl.message(
      'Dermatologist',
      name: 'dermatologist',
      desc: '',
      args: [],
    );
  }

  /// `Review`
  String get review {
    return Intl.message(
      'Review',
      name: 'review',
      desc: '',
      args: [],
    );
  }

  /// `Doctors`
  String get doctots {
    return Intl.message(
      'Doctors',
      name: 'doctots',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Chat`
  String get chat {
    return Intl.message(
      'Chat',
      name: 'chat',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get account {
    return Intl.message(
      'Account',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// `Chat Room`
  String get chatroom {
    return Intl.message(
      'Chat Room',
      name: 'chatroom',
      desc: '',
      args: [],
    );
  }

  /// `english`
  String get language {
    return Intl.message(
      'english',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get sign_in {
    return Intl.message(
      'Sign in',
      name: 'sign_in',
      desc: '',
      args: [],
    );
  }

  /// `E-mail`
  String get email {
    return Intl.message(
      'E-mail',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get Password {
    return Intl.message(
      'Password',
      name: 'Password',
      desc: '',
      args: [],
    );
  }

  /// `Forger Password ?`
  String get ForgerPassword {
    return Intl.message(
      'Forger Password ?',
      name: 'ForgerPassword',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with`
  String get sign_in_with {
    return Intl.message(
      'Sign in with',
      name: 'sign_in_with',
      desc: '',
      args: [],
    );
  }

  /// `Dont have an account?`
  String get Dont_have_an_account {
    return Intl.message(
      'Dont have an account?',
      name: 'Dont_have_an_account',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get sign_up {
    return Intl.message(
      'Sign Up',
      name: 'sign_up',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get Username {
    return Intl.message(
      'Username',
      name: 'Username',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get Phone {
    return Intl.message(
      'Phone',
      name: 'Phone',
      desc: '',
      args: [],
    );
  }

  /// `Do you have an account`
  String get do_you_have_an_account {
    return Intl.message(
      'Do you have an account',
      name: 'do_you_have_an_account',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
