import 'package:intl/intl.dart';

class DateTimeExtension {
  //chat page today, yesterday timestamp
  static String getTimeStamp(DateTime? date) {
    final date2 = DateTime.now();
    final difference = date2.difference(date!);
    final current = DateFormat('EEEE, d MMM, yyyy').format(date);
    final yesterday = DateFormat('EEEE, d MMM, yyyy')
        .format(DateTime(date2.year, date2.month, date2.day - 1));

    if ((difference.inDays / 7).floor() >= 1) {
      //return like Sun, 8 May
      String weekAgoDate = DateFormat('E, d MMM, yyyy').format(date);
      return weekAgoDate;
    } else if (yesterday == current) {
      return 'Yesterday';
    } else if (difference.inDays == 0) {
      return 'Today';
    } else {
      // return like Monday, Tuesday
      String day = DateFormat('EEEE').format(date);
      return day;
    }
  }

  static String timeAgo({bool numericDates = true, DateTime? date}) {
    final date2 = DateTime.now();
    final difference = date2.difference(date!);

    // print('difference-----${difference.inDays}');

    if ((difference.inDays / 7).floor() >= 1) {
      return (numericDates) ? '1 week ago' : 'last week';
    } else if (difference.inDays >= 2) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays >= 1) {
      return (numericDates) ? '1 day ago' : 'yesterday';
    } else if (difference.inHours >= 2) {
      return '${difference.inHours} hours ago';
    } else if (difference.inHours >= 1) {
      return (numericDates) ? '1 hour ago' : 'an hour ago';
    } else if (difference.inMinutes >= 2) {
      return '${difference.inMinutes} min ago';
    } else if (difference.inMinutes >= 1) {
      return (numericDates) ? '1 min ago' : 'a min ago';
    } else if (difference.inSeconds >= 3) {
      return '${difference.inSeconds} sec ago';
    } else {
      return 'just now';
    }
  }
}
