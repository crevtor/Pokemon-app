import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DataTimeExtension on DateTime {
  String formatDate() {
    return DateFormat('MM/dd/yyyy').format(this);
  }
  String formatDateReadable() {
    return DateFormat('dd MMM, yyyy').format(this);
  }
  String formatDateReadableMonthFirst() {
    return DateFormat('MMM dd, yyyy').format(this);
  }

  //Friday, Jul 20
  String formatReadableWithTime() {
    final format =  DateFormat('EEEE, MMM dd').format(this);
    return '$format at ${formatTimeOnly()}';
  }

  String formatReadableWithTime1() {
    final format =  DateFormat('EEEE').format(this);
    return '${formatTimeOnly()} on $format';
  }

  String formatTimeOnly() {
    return DateFormat('').add_jm().format(this);
  }

  String formatDateReadable2() {
    if (isSameDay(DateTime.now())) {
      return 'Today';
    }
    if (DateTime.now().isYesterday(this)) {
      return 'Yesterday';
    }
    String suffix = "th";
    final digit = day % 10;
    if ((digit > 0 && digit < 4) && (day < 11 || day > 13)) {
      suffix = ["st", "nd", "rd"][digit - 1];
    }
    return DateFormat("d'$suffix' MMM, yyyy").format(this);
  }

  bool isSameDay(DateTime other) {
    return year == other.year &&
        month == other.month &&
        day == other.day;
  }

  bool isYesterday(DateTime other) {
    return year == other.year &&
        month == other.month &&
        day - other.day == 1;
  }
}

class FormatDateUtils {
  static String addLeadingZeroIfNeeded(int value) {
    if (value < 10) {
      return '0$value';
    }
    return value.toString();
  }

  static String addPreceedingZero(String data) {
    if (data.length == 1) {
      return "0$data";
    } else {
      return data;
    }
  }

  static String convertToMillionAbbr(String value) {
    var removeComma = value.split(",").join();
    if (removeComma.length <= 6) {
      return value;
    } else if (removeComma.length == 7) {
      if (num.tryParse(removeComma[2]) == 0) {
        return "${removeComma[0]}.${removeComma[1]}M";
      } else {
        return "${removeComma[0]}.${removeComma[1]}${removeComma[2]}M";
      }
    } else if (removeComma.length == 8) {
      return "${removeComma[0]}${removeComma[1]}.${removeComma[2]}M";
    } else if (removeComma.length == 9) {
      return "${removeComma[0]}${removeComma[1]}${removeComma[2]}.${removeComma[3]}M";
    } else if (removeComma.length == 10) {
      if (num.tryParse(removeComma[2]) == 0) {
        return "${removeComma[0]}.${removeComma[1]}B";
      } else {
        return "${removeComma[0]}.${removeComma[1]}${removeComma[2]}B";
      }
    } else if (removeComma.length == 11) {
      return "${removeComma[0]}${removeComma[1]}.${removeComma[2]}B";
    } else if (removeComma.length == 12) {
      return "${removeComma[0]}${removeComma[1]}${removeComma[2]}.${removeComma[3]}B";
    } else if (removeComma.length == 13) {
      return "${removeComma[0]}.${removeComma[1]}Tn";
    }

    return value;
  }

  static int daysBetween(DateTime from, DateTime to) {
    final a = DateTime(from.year, from.month, from.day);
    final b = DateTime(to.year, to.month, to.day);
    return b.difference(a).inDays;
  }

  static String daysBetweenToString(int differenceInDays) {
    if (differenceInDays == 0) return "Today";
    if (differenceInDays == 1) return "Yesterday";
    if (differenceInDays > 1) return "$differenceInDays days ago";

    // future (negative days)
    final futureDays = differenceInDays.abs();
    if (futureDays == 1) return "Tomorrow";
    return "In $futureDays days";
  }

