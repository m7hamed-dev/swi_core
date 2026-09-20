class FixedPrice {
  static double toFlorPriceDouble(double price) {
    return double.parse(price.toStringAsFixed(2));
  }

  static String toFlorPrice(double price) => '${price.toStringAsFixed(2)} ر.س';
  static String toFlorPriceInt(int price) => '${price.toString()} ر.س';
}
