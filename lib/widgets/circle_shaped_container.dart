import 'package:flutter/material.dart';

class AlignedCircle extends StatelessWidget {
  final double x;
  final double y;
  final double height;
  final double width;
  final Color color;
  final bool isSquare;

  const AlignedCircle({
    super.key,
    required this.x,
    required this.y,
    this.height = 300.0,
    this.width = 300.0,
    this.color = Colors.deepPurple,
    this.isSquare = false, // Default is a circle
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(x, y),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
          color: color,
        ),
      ),
    );
  }
}
