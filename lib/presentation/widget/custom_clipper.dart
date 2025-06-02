import 'package:flutter/material.dart';

//

class CustomContainerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final roundnesFactor = 20.0;

    path.moveTo(0, size.height * 0.33);
    path.lineTo(0, size.height - roundnesFactor);

    path.quadraticBezierTo(0, size.height, roundnesFactor, size.height);

    path.lineTo(size.width - roundnesFactor, size.height);
    path.quadraticBezierTo(
      size.width,
      size.height,
      size.width,
      size.height - roundnesFactor,
    );

    path.lineTo(size.width, roundnesFactor * 2);

    path.quadraticBezierTo(
      size.width,
      0,
      size.width - roundnesFactor * 3,
      roundnesFactor * 2,
    );
    path.lineTo(roundnesFactor, size.height * 0.33 + 10);
    path.quadraticBezierTo(
      0,
      size.height * 0.33 + roundnesFactor,
      0,
      size.height * 0.33 + roundnesFactor * 2,
    );

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

// //upsidedown Contaner
class UpsideDownCustomContainerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final roundnesFactor = 20.0;

    // Inverted y-coordinates and mirrored x-coordinates
    path.moveTo(size.width, size.height - size.height * 0.33);
    path.lineTo(size.width, roundnesFactor);
    path.quadraticBezierTo(size.width, 0, size.width - roundnesFactor, 0);
    path.lineTo(roundnesFactor, 0);
    path.quadraticBezierTo(0, 0, 0, roundnesFactor);
    path.lineTo(0, size.height - roundnesFactor * 2);
    path.quadraticBezierTo(
      0,
      size.height,
      roundnesFactor * 3,
      size.height - roundnesFactor * 2,
    );
    path.lineTo(
      size.width - roundnesFactor,
      size.height - size.height * 0.33 - 10,
    );
    path.quadraticBezierTo(
      size.width,
      size.height - size.height * 0.33 - roundnesFactor,
      size.width,
      size.height - size.height * 0.33 - roundnesFactor * 2,
    );

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
