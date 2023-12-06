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

  /// `Pixaland`
  String get appName {
    return Intl.message(
      'Pixaland',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get button_yes {
    return Intl.message(
      'Yes',
      name: 'button_yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get button_no {
    return Intl.message(
      'No',
      name: 'button_no',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get button_ok {
    return Intl.message(
      'Ok',
      name: 'button_ok',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get button_cancel {
    return Intl.message(
      'Cancel',
      name: 'button_cancel',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get button_close {
    return Intl.message(
      'Close',
      name: 'button_close',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get button_retry {
    return Intl.message(
      'Retry',
      name: 'button_retry',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get button_settings {
    return Intl.message(
      'Settings',
      name: 'button_settings',
      desc: '',
      args: [],
    );
  }

  /// `No, thanks!`
  String get button_no_thanks {
    return Intl.message(
      'No, thanks!',
      name: 'button_no_thanks',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get button_update {
    return Intl.message(
      'Update',
      name: 'button_update',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get button_done {
    return Intl.message(
      'Done',
      name: 'button_done',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get button_submit {
    return Intl.message(
      'Submit',
      name: 'button_submit',
      desc: '',
      args: [],
    );
  }

  /// `Create`
  String get button_create {
    return Intl.message(
      'Create',
      name: 'button_create',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get button_verify {
    return Intl.message(
      'Verify',
      name: 'button_verify',
      desc: '',
      args: [],
    );
  }

  /// `Resend`
  String get button_resend {
    return Intl.message(
      'Resend',
      name: 'button_resend',
      desc: '',
      args: [],
    );
  }

  /// `Enable`
  String get button_enable {
    return Intl.message(
      'Enable',
      name: 'button_enable',
      desc: '',
      args: [],
    );
  }

  /// `Leave`
  String get button_leave {
    return Intl.message(
      'Leave',
      name: 'button_leave',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get button_save {
    return Intl.message(
      'Save',
      name: 'button_save',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get button_edit {
    return Intl.message(
      'Edit',
      name: 'button_edit',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get button_delete {
    return Intl.message(
      'Delete',
      name: 'button_delete',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get button_add {
    return Intl.message(
      'Add',
      name: 'button_add',
      desc: '',
      args: [],
    );
  }

  /// `Khmer`
  String get lang_khmer {
    return Intl.message(
      'Khmer',
      name: 'lang_khmer',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get lang_english {
    return Intl.message(
      'English',
      name: 'lang_english',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get gender_female {
    return Intl.message(
      'Female',
      name: 'gender_female',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get gender_male {
    return Intl.message(
      'Male',
      name: 'gender_male',
      desc: '',
      args: [],
    );
  }

  /// `Other`
  String get gender_other {
    return Intl.message(
      'Other',
      name: 'gender_other',
      desc: '',
      args: [],
    );
  }

  /// `Appearance`
  String get appearance {
    return Intl.message(
      'Appearance',
      name: 'appearance',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `System`
  String get system {
    return Intl.message(
      'System',
      name: 'system',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get light {
    return Intl.message(
      'Light',
      name: 'light',
      desc: '',
      args: [],
    );
  }

  /// `Dark`
  String get dark {
    return Intl.message(
      'Dark',
      name: 'dark',
      desc: '',
      args: [],
    );
  }

  /// `EEEE, MMMM dd, yyyy | hh:mm:ss a`
  String get real_time_date_format {
    return Intl.message(
      'EEEE, MMMM dd, yyyy | hh:mm:ss a',
      name: 'real_time_date_format',
      desc: '',
      args: [],
    );
  }

  /// `Success!`
  String get success {
    return Intl.message(
      'Success!',
      name: 'success',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `AM`
  String get time_am {
    return Intl.message(
      'AM',
      name: 'time_am',
      desc: '',
      args: [],
    );
  }

  /// `PM`
  String get time_pm {
    return Intl.message(
      'PM',
      name: 'time_pm',
      desc: '',
      args: [],
    );
  }

  /// `No Internet Access`
  String get title_no_internet_access {
    return Intl.message(
      'No Internet Access',
      name: 'title_no_internet_access',
      desc: '',
      args: [],
    );
  }

  /// `Please check your internet connection and try again.`
  String get msg_check_your_internet_connection {
    return Intl.message(
      'Please check your internet connection and try again.',
      name: 'msg_check_your_internet_connection',
      desc: '',
      args: [],
    );
  }

  /// `System will be automatically logout! Please try again.`
  String get error_unauthorized {
    return Intl.message(
      'System will be automatically logout! Please try again.',
      name: 'error_unauthorized',
      desc: '',
      args: [],
    );
  }

  /// `Session Expired`
  String get session_expired {
    return Intl.message(
      'Session Expired',
      name: 'session_expired',
      desc: '',
      args: [],
    );
  }

  /// `expired {x} day ago`
  String count_single_day_expired_(Object x) {
    return Intl.message(
      'expired $x day ago',
      name: 'count_single_day_expired_',
      desc: '',
      args: [x],
    );
  }

  /// `expired {x} days ago`
  String count_plural_day_expired_(Object x) {
    return Intl.message(
      'expired $x days ago',
      name: 'count_plural_day_expired_',
      desc: '',
      args: [x],
    );
  }

  /// `expired in {x} day`
  String count_single_day_to_be_expired_(Object x) {
    return Intl.message(
      'expired in $x day',
      name: 'count_single_day_to_be_expired_',
      desc: '',
      args: [x],
    );
  }

  /// `expired in {x} days`
  String count_plural_day_to_be_expired_(Object x) {
    return Intl.message(
      'expired in $x days',
      name: 'count_plural_day_to_be_expired_',
      desc: '',
      args: [x],
    );
  }

  /// `{count} day`
  String count_single_day_(Object count) {
    return Intl.message(
      '$count day',
      name: 'count_single_day_',
      desc: '',
      args: [count],
    );
  }

  /// `{count} days`
  String count_plural_day_(Object count) {
    return Intl.message(
      '$count days',
      name: 'count_plural_day_',
      desc: '',
      args: [count],
    );
  }

  /// `{count} hour`
  String count_single_hour_(Object count) {
    return Intl.message(
      '$count hour',
      name: 'count_single_hour_',
      desc: '',
      args: [count],
    );
  }

  /// `{count} hours`
  String count_plural_hour_(Object count) {
    return Intl.message(
      '$count hours',
      name: 'count_plural_hour_',
      desc: '',
      args: [count],
    );
  }

  /// `{count} minute`
  String count_single_minute_(Object count) {
    return Intl.message(
      '$count minute',
      name: 'count_single_minute_',
      desc: '',
      args: [count],
    );
  }

  /// `{count} minutes`
  String count_plural_minute_(Object count) {
    return Intl.message(
      '$count minutes',
      name: 'count_plural_minute_',
      desc: '',
      args: [count],
    );
  }

  /// `Copied`
  String get copied {
    return Intl.message(
      'Copied',
      name: 'copied',
      desc: '',
      args: [],
    );
  }

  /// `expired today`
  String get expired_today {
    return Intl.message(
      'expired today',
      name: 'expired_today',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get title_error {
    return Intl.message(
      'Error',
      name: 'title_error',
      desc: '',
      args: [],
    );
  }

  /// `- Please check your internet connection\n- Encountered technical issues - we are working to resolve\n\nWe apologize and try again later.`
  String get app_load_config_failed {
    return Intl.message(
      '- Please check your internet connection\n- Encountered technical issues - we are working to resolve\n\nWe apologize and try again later.',
      name: 'app_load_config_failed',
      desc: '',
      args: [],
    );
  }

  /// `Requesting failure, please try again or check your internet connection.`
  String get load_data_failed {
    return Intl.message(
      'Requesting failure, please try again or check your internet connection.',
      name: 'load_data_failed',
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
      Locale.fromSubtags(languageCode: 'km'),
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
