import 'package:flutter/material.dart';


/// Converts a plain string color into a material color for UI usage.
///
/// Returns the corresponding [Color] object from the [Colors] class based on the provided [colorString].
/// If no matching color is found, it returns [Colors.transparent] as a fallback.
Color getColorFromString(String colorString) {
  switch (colorString.toLowerCase()) {
    case 'red':
      return Colors.red;
    case 'blue':
      return Colors.blue;
    case 'green':
      return Colors.green;
    case 'yellow':
      return Colors.yellow;
    case 'orange':
      return Colors.orange;
    case 'purple':
      return Colors.purple;
    case 'pink':
      return Colors.pink;
    case 'brown':
      return Colors.brown;
    case 'grey':
      return Colors.grey;
    case 'black':
      return Colors.black;
    case 'white':
      return Colors.white;
    default:
      return Colors.transparent;
  }
}