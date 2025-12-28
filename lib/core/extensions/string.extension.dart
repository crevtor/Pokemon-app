import 'dart:ui';

extension StringExtension on String {
  bool isEqual(String content) {
    return this == content;
  }

  String get capitalize =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  String get capitalizeFirstOfEachWord => replaceAll(RegExp(' +'), ' ')
      .split(" ")
      .map((str) => str.capitalize)
      .join(" ");

  String asteriskContent([int start = 4, int end = 9]) {
    // var list = [for(var i=start; i<(end - start); i+=1) i];
    String result = '';
    try {
      result = replaceRange(start, end, "*****");
    } catch (error) {
      result = this;
    }
    return result ?? this;
  }

  String get nullToEmpty {
    return this;
  }

  String get getInitial {
    if (nullToEmpty.isEmpty) return '';
    final List<String> words = trim().split(' ');
    String initials = '';
    int initialsCount = 0;
    for (final word in words) {
      if (word.isNotEmpty && initialsCount < 2) {
        initials += word[0];
        initialsCount++;
      }
    }
    return initials.toUpperCase();
  }

  Color get textBGColor {
    const List<Color> colorCodes = [
      Color(0xFF926BE5), // Medium Gray
      Color(0xFFD65B5B), // Dark Gray
    ];
    final index = getInitial.hashCode % colorCodes.length;
    return colorCodes[index];
  }

  List<int> toIntList({String separator = ','}) {
    if (trim().isEmpty) return [];

    return split(separator)
        .map((e) => int.tryParse(e.trim()))
        .whereType<int>() // filters out nulls
        .toList();
  }

  List<int> toDigitList() {
    if (trim().isEmpty) return [];

    return runes
        .map((e) => int.tryParse(String.fromCharCode(e)))
        .whereType<int>()
        .toList();
  }
}

String getFormattedFirstName(String? fullName) {
  if (fullName == null || fullName.trim().isEmpty) return '';
  final first = fullName.trim().split(' ').first;
  if (first.isEmpty) return '';
  return '${first[0].toUpperCase()}${first.substring(1).toLowerCase()}';
}

String getNameFromRoute(String path) {
  String name = path.split('/').last;
  if(name.isEmpty) {
    name = path;
  }
  return name;
}

bool isADashboardRoute(String path) {
  return path.trim().startsWith('/dashboard');
}

String extractCleanPath(String messyUrl) {
  // First decode the URL-encoded parts
  String decoded = Uri.decodeFull(messyUrl);

  // Then trim spaces and unwanted leading characters like '=>'
  decoded = decoded.trim();

  // Find the actual path start
  int pathStart = decoded.indexOf('/dashboard');
  if (pathStart != -1) {
    return decoded.substring(pathStart);
  }

  // Fallback if '/dashboard' not found
  return decoded;
}
