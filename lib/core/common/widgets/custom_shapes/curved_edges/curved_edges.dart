import 'package:flutter/material.dart';

///
// * quadraticBezierTo() means go to a point but with a curve
//it takes two points >>> x1,y1 and x2,y2  >>
//x1,y1 is the control point that make the curve and x2,y2 is the end point to go to
///

class CustomCurvedEdges extends CustomClipper<Path> {
  // -- this method is used to draw the shape
  @override
  Path getClip(Size size) {
    // just an path object to draw
    var path = Path();

    // * this is a invisible line goes from 0,0 to 0,size.height (the bottom)
    // or you can use the path.moveTo( desired point)
    // -- this is the start point
    path.lineTo(0, size.height);
    // * from the previous point (0,size.height)  make a curve with
    // -- --- the control point is the magnetic that make the curve
    // * control point (30, size.height - 20) and end point (size.width, size.height - 20)
    path.quadraticBezierTo(0, size.height - 20, 30, size.height - 20);
    // * this is the line between the two curves
    path.lineTo(size.width - 30, size.height - 20);
    path.quadraticBezierTo(
        size.width, size.height - 20, size.width, size.height);
    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

// -- this method is used to redraw the path if the shape changes
//* to see the changes when pressing hot reload
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
