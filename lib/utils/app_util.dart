import 'dart:io';

import 'package:flutter/material.dart';

class AppUtil {
  AppUtil._internal();

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 800;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 800 &&
      MediaQuery.of(context).size.width < 1200;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200;

  static double checkDouble(dynamic value) {
    if (value is String) {
      return double.parse(value);
    } else if (value is int) {
      return 0.0 + value;
    } else {
      return value;
    }
  }

  // static formatMoney(int? money) {
  //   if (money != null) {
  //     return NumberFormat(",###", "vi").format(money);
  //   } else {
  //     return "0";
  //   }
  // }

  static String formatPhone(String phone) {
    if (isValidPhoneNumber(phone)) {
      String str = "";
      if (phone.length > 6) {
        str = phone.substring(0, 3);
        str += "***";
        str += phone.substring(phone.length - 3, phone.length);
      }
      // str = phoneFormatToVNCode(input: str);
      return str;
    }
    return phone;
  }

  static String phoneFormatToVNCode({String input = ""}) {
    if (input.isNotEmpty && input.startsWith("0")) {
      return input.replaceRange(0, 1, "+84");
    }
    return input;
  }

  static bool isValidPhoneNumber(String? phoneNumber) {
    // final pattern = r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$';

    if (phoneNumber == null || phoneNumber.isEmpty) {
      return false;
    }

    const pattern = r'^(?:[+0]9)?[0-9]{10}$';
    final regExp = RegExp(pattern);
    if (!regExp.hasMatch(phoneNumber)) {
      return false;
    }
    return true;
  }

  static bool isPasswordValid(String? password) {
    return (password?.isNotEmpty ?? false) && password!.length >= 8;
  }

  static bool isEmailValid(String? email) {
    if (email == null || email.isEmpty) {
      return false;
    }
    RegExp regex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
    );
    return regex.hasMatch(email);
  }

  static bool isInteger(String? value) {
    if (value == null) {
      return false;
    }
    return int.tryParse(value) != null;
  }

  static bool isUrl(String text) {
    RegExp reg = RegExp(
      r"(https?|http)://([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?",
      caseSensitive: false,
    );
    if (reg.hasMatch(text)) {
      return true;
    }
    return false;
  }

  // static Future<bool> checkAvailableLoginApple() async {
  //   try {
  //     if (Platform.isIOS) {
  //       IosDeviceInfo iosInfo = await DeviceInfoPlugin().iosInfo;
  //       String version = iosInfo.systemVersion;
  //       int ver = int.tryParse(version.split(".").first) ?? 0;
  //       return ver >= 13;
  //     } else {
  //       return false;
  //     }
  //   } catch (e) {
  //     return false;
  //   }
  // }

  static Future<bool> isConnectedNetwork() async {
    bool status = false;
    try {
      final result = await InternetAddress.lookup(
        'tieudungthongthai.com.vn',
      ).timeout(const Duration(seconds: 15));
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        status = true;
        return status;
      }
    } on SocketException catch (_) {
      status = false;
      return status;
    }
    return status;
  }
}
