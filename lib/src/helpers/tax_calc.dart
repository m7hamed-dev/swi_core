class CalTax {
  static double calTax(double price, double tax) => price * tax;
  static double calPriceWithTax(double price, double tax) =>
      price + calTax(price, tax);
}
