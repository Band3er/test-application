import 'package:flutter/material.dart';

/// Utility class for color-related operations.
class ColorUtils {
  static const int _hexRadix = 16;
  static const int _rgbHexLength = 6;
  static const int _rgbMask = 0xFFFFFF;

  /// Converts a [Color] to a hexadecimal string in the format RRGGBB.
  static String hexFromColor(Color color) {
    final int rgb = color.toARGB32() & _rgbMask;

    return rgb
        .toRadixString(_hexRadix)
        .padLeft(_rgbHexLength, '0')
        .toUpperCase();
  }
}
