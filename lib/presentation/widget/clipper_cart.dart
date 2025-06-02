// upside down

import 'package:flutter/widgets.dart';

class CustomShapeClipperUpside extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    // Move to the top-left corner
    path.moveTo(0, 0);

    // Draw the top line
    path.lineTo(size.width, 0);

    // Draw the right side
    path.lineTo(size.width, size.height);

    // Draw the bottom line, creating the pointed shape
    path.lineTo(size.width, size.height * 0.05);
    path.lineTo(0, size.height);

    // Close the path
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

//bottm
class MirroredCustomShapeClipperUpsideDown extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    // Move to the bottom-right corner
    path.moveTo(size.width, size.height);

    // Draw the bottom line
    path.lineTo(0, size.height);

    // Draw the left side
    path.lineTo(0, 0);

    // Draw the top line, creating the pointed shape
    path.lineTo(0, size.height * 0.95);
    path.lineTo(size.width, 0);

    // Close the path
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
