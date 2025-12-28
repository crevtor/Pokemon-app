import 'dart:ui';

import 'package:pokemon/core/resources/colors.res.dart';

extension ColorExtension on Color {
  Color parseHexColor(
      String? input, {
        Color fallback = white,
      }) {
    if (input == null) return fallback;
    var hex = input.trim();

    if (hex.isEmpty) return fallback;

    // Common prefixes cleanup
    if (hex.startsWith('#')) hex = hex.substring(1);
    if (hex.startsWith('0x')) hex = hex.substring(2);

    // Shorthand RGB (e.g. "abc" -> "aabbcc")
    if (hex.length == 3) {
      hex = hex.split('').map((c) => '$c$c').join();
    }

    // Accept 6 -> assume opaque (prepend 'ff')
    if (hex.length == 6) {
      hex = 'ff$hex';
    }

    // Now we expect 8 hex chars (AARRGGBB)
    if (hex.length != 8) return fallback;

    // Validate allowed characters quickly
    final valid = RegExp(r'^[0-9a-fA-F]{8}$');
    if (!valid.hasMatch(hex)) return fallback;

    try {
      final intVal = int.parse(hex, radix: 16);
      return Color(intVal);
    } catch (_) {
      return fallback;
    }
  }
}
