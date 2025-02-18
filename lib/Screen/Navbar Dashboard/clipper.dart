import 'package:flutter/material.dart';
import 'package:residencia_v2/Screen/Navbar%20Dashboard/size_config.dart';

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(AppSizes.blockSizeHorizontal * 3, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width - AppSizes.blockSizeHorizontal * 3, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
