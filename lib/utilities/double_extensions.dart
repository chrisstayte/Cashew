extension DoubleExtension on double {
  String get currency =>
      this.toStringAsFixed(this.truncateToDouble() == this ? 0 : 2);
}
