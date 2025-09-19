import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gap/gap.dart';
import 'package:todo_app_sister/app/app_images.dart';
import 'package:todo_app_sister/app/app_style.dart';
import 'package:todo_app_sister/modules/Contact_Customer/Contact_Customer_controller.dart';
import 'package:todo_app_sister/modules/Customer_Detail/Customer_Detail_controller.dart';
import 'package:todo_app_sister/modules/Home_Screen/Home_Screen_controller.dart';
import 'package:todo_app_sister/routers/app_router.dart';
import 'package:todo_app_sister/widget/Button_circle_icon.dart';
import 'package:todo_app_sister/widget/Text_Field.dart';
import 'package:todo_app_sister/widget/Widget_button.dart';
import 'package:todo_app_sister/widget/widget_image.dart';

class ContactCustomerViews extends GetView<ContactCustomerController> {
  const ContactCustomerViews({super.key});

  @override
  Widget build(BuildContext context) {
    if (!controller.hasCustomer) {
      return Scaffold(
        body: Center(
          child: Text("Không có dữ liệu khách hàng được truyền."),
        ),
      );
    }
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               _BuildHeader(),
               _BuildCustomerDetail(), 
            ],
          ),
      ),    
    );
  }
  Widget _BuildHeader() {
  return Row(
    children: [
      Expanded(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: const BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              /// Nút Back căn trái
              Align(
                alignment: Alignment.centerLeft,
                child: CustomCircleButton(
                  icon: Icons.arrow_back,
                  onPressed: () => Get.back(),
                ),
              ),
              Center(
                child: Text(
                  'Thông tin bệnh nhân',
                  style: AppStyle.bold().copyWith(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
  Widget _BuildCustomerDetail(){
     final customer = controller.customer!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 20),
      child: Column(
        children: [
          CircleAvatar(
            radius: 60,
            child: Center(child: Icon(Icons.camera_alt)),
          ),
          Gap(10),
          _buildCellDetail('Mã bệnh nhân',customer.customerID.toString()),
          _buildCellDetail('Họ và tên',customer.customerName),
          _buildCellDetail('Giới tính',customer.character??''),
          _buildAddressDetail('Quê quán',customer.address??''),
          _buildCellDetail('Số điện thoại',customer.phoneNumber??''),
          _buildCellDetail('Căn cước-CCCD',customer.personCardId??''),
          _buildCellDetail('Tuổi',customer.yearOld.toString()),
          _buildCellDetail('Năm sinh',customer.birthDayDisplay),
          _buildCellDetail('Ngày nhập viện',customer.joinDateDisplay),
          _buildCellDetail('Ngày xuất viện',customer.leaveDateDisplay),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Ghi chú', style: AppStyle.bold().copyWith(color: Colors.red)),
                Obx(() {
                  if (controller.isUpdating.value) {
                    return const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    );
                  }
                  return TextButton(
                    onPressed: controller.updateNote,
                    child: Row(
                      children: [
                        const Icon(Icons.mode),
                        const Gap(5),
                        Text(
                          'Cập nhật',
                          style: AppStyle.bold().copyWith(color: Colors.blue),
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
            const Gap(10),
            CustomTextField(
              maxLines: 2,
              controller: controller.noteController,
              hintText: "Nhập ghi chú...",
              onChanged: (value) => controller.note.value = value,
            ),
        ],
      ),
    );
  }
  Widget _buildCellDetail(String header,String detail){
    return Column(
      children: [
        Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Text(header,style: AppStyle.regular(),)),
                   Text(
                    detail != null 
                      ? '${detail}' 
                      : 'Chưa có địa chỉ',
                    style: AppStyle.bold(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                  ),              
                ],
              ),
              Gap(5),
              Divider(thickness: 0.2,color: Colors.grey,),
              Gap(5)
      ],
    );
  }
  Widget _buildAddressDetail(String header,String detail){
    return Column(
      children: [
        Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: Get.width*0.4,
                    child: Text(header,style: AppStyle.regular(),)),
                   Expanded(
                      child: Text(
                        detail ?? 'Chưa có địa chỉ',
                        style: AppStyle.bold(),
                        textAlign: TextAlign.right,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                      ),
                    ),
                ],
              ),
              Gap(5),
              Divider(thickness: 0.2,color: Colors.grey,),
              Gap(5)
      ],
    );
  }
}