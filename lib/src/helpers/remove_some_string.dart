extension RemoveSomeString on String {
  String removeSomeString(int length) {
    if (length >= this.length) return this;
    return substring(0, length);
  }
}
