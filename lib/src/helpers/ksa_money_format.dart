import 'package:intl/intl.dart';
import 'package:flutter/foundation.dart';
import 'package:swi_core/src/helpers/money_format.dart';

class KsaMoneyFormat implements MoneyFormat {
  @override
  String format(double price, {required bool isArabicPrice}) {
    try {
      if (isArabicPrice) {
        final formatter = NumberFormat.currency(locale: 'ar-SA', symbol: 'ر.س');
        return formatter.format(price);
      }
      final formatter = NumberFormat.currency(locale: 'en-SA', symbol: ' SR ');
      return formatter.format(price);
    } catch (e) {
      debugPrint('Exception while formatting price: $e');
      return '$price';
    }
  }
}
