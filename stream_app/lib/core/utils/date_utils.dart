import 'package:intl/intl.dart';

String formatDate(String date) {
  try {
    final parsedDate = DateTime.parse(date);
    return DateFormat('MMM dd, yyyy').format(parsedDate);
  } catch (e) {
    return date;
  }
}
