import 'package:intl/intl.dart';

enum DateTimeFormat { dateTime, date, time, monthDay, api, dateOnly }

class DateUtil {
  DateUtil._();

  static String formatDatetime(DateTime date,
      {DateTimeFormat? format, String? newPattern}) {
    // return DateFormat(tr('datetime_format')).format(date);
    if (newPattern?.isNotEmpty ?? false) {
      return DateFormat(newPattern).format(date);
    }
    switch (format ?? DateTimeFormat.date) {
      case DateTimeFormat.dateTime:
        // return DateFormat(tr('datetime_format')).format(date);
        return DateFormat('HH:mm dd/MM/yyyy').format(date);
      case DateTimeFormat.date:
        // return DateFormat(tr('date_format')).format(date);
        return DateFormat('dd/MM/yyyy').format(date);
      case DateTimeFormat.monthDay:
        return DateFormat('dd/MM').format(date);
      case DateTimeFormat.time:
        // return DateFormat(tr('time_format')).format(date);
        return DateFormat('HH:mm').format(date);
      case DateTimeFormat.api:
        return DateFormat('yyyy-MM-dd').format(date);
      default:
        // return DateFormat(tr('date_format')).format(date);
        return DateFormat('dd/MM/yyyy').format(date);
    }
  }

  static formatText(String dateText, String inputPattern,
      {DateTimeFormat? format}) {
    try {
      var date = DateFormat(inputPattern).parse(dateText);
      switch (format ?? DateTimeFormat.date) {
        case DateTimeFormat.dateTime:
          // return DateFormat(tr('datetime_format')).format(date);
          return DateFormat('hh:mm dd/MM/yyyy').format(date);
        case DateTimeFormat.date:
          // return DateFormat(tr('date_format')).format(date);
          return DateFormat('dd/MM/yyyy').format(date);
        case DateTimeFormat.time:
          // return DateFormat(tr('time_format')).format(date);
          return DateFormat('hh:mm').format(date);
        default:
          // return DateFormat(tr('date_format')).format(date);
          return DateFormat('dd/MM/yyyy').format(date);
      }
    } catch (e) {
      return '';
    }
  }

  static formatDuration(int milliseconds, {DateTimeFormat? format}) {
    try {
      var date = DateTime.fromMillisecondsSinceEpoch(milliseconds * 1000);
      switch (format ?? DateTimeFormat.date) {
        case DateTimeFormat.dateTime:
          // return DateFormat(tr('datetime_format')).format(date);
          return DateFormat('dd/MM/yyyy HH:mmm').format(date);
        case DateTimeFormat.date:
          // return DateFormat(tr('date_format')).format(date);
          return DateFormat('dd/MM/yyyy').format(date);
        case DateTimeFormat.time:
          // return DateFormat(tr('time_format')).format(date);
          return DateFormat('HH:mm').format(date);
        default:
          // return DateFormat(tr('date_format')).format(date);
          return DateFormat('dd/MM/yyyy').format(date);
      }
    } catch (e) {
      return '';
    }
  }

  static DateTime? convertDatetime(String date, {DateTimeFormat? format}) {
    try {
      switch (format ?? DateTimeFormat.date) {
        case DateTimeFormat.dateTime:
          return DateFormat('hh:mmm dd/MM/yyyy').parse(date);
        case DateTimeFormat.date:
          return DateFormat('dd/MM/yyyy').parse(date);
        case DateTimeFormat.monthDay:
          return DateFormat('dd/MM').parse(date);
        case DateTimeFormat.time:
          return DateFormat('hh:mm').parse(date);
        case DateTimeFormat.api:
          return DateFormat('yyyy-MM-dd').parse(date);
        default:
          return DateFormat('dd/MM/yyyy').parse(date);
      }
    } catch (e) {
      return null;
    }
  }
}