  static String savingsEndsText({DateTime? endDate}) {
    if(endDate == null) {
      return '...';
    }
    final start = DateTime.now();
    final end = DateTime(endDate.year, endDate.month, endDate.day);

    final diffDays = end.difference(start).inDays;

    // Ended
    if (diffDays < 0) return 'Savings has ended';

    // Today
    if (diffDays == 0) return 'Savings end today';

    // Future
    if (diffDays > 0) {
      // Compute full months difference based on year/month and adjust if day-of-month not reached.
      int months = (end.year - start.year) * 12 + (end.month - start.month);
      if (end.day < start.day) months -= 1;

      if (months >= 1) {
        return months == 1
            ? 'Savings ends in 1 month'
            : 'Savings ends in $months months';
      } else {
        return diffDays == 1
            ? 'Savings ends in 1 day'
            : 'Savings ends in $diffDays days';
      }
    }

    // Past
    final pastDays = diffDays.abs();
    int monthsAgo = (start.year - end.year) * 12 + (start.month - end.month);
    if (start.day < end.day) monthsAgo -= 1;

    if (monthsAgo >= 1) {
      return monthsAgo == 1
          ? 'Savings ended 1 month ago'
          : 'Savings ended $monthsAgo months ago';
    } else {
      return pastDays == 1
          ? 'Savings ended 1 day ago'
          : 'Savings ended $pastDays days ago';
    }
  }

  static String timeToGoText({DateTime? from, bool preferMonths = true}) {
    if(from == null) {
      return '...';
    }
    final start = DateTime.now();
    final end = DateTime(from.year, from.month, from.day);

    final diffDays = end.difference(start).inDays;

    // Today
    if (diffDays == 0) return 'Today';

    // Future
    if (diffDays > 0) {
      if (preferMonths) {
        int months = (end.year - start.year) * 12 + (end.month - start.month);
        if (end.day < start.day) months -= 1;
        if (months >= 1) {
          return months == 1 ? '1 month to go' : '$months months to go';
        }
      }

      // fallback to days
      return diffDays == 1 ? '1 day to go' : '$diffDays days to go';
    }

    // Past
    final pastDays = diffDays.abs();
    if (preferMonths) {
      int monthsAgo =
          (start.year - end.year) * 12 + (start.month - end.month);
      if (start.day < end.day) monthsAgo -= 1;
      if (monthsAgo >= 1) {
        return monthsAgo == 1
            ? 'Ended 1 month ago'
            : 'Ended $monthsAgo months ago';
      }
    }

    return pastDays == 1 ? 'Ended 1 day ago' : 'Ended $pastDays days ago';
  }

  static String friendlyHeaderForDay(DateTime day, DateTime now) {
    final d = DateTime(now.year, now.month, now.day);
    final dayOnly = DateTime(day.year, day.month, day.day);
    if (dayOnly == d) return 'Today';
    final yesterday = d.subtract(const Duration(days: 1));
    if (dayOnly == yesterday) return 'Yesterday';
    // fallback: format as "MMM d, yyyy" without intl:
    final month = shortMonth(dayOnly.month);
    return '$month ${dayOnly.day}, ${dayOnly.year}';
  }

