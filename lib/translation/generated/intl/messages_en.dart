// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(count) => "${count} days";

  static String m1(x) => "expired ${x} days ago";

  static String m2(x) => "expired in ${x} days";

  static String m3(count) => "${count} hours";

  static String m4(count) => "${count} minutes";

  static String m5(count) => "${count} day";

  static String m6(x) => "expired ${x} day ago";

  static String m7(x) => "expired in ${x} day";

  static String m8(count) => "${count} hour";

  static String m9(count) => "${count} minute";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "appName": MessageLookupByLibrary.simpleMessage("Pixaland"),
        "app_load_config_failed": MessageLookupByLibrary.simpleMessage(
            "- Please check your internet connection\n- Encountered technical issues - we are working to resolve\n\nWe apologize and try again later."),
        "appearance": MessageLookupByLibrary.simpleMessage("Appearance"),
        "button_add": MessageLookupByLibrary.simpleMessage("Add"),
        "button_cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "button_close": MessageLookupByLibrary.simpleMessage("Close"),
        "button_create": MessageLookupByLibrary.simpleMessage("Create"),
        "button_delete": MessageLookupByLibrary.simpleMessage("Delete"),
        "button_done": MessageLookupByLibrary.simpleMessage("Done"),
        "button_edit": MessageLookupByLibrary.simpleMessage("Edit"),
        "button_enable": MessageLookupByLibrary.simpleMessage("Enable"),
        "button_leave": MessageLookupByLibrary.simpleMessage("Leave"),
        "button_no": MessageLookupByLibrary.simpleMessage("No"),
        "button_no_thanks": MessageLookupByLibrary.simpleMessage("No, thanks!"),
        "button_ok": MessageLookupByLibrary.simpleMessage("Ok"),
        "button_resend": MessageLookupByLibrary.simpleMessage("Resend"),
        "button_retry": MessageLookupByLibrary.simpleMessage("Retry"),
        "button_save": MessageLookupByLibrary.simpleMessage("Save"),
        "button_settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "button_submit": MessageLookupByLibrary.simpleMessage("Submit"),
        "button_update": MessageLookupByLibrary.simpleMessage("Update"),
        "button_verify": MessageLookupByLibrary.simpleMessage("Verify"),
        "button_yes": MessageLookupByLibrary.simpleMessage("Yes"),
        "confirm": MessageLookupByLibrary.simpleMessage("Confirm"),
        "copied": MessageLookupByLibrary.simpleMessage("Copied"),
        "count_plural_day_": m0,
        "count_plural_day_expired_": m1,
        "count_plural_day_to_be_expired_": m2,
        "count_plural_hour_": m3,
        "count_plural_minute_": m4,
        "count_single_day_": m5,
        "count_single_day_expired_": m6,
        "count_single_day_to_be_expired_": m7,
        "count_single_hour_": m8,
        "count_single_minute_": m9,
        "dark": MessageLookupByLibrary.simpleMessage("Dark"),
        "error_unauthorized": MessageLookupByLibrary.simpleMessage(
            "System will be automatically logout! Please try again."),
        "expired_today": MessageLookupByLibrary.simpleMessage("expired today"),
        "gender_female": MessageLookupByLibrary.simpleMessage("Female"),
        "gender_male": MessageLookupByLibrary.simpleMessage("Male"),
        "gender_other": MessageLookupByLibrary.simpleMessage("Other"),
        "lang_english": MessageLookupByLibrary.simpleMessage("English"),
        "lang_khmer": MessageLookupByLibrary.simpleMessage("Khmer"),
        "language": MessageLookupByLibrary.simpleMessage("Language"),
        "light": MessageLookupByLibrary.simpleMessage("Light"),
        "load_data_failed": MessageLookupByLibrary.simpleMessage(
            "Requesting failure, please try again or check your internet connection."),
        "msg_check_your_internet_connection":
            MessageLookupByLibrary.simpleMessage(
                "Please check your internet connection and try again."),
        "real_time_date_format": MessageLookupByLibrary.simpleMessage(
            "EEEE, MMMM dd, yyyy | hh:mm:ss a"),
        "session_expired":
            MessageLookupByLibrary.simpleMessage("Session Expired"),
        "success": MessageLookupByLibrary.simpleMessage("Success!"),
        "system": MessageLookupByLibrary.simpleMessage("System"),
        "time_am": MessageLookupByLibrary.simpleMessage("AM"),
        "time_pm": MessageLookupByLibrary.simpleMessage("PM"),
        "title_error": MessageLookupByLibrary.simpleMessage("Error"),
        "title_no_internet_access":
            MessageLookupByLibrary.simpleMessage("No Internet Access")
      };
}
