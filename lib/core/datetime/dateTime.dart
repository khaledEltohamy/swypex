// ignore_for_file: file_names, depend_on_referenced_packages

import 'package:intl/intl.dart';

class DateTimeHelper {
  static final timeFormat = DateFormat("hh:mm a");
  static final dateFormat = DateFormat("yyyy-MM-dd");
  static final dateFormatgeneral = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");

  static String getTimeFormatTimeZoneCase(String dateGMT) {
    DateTime dateTimeConverter = dateFormatgeneral.parse(dateGMT).toLocal();
    var dateTimeZoneOffset = dateTimeConverter.toLocal().timeZoneOffset * 0.5;
    DateTime dateTimeAddTimeZone = dateTimeConverter
        .add(Duration(hours: dateTimeZoneOffset.inHours, minutes: 30));
    String dateTimeFormat = timeFormat.format(dateTimeAddTimeZone);
    return dateTimeFormat;
  }

  static String getTimeFormat(String dateGMT) {
    var dateTime =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(dateGMT, true);
    var dateLocal = dateTime.toLocal();
    String timeLocaly = timeFormat.format(dateLocal);
    return timeLocaly;
  }

  static String getDateFormat(String dateGMT) {
    DateTime dateTimeConverter = dateFormat.parse(dateGMT);
    var dateTimeZoneOffset = dateTimeConverter.toLocal();
    String dateTimeFormat = dateFormat.format(dateTimeConverter);
    return dateTimeFormat;
  }

  static String timeZoneOffset(String dateGMT) {
    DateTime dateTimeConverter = dateFormat.parse(dateGMT);
    var dateTimeZoneOffset = dateTimeConverter.toLocal().timeZoneOffset;

    // int afterTimeZone =  dateTime_converter.hour - dateTimeZoneOffset.inHours;
    String dateTimeFormat = DateFormat("hh:mm a").format(dateTimeConverter);
    if (dateTimeZoneOffset.isNegative) {
      return "$dateTimeFormat-${dateTimeZoneOffset.inHours.toString().padLeft(2, '0')}:${(dateTimeZoneOffset.inMinutes - (dateTimeZoneOffset.inHours * 60)).toString().padLeft(2, '0')}";
    } else {
      return "$dateTimeFormat+${dateTimeZoneOffset.inHours.toString().padLeft(2, '0')}:${(dateTimeZoneOffset.inMinutes - (dateTimeZoneOffset.inHours * 60)).toString().padLeft(2, '0')}";
    }
  }
}
