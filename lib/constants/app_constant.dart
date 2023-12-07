import 'package:pixaland/core/enum/language_enum.dart';

class AppConstant {
  static const String appName = 'Pixaland';
  static const String clientId = 'pixaland';
  static const String secretKey = '';

  // The year that the app is first published
  static const int copyRightYear = 2023;

  // Format Media ID
  static const String guid = '00000000-0000-0000-0000-000000000000';

  static const String defaultFont = 'Siemreap';
  static const List<String> primaryFonts = ['Siemreap'];

  // Local storage keys
  /// CAUTION: Change this key value, the app will wipe out all local storage at first run
  static const String wipeKey = 'sy5a8iWP';
  // Key used to save to local storage
  static const String dataWipeKey = 'wipe-key';

  static const String theme = 'theme';
  static const String langage = 'language';
  static const String credentials = 'credentials';
  static const String themeOptionKey = 'theme-options-key';
  static const String primaryColorKey = 'primary-color-key';

  // Default value
  static const LanguageEnum defaultLang = LanguageEnum.khmer;

  // OTP
  static const int otpTimeoutSeconds = 120;

  // Date format
  static const String defaultDateFormat = 'dd/MM/yyyy';
  static const String normalDateFormat = 'dd/MM/yyyy';
  static const String monthDateFormat = 'MM/yyyy';
  static const String dateTimeFormat = 'dd/MM/yyyy hh:mm a';
  static const String timeFormat = 'hh:mm a';
  static const String dobFormat = 'dd/MM/yyyy';
  static const String registeredFormat = 'dd/MM/yyyy hh:mm a';
  static const String publishedDateFormat = 'dd/MM/yyyy hh:mm a';
  static DateTime minDate = DateTime.parse("1900-01-01");
  static DateTime maxDate = DateTime.parse("2500-12-31");

  // Number format
  static const String decimalFormat = '#,##0.00;-#,##0.00;0.00';
  static const String noneDecimalFormat = '#,##0;-#,##0;0';

  static const double pieChartStartOffset = 0;
  static const String inlineSeparator = '•';
  static const bool isCurvedLineChart = false;
  static const int wrongPinAttemptLimit = 5;

  static const double defaultPadding = 120;

  //Space between textfield
  static const double horizontalSpacer = 20;
  static const double verticleSpacer = 10;
}
