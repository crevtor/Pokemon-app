extension SharableDataExtension on Map<String, dynamic> {
  String toSharableString() {
    if (isEmpty) return "No data available";

    return entries
        .map((e) => "${e.key}: ${e.value ?? '-'}")
        .join("\n");
  }
}
