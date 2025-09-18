import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gap/gap.dart';
import '../../app/app_style.dart';
import '../../routers/app_router.dart';
import '../../widget/Widget_button.dart';
import 'Main_controller.dart';

class MainViews extends GetView<MainController> {
  const MainViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _BuildAppBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Align(
                  alignment: Alignment.center,
                  child: Wrap(
                    children: [
                      _buildCell(
                        icon: Icons.shopping_bag,
                        colors: Colors.red,
                        title: "Duyệt và đặt hàng",
                        onTap: () => Get.snackbar("Click", "Bạn vừa chọn Danh bạ"),
                      ),
                      _buildCell(
                        icon: Icons.menu_book,
                        colors: Colors.red,
                        title: "Xem tin tức mới nhất",
                        onTap: () => Get.snackbar("Click", "Bạn vừa chọn Người dùng"),
                      ),
                      _buildCell(
                        icon: Icons.shopping_cart,
                        colors: Colors.grey.shade400,
                        title: "Thanh toán và giao hàng",
                        onTap: () {},
                      ),
                      _buildCell(
                        icon: Icons.production_quantity_limits,
                        colors: Colors.grey.shade400,
                        title: "Quản lý đơn hàng",
                        onTap: () {},
                      ),
                      _buildCell(
                        icon:Icons.account_box,
                        title: "Thông tin khách hàng",
                         colors: Colors.grey.shade400,
                        onTap: () {},
                      ),
                      _buildCell(
                        icon: Icons.archive,
                        title: "Thanh toán và hóa đơn",
                         colors: Colors.grey.shade400,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Phần này luôn nằm dưới cùng
            Container(
              decoration: BoxDecoration(
                color: Colors.white,               
              ),
              child: Row(children: [
                Container(
                  
                )
              ],)
            ),
          ],
        ),
      ),
    );
  }

  // App bar
  Widget _BuildAppBar() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
      ),
      child: Row(
        children: [
          CustomButton(
            text: 'login'.tr,
            textColor: Colors.red,
            backgroundColor: Colors.white,
            onPressed: () => _showDialog("login_detail_leave".tr),
          )
        ],
      ),
    );
  }
 void _showDialog(String message) {
  Get.dialog(
    Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 20), // Khoảng cách từ viền màn hình
      child: SizedBox(
        width: Get.width * 0.96, // chiếm 90% chiều ngang màn hình
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Text(
                  "dialog_header_content".tr,
                  style: AppStyle.bold(),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 12),
              const Icon(Icons.info, size: 40, color: Colors.blue),
              const SizedBox(height: 12),
              Text(
                message,
                style: AppStyle.bold(color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      text: 'login'.tr,
                      textColor: Colors.white,
                      backgroundColor: Colors.red,
                      onPressed: () {
                        Get.back();
                        Get.toNamed(Routes.LOGIN_SCREEN);
                        
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: CustomButton(
                      text: 'close'.tr,
                      textColor: Colors.red,
                      backgroundColor: Colors.white,
                      onPressed: () => Get.back(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
  // Cells
  Widget _buildCell({
    required IconData icon,
    required Color colors,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: Get.width*0.3,
        height: Get.height*0.15,
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(icon, size: 40, color: colors),
            const Gap(8),
            Text(title,style: AppStyle.bold().copyWith(fontSize: 14,color: colors), textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
