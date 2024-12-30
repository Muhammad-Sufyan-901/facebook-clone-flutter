import 'package:intl/intl.dart';

abstract class CurrencyFormatter {
  static String convertToIdr(
    dynamic number, {
    int decimalDigit = 2,
  }) {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: decimalDigit,
    );

    return currencyFormatter.format(number);
  }
}
