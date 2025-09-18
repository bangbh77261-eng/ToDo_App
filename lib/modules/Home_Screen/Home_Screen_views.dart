import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gap/gap.dart';
import 'package:todo_app_sister/app/app_images.dart';
import 'package:todo_app_sister/app/app_style.dart';
import 'package:todo_app_sister/modules/Home_Screen/Home_Screen_controller.dart';
import 'package:todo_app_sister/widget/widget_image.dart';

class HomeScreenViews extends GetView<HomeScreenController> {
  const HomeScreenViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text("User List")),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child:  Column(
              children: [
                  _BuildHeader(),
              ],
            ),
          ),
        ),    
    );
  }
  Widget _BuildHeader(){
    return Row(
      children: [
        Expanded(child: Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.only(bottomLeft:Radius.circular(12),bottomRight: Radius.circular(12))
          ),
          child: Row(
            children: [
              Gap(10),
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.white,
                child: Text(
                  controller.userName.isNotEmpty
                      ? controller.userName.substring(0, 1).toUpperCase()
                      : "",
                  style: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurpleAccent,
                  ),
                ),
              ),
              Gap(10),
              Text('Họ tên: ${controller.userName}',style: AppStyle.bold().copyWith(color: Colors.white),)
            ],
          ),
        ))
      ],
    );
  }
}