  static String shortMonth(int month) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return months[month - 1];
  }

  static String getDayString(int value) {
    if (value == 1) {
      return 'Monday';
    }
    if (value == 2) {
      return 'Tuesday';
    }
    if (value == 3) {
      return 'Wednesday';
    }
    if (value == 4) {
      return 'Thurday';
    }
    if (value == 5) {
      return 'Friday';
    }
    if (value == 6) {
      return 'Saturday';
    }
    if (value == 7) {
      return 'Sunday';
    }

    return value.toString();
  }

  static String getDayStringAbbr(int value) {
    if (value == 1) {
      return 'Mon';
    }
    if (value == 2) {
      return 'Tue';
    }
    if (value == 3) {
      return 'Wed';
    }
    if (value == 4) {
      return 'Thu';
    }
    if (value == 5) {
      return 'Fri';
    }
    if (value == 6) {
      return 'Sat';
    }
    if (value == 7) {
      return 'Sun';
    }

    return value.toString();
  }

  static String getDayStringSec(int value) {
    if (value == 1) {
      return 'Mon';
    }
    if (value == 2) {
      return 'Tue';
    }
    if (value == 3) {
      return 'Wed';
    }
    if (value == 4) {
      return 'Thur';
    }
    if (value == 5) {
      return 'Fri';
    }
    if (value == 6) {
      return 'Sat';
    }
    if (value == 7) {
      return 'Sun';
    }

    return value.toString();
  }

  static String getDayWithSuffix(num time) {
    String timeString = time.toString();
    if (timeString.endsWith("1")) {
      return "${time}st";
    } else if (timeString.endsWith("2")) {
      return "${time}nd";
    } else if (timeString.endsWith("3")) {
      return "${time}rd";
    } else {
      return "${time}th";
    }
  }

  static String ordinal(int number) {
    if (number >= 11 && number <= 13) {
      return 'th';
    }

    switch (number % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }

  static String getMonthStringFull(int value) {
    if (value == 1) {
      return 'Jan';
    }
    if (value == 2) {
      return 'Feb';
    }
    if (value == 3) {
      return 'Mar';
    }
    if (value == 4) {
      return 'Apr';
    }
    if (value == 5) {
      return 'May';
    }
    if (value == 6) {
      return 'Jun';
    }
    if (value == 7) {
      return 'Jul';
    }
    if (value == 8) {
      return 'Aug';
    }
    if (value == 9) {
      return 'Sep';
    }
    if (value == 10) {
      return 'Oct';
    }
    if (value == 11) {
      return 'Nov';
    }
    if (value == 12) {
      return 'Dec';
    }
    return value.toString();
  }

  static String getMonthStringFull2(int value) {
    if (value == 1) {
      return 'January';
    }
    if (value == 2) {
      return 'February';
    }
    if (value == 3) {
      return 'March';
    }
    if (value == 4) {
      return 'April';
    }
    if (value == 5) {
      return 'May';
    }
    if (value == 6) {
      return 'June';
    }
    if (value == 7) {
      return 'July';
    }
    if (value == 8) {
      return 'August';
    }
    if (value == 9) {
      return 'September';
    }
    if (value == 10) {
      return 'October';
    }
    if (value == 11) {
      return 'November';
    }
    if (value == 12) {
      return 'December';
    }
    return value.toString();
  }

  static String getMonthStringSemi(int value) {
    if (value == 1) {
      return 'Jan';
    }
    if (value == 2) {
      return 'Feb';
    }
    if (value == 3) {
      return 'Mar';
    }
    if (value == 4) {
      return 'Apr';
    }
    if (value == 5) {
      return 'May';
    }
    if (value == 6) {
      return 'Jun';
    }
    if (value == 7) {
      return 'Jul';
    }
    if (value == 8) {
      return 'Aug';
    }
    if (value == 9) {
      return 'Sep';
    }
    if (value == 10) {
      return 'Oct';
    }
    if (value == 11) {
      return 'Nov';
    }
    if (value == 12) {
      return 'Dec';
    }
    return value.toString();
  }

  static String getReadableDate(DateTime time) {
    return "${getDayString(time.weekday)}, ${addLeadingZeroIfNeeded(time.day)} ${getMonthStringFull(time.month)}";
  }

  static String getReadableDate20(DateTime time) {
    return "${getMonthStringFull(time.month)}. ${getDayString(time.day)}, ${addLeadingZeroIfNeeded(time.year)}";
  }

  static String getReadableDate28(BuildContext context, DateTime time) {
    return "${getMonthStringFull(time.month)}. ${getDayString(time.day)}, ${TimeOfDay.fromDateTime(time).format(context)}";
  }

  static String getReadableDate29(DateTime? time) {
    if(time == null) return '...';
    return "${time.day}${ordinal(time.day)} ${getMonthStringFull(time.month)}, ${time.year}";
  }

  static String getReadableDate299(BuildContext context, DateTime time) {
    return "${DateFormat('').add_jm().format(time)} on ${getDayString(time.weekday)} ${time.day}${ordinal(time.day)} ${getMonthStringFull2(time.month)}";
  }

  static String getReadableDate30(DateTime? time) {
    if(time == null) return '...';
    return "${friendlyHeaderForDay(time, DateTime.now())}, ${DateFormat('').add_jm().format(time).toString().toLowerCase()}";
  }

  static String getReadableDate33(DateTime? time) {
    if(time == null) return '...';
    return "${friendlyHeaderForDay(time, DateTime.now())} at ${DateFormat('').add_jm().format(time).toString().toUpperCase()}";
  }

  static String getReadableDate31(DateTime? time) {
    if(time == null) return '...';
    return "${time.year}/${time.month}/${time.day} ${DateFormat('').add_jms().format(time).toString().toLowerCase()}";
  }

  static String getMonthFromDate(DateTime time) {
    return getMonthStringFull(time.month);
  }

  static String getDayFromDate(DateTime time) {
    return getDayStringAbbr(time.weekday);
  }

  static String getReadableDate2(DateTime time) {
    return "${getMonthStringSemi(time.month)} ${addLeadingZeroIfNeeded(time.day)} ${time.year}";
  }

  static String getReadableDate19(DateTime time) {
    return "${getDayWithSuffix(time.day)} ${getMonthStringFull2(time.month)}, ${time.year}";
  }

  static String getReadableDate39(DateTime time) {
    return "${getDayWithSuffix(time.day)} ${getMonthStringSemi(time.month)}, ${time.year}";
  }

  static DateTime getEndDate(int daysAdded) {
    DateTime currentTime = DateTime.now();
    DateTime newDateTime = currentTime.add(Duration(days: daysAdded));
    return newDateTime;
  }

  static String getEndDateFormat(DateTime endDate) {
    return "${getMonthStringSemi(endDate.month)} ${addLeadingZeroIfNeeded(endDate.day)}, ${endDate.year}";
  }

  static String getTimelineDateFormat(DateTime time) {
    return "${getMonthStringSemi(time.month)} ${addLeadingZeroIfNeeded(time.day)}, ${time.year}  ${DateFormat.jm().format(DateFormat("hh:mm:ss").parse("${addLeadingZeroIfNeeded(time.hour)}:${addLeadingZeroIfNeeded(time.minute)}:${addLeadingZeroIfNeeded(time.second)}"))}";
  }

  static String getTimelineDateFormat2(DateTime time) {
    return "${getMonthStringSemi(time.month)} ${addLeadingZeroIfNeeded(time.day)}, ${time.year}  ${DateFormat.jm().format(DateFormat("hh:mm:ss").parse("${addLeadingZeroIfNeeded(time.hour)}:${addLeadingZeroIfNeeded(time.minute)}:${addLeadingZeroIfNeeded(time.second)}"))}";
  }

  static String getAutoReminderDateFormat(DateTime date) {
    return "${getDayWithSuffix(date.day)} ${getMonthStringSemi(date.month)}, ${date.year} at ${getReadableDate3(date)}";
  }

  static String getReadableDate3(DateTime time) {
    return DateFormat.jm().format(DateFormat("hh:mm:ss").parse("${addLeadingZeroIfNeeded(time.hour)}:${addLeadingZeroIfNeeded(time.minute)}:${addLeadingZeroIfNeeded(time.second)}"));
  }

  static String getReadableDate4(DateTime time) {
    return addLeadingZeroIfNeeded(time.weekday);
  }

  static String getReadableDate10(DateTime time) {
    return addLeadingZeroIfNeeded(time.hour);
  }

  static String getReadableDate5(DateTime time) {
    var now = DateTime.now();
    if (time.year != now.year) {
      return "${addLeadingZeroIfNeeded(time.day)} ${getMonthStringSemi(time.month)} ${time.year}";
    } else {
      return "${addLeadingZeroIfNeeded(time.day)} ${getMonthStringSemi(time.month)}";
    }
  }

  static String getReadableDate6(DateTime time) {
    return "${getMonthStringSemi(time.month)} ${addLeadingZeroIfNeeded(time.day)}";
  }

  static String getReadableDate60(DateTime time) {
    return "${getMonthStringFull2(time.month)} ${time.year}";
  }

  static String getReadableTime(DateTime date) {
    var time = TimeOfDay.fromDateTime(date);

    if (date.hour == 12 || date.hour == 0) {
      var timeString = "12"
          ":${addPreceedingZero(time.minute.toString())}"
          "${time.period == DayPeriod.pm ? ' PM' : ' AM'}";
      return timeString;
    } else {
      var timeString = "${addPreceedingZero(time.hourOfPeriod.toString())}"
          ":${addPreceedingZero(time.minute.toString())}"
          "${time.period == DayPeriod.pm ? ' PM' : ' AM'}";
      return timeString;
    }
  }

  static String getWeekday(int weekday) {
    String weekdayToString = "";
    switch (weekday) {
      case 1:
        weekdayToString = "Mon";
        break;
      case 2:
        weekdayToString = "Tue";
        break;
      case 3:
        weekdayToString = "Wed";
        break;
      case 4:
        weekdayToString = "Thu";
        break;
      case 5:
        weekdayToString = "Fri";
        break;
      case 6:
        weekdayToString = "Sat";
        break;
      case 7:
        weekdayToString = "Sun";
        break;
    }
    return weekdayToString;
  }

  static bool isSuccessStatusCode(int code) {
    return code <= 200 && 209 >= code;
  }
}

extension DurationUtils on int {
  Duration seconds() {
    return Duration(seconds: this);
  }
}
