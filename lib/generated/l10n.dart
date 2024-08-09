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

  /// `Sign In`
  String get signIn {
    return Intl.message(
      'Sign In',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message(
      'Sign Up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `If you are`
  String get uAre {
    return Intl.message(
      'If you are',
      name: 'uAre',
      desc: '',
      args: [],
    );
  }

  /// `Executor`
  String get executor {
    return Intl.message(
      'Executor',
      name: 'executor',
      desc: '',
      args: [],
    );
  }

  /// `or`
  String get or {
    return Intl.message(
      'or',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `Beneficiary`
  String get beneficiary {
    return Intl.message(
      'Beneficiary',
      name: 'beneficiary',
      desc: '',
      args: [],
    );
  }

  /// `Click the button below`
  String get clickBelow {
    return Intl.message(
      'Click the button below',
      name: 'clickBelow',
      desc: '',
      args: [],
    );
  }

  /// `Notify Guardian`
  String get notifyGuardian {
    return Intl.message(
      'Notify Guardian',
      name: 'notifyGuardian',
      desc: '',
      args: [],
    );
  }

  /// `Access Area`
  String get accessArea {
    return Intl.message(
      'Access Area',
      name: 'accessArea',
      desc: '',
      args: [],
    );
  }

  /// `In this area is all the `
  String get accessContentPart1 {
    return Intl.message(
      'In this area is all the ',
      name: 'accessContentPart1',
      desc: '',
      args: [],
    );
  }

  /// `content`
  String get accessContentPart2 {
    return Intl.message(
      'content',
      name: 'accessContentPart2',
      desc: '',
      args: [],
    );
  }

  /// ` of the `
  String get accessContentPart3 {
    return Intl.message(
      ' of the ',
      name: 'accessContentPart3',
      desc: '',
      args: [],
    );
  }

  /// `Executor`
  String get accessContentPart4 {
    return Intl.message(
      'Executor',
      name: 'accessContentPart4',
      desc: '',
      args: [],
    );
  }

  /// ` or `
  String get accessContentPart5 {
    return Intl.message(
      ' or ',
      name: 'accessContentPart5',
      desc: '',
      args: [],
    );
  }

  /// `beneficiary`
  String get accessContentPart6 {
    return Intl.message(
      'beneficiary',
      name: 'accessContentPart6',
      desc: '',
      args: [],
    );
  }

  /// `Access Key`
  String get accessKey {
    return Intl.message(
      'Access Key',
      name: 'accessKey',
      desc: '',
      args: [],
    );
  }

  /// `Access`
  String get access {
    return Intl.message(
      'Access',
      name: 'access',
      desc: '',
      args: [],
    );
  }

  /// `Enter the `
  String get enterAccessKeyPart1 {
    return Intl.message(
      'Enter the ',
      name: 'enterAccessKeyPart1',
      desc: '',
      args: [],
    );
  }

  /// `access key`
  String get enterAccessKeyPart2 {
    return Intl.message(
      'access key',
      name: 'enterAccessKeyPart2',
      desc: '',
      args: [],
    );
  }

  /// ` that was sent to your `
  String get enterAccessKeyPart3 {
    return Intl.message(
      ' that was sent to your ',
      name: 'enterAccessKeyPart3',
      desc: '',
      args: [],
    );
  }

  /// `email`
  String get enterAccessKeyPart4 {
    return Intl.message(
      'email',
      name: 'enterAccessKeyPart4',
      desc: '',
      args: [],
    );
  }

  /// `.`
  String get enterAccessKeyPart5 {
    return Intl.message(
      '.',
      name: 'enterAccessKeyPart5',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Send verification code`
  String get sendVerificationCode {
    return Intl.message(
      'Send verification code',
      name: 'sendVerificationCode',
      desc: '',
      args: [],
    );
  }

  /// `User Details`
  String get userDetails {
    return Intl.message(
      'User Details',
      name: 'userDetails',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get emailAddress {
    return Intl.message(
      'Email Address',
      name: 'emailAddress',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get newPassword {
    return Intl.message(
      'New Password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm New Password`
  String get confirmNewPassword {
    return Intl.message(
      'Confirm New Password',
      name: 'confirmNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Create`
  String get create {
    return Intl.message(
      'Create',
      name: 'create',
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
      Locale.fromSubtags(languageCode: 'pt'),
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
