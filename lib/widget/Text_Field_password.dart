import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Text_Field.dart';

class PasswordTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final String? labelText;

  // RxBool để toggle show/hide
  final RxBool _isHidden = true.obs;

  PasswordTextField({
    super.key,
    required this.controller,
    this.hintText,
    this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CustomTextField(
        controller: controller,
        labelText: labelText ?? "Mật khẩu",
        hintText: hintText ?? "Nhập mật khẩu",
        obscureText: _isHidden.value,
        prefixIcon: const Icon(Icons.lock),
        suffixIcon: IconButton(
          icon: Icon(
            _isHidden.value ? Icons.visibility_off : Icons.visibility,
          ),
          onPressed: () => _isHidden.value = !_isHidden.value,
        ),
      ),
    );
  }
}
