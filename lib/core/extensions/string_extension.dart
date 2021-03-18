extension StringExtension on String {
  String intelliTrim() {
    return this.length > 12 ? "${this.substring(0, 12)}..." : this;
  }
}
