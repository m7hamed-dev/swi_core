class SumStringList {
  static double sum(List<String>? list) {
    try {
      if (list == null || list.isEmpty) return 0.0;
      return list.fold(0.0, (sum, value) {
        final number = double.tryParse(value) ?? 0.0;
        return sum + number;
      });
    } catch (e) {
      return 0.0;
    }
  }
}
