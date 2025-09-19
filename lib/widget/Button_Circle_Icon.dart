import 'package:flutter/material.dart';
import 'package:todo_app_sister/app/app_style.dart';

class CustomCircleButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isDisabled;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? textColor;
  final double borderRadius;
  final double elevation;

  const CustomCircleButton({
    super.key,
    required this.onPressed,
    this.isLoading = false,
    this.isDisabled = false,
    this.icon,
    this.backgroundColor,
    this.textColor,
    this.borderRadius = 12,
    this.elevation = 2,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveBgColor = backgroundColor ?? Colors.white;
    final effectiveIconColor = textColor ?? Colors.black;
        return GestureDetector(
          onTap: onPressed,
          child: Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: effectiveBgColor,
              borderRadius: BorderRadius.circular(100)
            ),
            child: Icon(icon,color: effectiveIconColor,),
            ),
        );
  }
}
