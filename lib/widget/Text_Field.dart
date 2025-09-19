import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType keyboardType;
  final Color borderColor;
  final double borderRadius;
  final InputDecoration? decoration; // Cho phép override decoration
  final TextStyle? style; // Cho phép custom style
  final ValueChanged<String>? onChanged; // Hỗ trợ callback
  final int? maxLines; // ✅ Cho phép nhiều dòng
  final int? minLines; // ✅ Cho phép set số dòng tối thiểu

  const CustomTextField({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.borderColor = Colors.grey,
    this.borderRadius = 8.0,
    this.decoration,
    this.style,
    this.onChanged,
    this.maxLines = 1, // Mặc định 1 dòng (TextField bình thường)
    this.minLines,
  });

  @override
  Widget build(BuildContext context) {
    final defaultDecoration = InputDecoration(
      hintText: hintText,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: Colors.white,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: BorderSide(color: borderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: const BorderSide(color: Colors.blue),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
    );

    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      style: style,
      onChanged: onChanged,
      maxLines: maxLines,
      minLines: minLines,
      decoration: decoration ?? defaultDecoration,
    );
  }
}
