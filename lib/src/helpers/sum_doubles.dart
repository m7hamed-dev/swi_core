class SumDoubleList {
  static double sum(List<dynamic>? list) {
    try {
      if (list == null || list.isEmpty) return 0.0;
      return list.fold(0.0, (sum, value) {
        final number =
            (value is num)
                ? value.toDouble()
                : double.tryParse(value.toString()) ?? 0.0;
        return sum + number;
      });
    } catch (e) {
      return 0.0;
    }
  }
}
