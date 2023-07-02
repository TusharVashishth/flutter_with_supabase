import 'package:intl/intl.dart';

String formatDateTime(String dateTimeString) {
  // Parse the MySQL date string
  DateTime dateTime = DateTime.parse(dateTimeString);

  // Define the date format you want
  DateFormat formatter = DateFormat('dd MMM yyyy');

  // Format the date
  String formattedDate = formatter.format(dateTime);

  return formattedDate;
}
