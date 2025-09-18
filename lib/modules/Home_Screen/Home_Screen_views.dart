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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _BuildHeader(),
              Gap(15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text('Sự kiện sắp diễn ra', style: AppStyle.bold()),
              ),
              Gap(10),
              _BuildNotiContent(),
              Gap(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text('Danh mục', style: AppStyle.bold()),
              ),
              Gap(10),
              _BuildMenuList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _BuildHeader() {
    final fullName = controller.currentUser.fullName ?? '';
    final role = controller.currentUser.role ?? '';
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            child: Row(
              children: [
                Gap(10),
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white,
                  child: Text(
                    fullName.isNotEmpty
                        ? fullName.substring(0, 1).toUpperCase()
                        : "",
                    style: const TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurpleAccent,
                    ),
                  ),
                ),
                Gap(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      fullName,
                      style: AppStyle.bold().copyWith(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      role,
                      style: AppStyle.regular()
                          .copyWith(color: Colors.white)
                          .copyWith(fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _BuildNotiContent() {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red.shade400,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Thứ 2',
                            style: AppStyle.bold().copyWith(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '19/09',
                            style: AppStyle.regular().copyWith(
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              border: Border.all(color: Colors.white),
                            ),
                            child: Icon(Icons.star, color: Colors.yellow),
                          ),
                          Text(
                            '2025',
                            style: AppStyle.bold().copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Gap(10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Tên hoạt động', style: AppStyle.bold()),
                        Text('Tổ chức: 12312312', style: AppStyle.regular()),
                        Text('Địa điểm', style: AppStyle.regular()),
                        Text('Thời gian', style: AppStyle.regular()),
                        Text('Người tạo', style: AppStyle.regular()),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _BuildMenuList() {
    return Wrap(children: [Container()]);
  }
}
