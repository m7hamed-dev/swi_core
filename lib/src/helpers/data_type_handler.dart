import 'package:swi_core/src/helpers/fixed.dart';

class Price {
  static double toPriceDouble(dynamic price) {
    if (price == null) return 0.0;
    if (price is double) return FixedPrice.toFlorPriceDouble(price);
    if (price is int) return FixedPrice.toFlorPriceDouble(price.toDouble());
    if (price is String) {
      return FixedPrice.toFlorPriceDouble(double.tryParse(price) ?? 0.0);
    }
    return -00000.0;
  }
}

class DoubleHandler {
  static double toDouble(dynamic value) {
    if (value is double) return value;
    if (value == null) return 0.0;
    if (value is int) return value.toDouble();
    return double.tryParse(value.toString()) ?? 0.0;
  }
}

class Boolean {
  static bool toBool(dynamic value) {
    if (value is bool) return value;
    if (value == null) return false;
    if (value is int) return value == 1;

    return {'true', '1', 'yes'}.contains(value.toString().toLowerCase());
  }
}

class Integer {
  static int toInt(dynamic value) {
    if (value is int) return value;
    if (value == null) return 0;
    if (value is double) return value.toInt();
    return int.tryParse(value.toString()) ?? 0;
  }
}

class StringHandler {
  static String toPriceString(dynamic value) {
    return value?.toString() ?? '0.0';
  }
}
