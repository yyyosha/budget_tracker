import 'package:intl/intl.dart';

class Parser {
  static String doubleToString(double val, {format = false}) {
    final formatter = NumberFormat.compact(
      locale: "en_US",
      explicitSign: false,
    );
    return (format && val > 1000 ? formatter.format(val) : val)
        .toString()
        .replaceAll(RegExp(r"([.]*0+)(?!.*\d)"), '');
  }
}
