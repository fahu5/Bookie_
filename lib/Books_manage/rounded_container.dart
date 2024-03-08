
import 'package:flutter/material.dart';

class RoundedContainer extends StatelessWidget {
  const RoundedContainer({
    super.key,
    this.width,
    this.height,
    this.radius =5,
    this.child,
    this.showBorder =false,
    this.borderColor=Colors.white,
    this.backgroundColor=Colors.black12,
    this.padding,
    this.margin,
  });

  final double? width;
  final double? height;
  final double? radius;
  final Widget? child;
  final bool showBorder;
  final Color borderColor;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius ?? 0.0), // null-aware operator
        border: showBorder ? Border.all(color: borderColor) : null,
      ),
      child: child,
    );
  }
}
