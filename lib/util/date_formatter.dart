import 'package:intl/intl.dart';

class DateFormatter {
  /// Formats to date only: "March 2, 2025"
  static String formatDateOnly(String originalJson) {
    try {
      final cleanedDate = originalJson.replaceAll(' ', '');
      final dateTime = DateTime.parse(cleanedDate);
      return DateFormat('MMMM d, y').format(dateTime);
    } catch (e) {
      return 'Date has yet to be determined';
    }
  }
}
