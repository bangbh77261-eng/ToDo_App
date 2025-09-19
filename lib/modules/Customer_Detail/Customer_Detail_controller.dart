import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_sister/network/config/CRUD_data.dart';
import 'package:todo_app_sister/network/models/user_detail.dart';

class CustomerDetailController extends GetxController {
  RxBool isTexfield = false.obs;
  RxBool isLoading = false.obs;
  RxList<CustomerDetail> listCustomer = <CustomerDetail>[].obs;
  RxList<CustomerDetail> filteredCustomers = <CustomerDetail>[].obs;
  
  // TextEditingController cho search field
  TextEditingController searchController = TextEditingController();
  RxString searchQuery = ''.obs;

  final userService = SupabaseCrudService<CustomerDetail>(
    tableName: 'CustomerDetail', // ✅ Đúng tên bảng
    fromJson: (json) => CustomerDetail.fromJson(json),
  );

  @override
  void onInit() {
    super.onInit();
    fetchCustomers();
    
    // Lắng nghe thay đổi search query
    searchQuery.listen((query) {
      filterCustomers(query);
    });
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  /// Lấy danh sách khách hàng từ Supabase
  Future<void> fetchCustomers() async {
    try {
      isLoading.value = true;
      final customers = await userService.getAll();
      listCustomer.assignAll(customers);
      filteredCustomers.assignAll(customers); // Hiển thị tất cả ban đầu
    } catch (e, stackTrace) {
      debugPrint("❌ Lỗi khi lấy khách hàng: $e");
      debugPrint(stackTrace.toString());
      Get.snackbar(
        "Lỗi",
        "Không thể tải danh sách khách hàng",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  /// Lọc khách hàng theo tên
  void filterCustomers(String query) {
    if (query.isEmpty) {
      filteredCustomers.assignAll(listCustomer);
    } else {
      final filtered = listCustomer.where((customer) {
        return customer.customerName
            .toLowerCase()
            .contains(query.toLowerCase());
      }).toList();
      filteredCustomers.assignAll(filtered);
    }
  }

  /// Xử lý khi nhấn nút search
  void toggleSearch() {
    isTexfield.value = !isTexfield.value;
    
    if (!isTexfield.value) {
      // Nếu đóng search, clear text và reset danh sách
      searchController.clear();
      searchQuery.value = '';
      filteredCustomers.assignAll(listCustomer);
    }
  }

  /// Xử lý khi text search thay đổi
  void onSearchChanged(String value) {
    searchQuery.value = value;
  }
}