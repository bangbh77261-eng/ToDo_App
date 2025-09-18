import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gap/gap.dart';
import '../../app/app_images.dart';
import '../../app/app_style.dart';
import '../../widget/Text_Field.dart';
import '../../widget/Text_Field_password.dart';
import 'Login_Screen_controller.dart';
class LoginScreenUserViews extends GetView<LoginScreenUserController> {
  const LoginScreenUserViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.image_login),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Back button top-left
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: GestureDetector(
                      onTap: () => Get.back(),
                      child: const Icon(Icons.arrow_back, color: Colors.white),
                    ),
                  ),
                ),

                // TextFields in center
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text('login'.tr,style: AppStyle.bold(color: Colors.white,fontSize: 28),)),
                      Gap(50),
                    Text('user_name'.tr,style: AppStyle.bold(color: Colors.white),),
                    Gap(10),
                    CustomTextField(
                      controller: controller.userName,
                      labelText: "user_name".tr,
                      hintText: "Nhập email của bạn",
                      prefixIcon: const Icon(Icons.account_circle),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    Gap(10),
                    Text('user_name'.tr,style: AppStyle.bold(color: Colors.white),),
                    Gap(10),
                    PasswordTextField(
                      controller: controller.userPassword,
                      labelText: 'password'.tr,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: _BuildHeperCell()
                ),
              ],
            ),
          ),
        ),
      ),
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
            'Vui lòng nhập thông tin đăng nhập',
            style: AppStyle.bold(color: Colors.white,fontStyle: FontStyle.italic),
            textAlign: TextAlign.center,
          ),
        ],
      );
  }
}
