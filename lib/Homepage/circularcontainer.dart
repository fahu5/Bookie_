import 'package:flutter/material.dart';

class CircularContainer extends StatelessWidget {
  const CircularContainer({
    super.key,
    this.child,
    this.width = 400,
    this.height = 400,
    this.padding = 8.0,
    this.radius = 400.0,
    this.backgroundcolor = Colors.deepPurpleAccent,
    required Color backgroundColor,
  });

  final double? width;
  final double? height;
  final double padding;
  final double radius;
  final Widget? child;
  final Color backgroundcolor;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundcolor,
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius),
            ),
          ),
          if (child != null) Positioned.fill(child: child!),
        ],
      ),
    );
  }
}