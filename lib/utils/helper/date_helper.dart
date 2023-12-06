import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pixaland/config/routes/application.dart';
import 'package:pixaland/constants/app_constant.dart';
import 'package:pixaland/core/enum/language_enum.dart';
import 'package:pixaland/translation/generated/l10n.dart';

class DateHelper {
  static DateTime calendarFirstDate() {
    final today = DateTime.now();
    return DateTime(today.year - 100, 1, 1);
  }

  static DateTime calendarLastDate() {
    return DateTime.now();
  }

  static String? formatDate(
    DateTime? date, [
    String pattern = AppConstant.normalDateFormat,
    Locale? locale,
  ]) {
    if (date == null) return null;
    final language = Application.appBloc.state.language;
    final userLocale = language.getLocale();
    final loc = locale?.toString() ?? userLocale.toString();
    final formatedDate = DateFormat(pattern, loc).format(date);
    final splits = formatedDate.trim().split(' ');
    if (['AM', 'PM'].contains(splits.last)) {
      splits[splits.length - 1] = splits.last
          .replaceAll('AM', S.current.time_am)
          .replaceAll('PM', S.current.time_pm);
      return splits.join(' ');
    }
    return formatedDate;
  }

  /// Return pair of quarter as array
  /// Index 0 => start month
  /// Index 1 => end month
  static List<DateTime> getQuarterPair(DateTime date) {
    final pairs = [
      [1, 3],
      [4, 6],
      [7, 9],
      [10, 12]
    ];
    final months =
        pairs.firstWhere((p) => date.month >= p[0] && date.month <= p[1]);
    return [
      DateTime(date.year, months.first),
      DateTime(date.year, months.last)
    ];
  }

  /// Checks if two DateTime objects are the same day.
  /// Returns `false` if either of them is null.
  static bool isSameDay(DateTime? a, DateTime? b) {
    if (a == null || b == null) {
      return false;
    }

    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  static List<DateTime> getMonthsInRange(DateTime? fromDate, DateTime? toDate) {
    if (fromDate == null || toDate == null) return [];
    // save day of from date
    var daysInFromDate = fromDate.day;
    List<DateTime> monthsInRange = [DateTime(fromDate.year, fromDate.month)];

    // get a list of months between 2 dates (without days)
    while (fromDate!.isBefore(DateTime(toDate.year, toDate.month - 1))) {
      var newFrom = DateTime(fromDate.year, fromDate.month + 1);
      monthsInRange.add(newFrom);
      fromDate = newFrom;
    }

    // iterate months
    return monthsInRange.map((month) {
      final lastDayOfMonths = lastDayOfMonth(month);
      // if the day of the from date is < then the day of the last day of the month using the daysInFromDate
      if (daysInFromDate < lastDayOfMonths.day) {
        return DateTime(month.year, month.month, daysInFromDate);
      }
      // else save the last day of the month (means that the month has less days)
      return lastDayOfMonths;
    }).toList();
  }

  /// The last day of a given month
  static DateTime lastDayOfMonth(DateTime month) {
    var beginningNextMonth = (month.month < 12)
        ? DateTime(month.year, month.month + 1, 1)
        : DateTime(month.year + 1, 1, 1);
    return beginningNextMonth.subtract(const Duration(days: 1));
  }

  static String dateToShortDateStr(DateTime? date,
      {bool isMinDateCastToNow = true}) {
    if (date == null) {
      return DateFormat("dd/MM/yyyy").format(AppConstant.minDate);
    }
    if (date == AppConstant.minDate && isMinDateCastToNow) {
      return DateFormat("dd/MM/yyyy").format(DateTime.now());
    }

    String formattedDate = DateFormat("dd/MM/yyyy").format(date);
    return formattedDate;
  }

  static String dateToFullDateTimeStr(DateTime? date) {
    if (date == null) return "";
    String formattedDate = DateFormat("dd/MM/yyyy hh:mm a").format(date);
    final a = formattedDate.split(" ").last;
    final translatedA =
        a.toLowerCase() == "am" ? S.current.time_am : S.current.time_pm;
    return formattedDate.replaceAll(a, translatedA);
  }

  static DateTime strToShortDate({required String date}) {
    var result = DateTime.parse(date);

    //DateFormat("dd/MM/yyyy").parse(date);
    return result;
  }
}
