import 'package:intl/intl.dart';

extension DateExtension on DateTime {
  static DateTime fromTimeString(String timeString) {
    final timeFormat = DateFormat('MM/dd/yyyy hh:mm a');
    final time = timeFormat.parse(timeString);
    return time;
  }
}
