import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_sister/network/config/CRUD_data.dart';
import 'package:todo_app_sister/network/models/user.dart';

class HomeScreenController extends GetxController {
  late String userName;

    @override
    void onInit() {
      super.onInit();
      userName = Get.arguments ?? "Lỗi";
      print("👤 Nhận được username: $userName");
    }
}