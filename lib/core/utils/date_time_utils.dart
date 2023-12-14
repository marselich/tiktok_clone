import 'package:intl/intl.dart';

class DateTimeUtils {
  static String getShortDateTime(int dateTimeSinceEpoch) {
    final date = DateTime.fromMillisecondsSinceEpoch(dateTimeSinceEpoch);
    final dateNow = DateTime.now();
    final dateDifference = dateNow.difference(date);

    final format = DateFormat("d/M");
    if (dateDifference.inDays == 0) {
      if (dateDifference.inHours == 0) {
        if (dateDifference.inMinutes == 0) {
          return "Now";
        } else {
          return "${dateDifference.inMinutes}m";
        }
      } else {
        return "${dateDifference.inHours}h";
      }
    } else {
      return format.format(date);
    }
  }
}
