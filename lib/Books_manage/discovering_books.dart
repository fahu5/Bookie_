import 'package:flutter/material.dart';

import '../Core/Helper/helpfunction.dart';

class DiscoveringBooks extends StatelessWidget {
  const DiscoveringBooks({
    super.key, this.width=100,
    this.height,
    required this.imageUrl,
    this.applyImageRadius=true,
    this.border,
    this.backgroundColor= Colors.transparent,
    this.fit=BoxFit.contain,
    this.padding,
    this.isNetworkImage=false,
    this.onPressed,
  });
  final double? width,height;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(border: border,color: backgroundColor,borderRadius: BorderRadius.circular(HSizes.md)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(HSizes.md),
          child: Image(fit: fit, image: isNetworkImage ? NetworkImage(imageUrl): AssetImage(imageUrl) as ImageProvider),
        ),
      ),
    );
  }
}
