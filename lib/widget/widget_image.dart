import 'package:flutter/material.dart';

class AppImageWidget extends StatelessWidget {
  final String imagePath;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Color? overlayColor;
  final double overlayOpacity;
  final BorderRadius? borderRadius; // nullable

  const AppImageWidget({
    super.key,
    required this.imagePath,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.overlayColor,
    this.overlayOpacity = 0.0,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    Widget image = Image.asset(
      imagePath,
      width: width,
      height: height,
      fit: fit,
    );

    // Overlay
    if (overlayColor != null && overlayOpacity > 0) {
      image = Stack(
        children: [
          image,
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: overlayColor!.withOpacity(overlayOpacity),
              borderRadius: borderRadius as BorderRadiusGeometry?, // ép kiểu
            ),
          ),
        ],
      );
    }

    // Clip border
    if (borderRadius != null) {
      image = ClipRRect(
        borderRadius: borderRadius!,
        child: image,
      );
    }

    return image;
  }
}
