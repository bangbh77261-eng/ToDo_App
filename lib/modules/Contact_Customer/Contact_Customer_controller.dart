import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_sister/network/config/CRUD_data.dart';
import 'package:todo_app_sister/network/models/user_detail.dart';

class ContactCustomerController extends GetxController {
  CustomerDetail? customer;
  late final TextEditingController noteController;
  final SupabaseCrudService<CustomerDetail> _customerService =
      SupabaseCrudService<CustomerDetail>(
    tableName: 'CustomerDetail',
    fromJson: (json) => CustomerDetail.fromJson(json),
  );

  final RxString note = ''.obs;
  final RxBool isUpdating = false.obs;

  @override
  void onInit() {
    super.onInit();

    if (Get.arguments != null && Get.arguments is CustomerDetail) {
      customer = Get.arguments as CustomerDetail;
    } else {
      debugPrint("⚠️ Không nhận được CustomerDetail từ màn trước!");
    }

    // Khởi tạo controller với dữ liệu có sẵn
    noteController = TextEditingController(text: customer?.noteDetail ?? '');
    note.value = customer?.noteDetail ?? '';
  }

  @override
  void onClose() {
    noteController.dispose();
    super.onClose();
  }

  bool get hasCustomer => customer != null;

  Future<void> updateNote() async {
    if (customer == null) return;

    final newNote = note.value.trim();
    if (newNote.isEmpty) {
      Get.snackbar('⚠️ Cảnh báo', 'Vui lòng nhập ghi chú trước khi cập nhật');
      return;
    }

    try {
      isUpdating.value = true;
      final updatedCustomer = await _customerService.update(
        'id',
        customer!.id,
        {'note_detail': newNote},
      );

      customer = updatedCustomer;
      noteController.text = updatedCustomer.noteDetail ?? '';
      Get.snackbar('✅ Thành công', 'Cập nhật ghi chú thành công');
    } catch (e) {
      Get.snackbar('❌ Lỗi', 'Không thể cập nhật ghi chú: $e');
      debugPrint('❌ updateNote error: $e');
    } finally {
      isUpdating.value = false;
      update();
    }
  }
}

