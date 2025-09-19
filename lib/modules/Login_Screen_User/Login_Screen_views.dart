import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gap/gap.dart';
import 'package:todo_app_sister/app/app_style.dart';
import 'package:todo_app_sister/modules/Login_Screen_User/Login_Screen_controller.dart';
import 'package:todo_app_sister/widget/Text_Field.dart';
import 'package:todo_app_sister/widget/Text_Field_password.dart';
import 'package:todo_app_sister/widget/Widget_button.dart';

class LoginScreenUserViews extends GetView<LoginScreenUserController> {
  const LoginScreenUserViews({super.key});

  @override
  Widget build(BuildContext context) {
       return Scaffold(
      resizeToAvoidBottomInset: true, // Cho phép layout co lại khi bàn phím bật
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 221, 61, 61),
              Color.fromARGB(255, 210, 91, 214),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView( // 👈 thêm dòng này
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height -
                      MediaQuery.of(context).padding.top -
                      MediaQuery.of(context).padding.bottom,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _BuildHeader(),
                      _BuildCenterContent(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: _BuildHeperCell(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _BuildHeader(){
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
    );
  }

  Widget _BuildCenterContent(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.center,
          child: Text(
            'Đăng nhập'.tr,
            style: AppStyle.bold(color: Colors.white, fontSize: 28),
          )
        ),     
        Gap(20),
        
        // Error message display
        Obx(() => controller.errorMessage.value.isNotEmpty 
          ? Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 75, 10, 61).withOpacity(0.1),
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(Icons.error, color: Colors.white, size: 20),
                  Gap(8),
                  Expanded(
                    child: Text(
                      controller.errorMessage.value,
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => controller.clearError(),
                    child: Icon(Icons.close, color: Colors.white, size: 20),
                  ),
                ],
              ),
            )
          : SizedBox.shrink()
        ),
        
        Text('Tên đăng nhập'.tr, style: AppStyle.bold(color: Colors.white)),
        Gap(10),
        CustomTextField(
          controller: controller.userName,
          labelText: "Tên đăng nhập".tr,
          hintText: "Nhập tên đăng nhập của bạn",
          prefixIcon: const Icon(Icons.account_circle),
          keyboardType: TextInputType.text,
        ),
        Gap(10),
        Text('Mật khẩu'.tr, style: AppStyle.bold(color: Colors.white)),
        Gap(10),
        PasswordTextField(
          controller: controller.userPassword,
          labelText: 'password'.tr,
        ),
        Gap(20),
        Align(
          alignment: Alignment.center,
          child: Row(
            children: [
              Expanded(
                child: Obx(() => CustomButton(
                  backgroundColor: Colors.deepPurpleAccent,
                  text: controller.isLoading.value ? 'Đang đăng nhập...' : 'Đăng nhập',
                  onPressed: controller.isLoading.value ? null : () {
                    print('🎯 Login button pressed');
                    print('📝 Current username: "${controller.userName.text}"');
                    print('📝 Current password: "${controller.userPassword.text}"');
                    controller.login();
                  },
                )),
              ),
            ],
          )
        )
      ],
    );
  }

  Widget _BuildHeperCell(){
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: [
              Text('')
            ],
          ),
        ),
        Text(
          'Ứng dụng nội bộ',
          style: AppStyle.bold(color: Colors.white, fontStyle: FontStyle.italic),
        ),
      ],
    );
  }
}