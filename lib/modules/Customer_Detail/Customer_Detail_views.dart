import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gap/gap.dart';

import 'package:todo_app_sister/app/app_style.dart';
import 'package:todo_app_sister/modules/Customer_Detail/Customer_Detail_controller.dart';
import 'package:todo_app_sister/routers/app_router.dart';
import 'package:todo_app_sister/widget/Button_circle_icon.dart';
import 'package:todo_app_sister/widget/Text_Field.dart';
import 'package:todo_app_sister/widget/Widget_button.dart';

class CustomerDetailViews extends GetView<CustomerDetailController> {
  const CustomerDetailViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _BuildHeader(),
            _buildCustomerList(),
            // const SizedBox(height: 80),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _BuildFloatButton(),
    );
  }
  Widget _BuildFloatButton(){
    return CustomButton(
      backgroundColor: Colors.red,
      text: '+ Thêm bệnh nhân', onPressed: (){});
  }
  Widget _BuildHeader() {
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomCircleButton(
                  icon: Icons.arrow_back, 
                  onPressed: () {
                    Get.back();
                  }
                ),
                Expanded(
                  child: Obx(() => controller.isTexfield.value
                    ?  CustomTextField(
                          controller: controller.searchController,
                          onChanged: controller.onSearchChanged,                       
                          style: TextStyle(color: Colors.black),
                        )                     
                    : Container()
                  )
                ),
                CustomCircleButton(
                  icon: Icons.search, 
                  onPressed: controller.toggleSearch
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCustomerList() {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }
      // Sử dụng filteredCustomers thay vì listCustomer
      final customers = controller.filteredCustomers;

      if (customers.isEmpty) {
        return Center(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              controller.searchQuery.value.isNotEmpty 
                ? "Không tìm thấy bệnh nhân nào với từ khóa '${controller.searchQuery.value}'"
                : "Không có khách hàng nào"
            ),
          ),
        );
      }

      return Column(
        children: [
          // Hiển thị số lượng kết quả tìm kiếm
          if (controller.searchQuery.value.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                "Tìm thấy ${customers.length} kết quả cho '${controller.searchQuery.value}'",
                style: AppStyle.regular().copyWith(
                  fontSize: 14,
                  color: Colors.grey[600]
                ),
              ),
            ),
          
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: customers.length,
            itemBuilder: (context, index) {
              final customer = customers[index];
              return GestureDetector(
                onTap: () {
                   Get.toNamed(
                        Routes.CONTACT_CUSTOMER,
                        arguments:customer,
                      );
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.15),
                        spreadRadius: 2,
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.blue,
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                      const Gap(10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Highlight tên nếu có search query
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                 _buildHighlightedText(
                              customer.customerName,
                              controller.searchQuery.value,
                              AppStyle.bold(),
                              maxLines: 1,
                            ),
                             Text(
                                  customer.yearOld != null 
                                    ? 'Tuổi: ${customer.yearOld}' 
                                    : 'Tuổi: Không có dữ liệu',
                                  style: AppStyle.regular(),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),                         
                            Gap(5),
                            Text(
                              customer.address != null 
                                ? 'Quê quán: ${customer.address}' 
                                : 'Quê quán: Chưa có địa chỉ',
                              style: AppStyle.regular(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                            ),
                            Gap(5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    customer.phoneNumber != null 
                                      ? 'SĐT: ${customer.phoneNumber}' 
                                      : 'SĐT: Không có dữ liệu',
                                    style: AppStyle.regular(),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),                            
                              ],
                            ),
                            Text(
                                  customer.yearOld != null 
                                    ? 'CCCD: ${customer.personCardId}' 
                                    : 'CCCD: Không có dữ liệu',
                                  style: AppStyle.regular(),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),                              
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      );
    });
  }

  /// Widget để highlight text khi search
  Widget _buildHighlightedText(String text, String query, TextStyle style, {int? maxLines}) {
    if (query.isEmpty) {
      return Text(
        text,
        style: style,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
      );
    }

    final lowerText = text.toLowerCase();
    final lowerQuery = query.toLowerCase();
    
    if (!lowerText.contains(lowerQuery)) {
      return Text(
        text,
        style: style,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
      );
    }

    final startIndex = lowerText.indexOf(lowerQuery);
    final endIndex = startIndex + query.length;

    return Text.rich(
      TextSpan(
        children: [
          if (startIndex > 0)
            TextSpan(text: text.substring(0, startIndex), style: style),
          TextSpan(
            text: text.substring(startIndex, endIndex),
            style: style.copyWith(
              backgroundColor: Colors.yellow.shade200,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (endIndex < text.length)
            TextSpan(text: text.substring(endIndex), style: style),
        ],
      ),
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }
}