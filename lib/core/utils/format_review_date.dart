import 'package:intl/intl.dart';

String formatReviewDate(DateTime date) {
  print('the param date is: ${date.toString()}');
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final yesterday = today.subtract(const Duration(days: 1));
  
  if (date.isAfter(today)) {
    return 'Today';
  } else if (date.isAfter(yesterday)) {
    return 'Yesterday';
  } else {
    final formatter = DateFormat('dd MMM yyyy');
    return formatter.format(date);
  }
}