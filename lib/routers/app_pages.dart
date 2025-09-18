

import 'package:get/get.dart';
import 'package:todo_app_sister/modules/Home_Screen/Home_Screen_bindings.dart';
import 'package:todo_app_sister/modules/Home_Screen/Home_Screen_views.dart';
import 'package:todo_app_sister/modules/Login_Screen_User/Login_Screen_bindings.dart';
import 'package:todo_app_sister/modules/Login_Screen_User/Login_Screen_views.dart';
import 'app_router.dart';

class AppPages {
  // ignore: constant_identifier_names
  static const INITIAL = Routes.LOGIN_SCREEN;

  static final routes = [
    GetPage(
      name: Routes.LOGIN_SCREEN,
      page: () => const  LoginScreenUserViews(),
      binding: LoginScreenUserBindings(),
    ),
    GetPage(
      name: Routes.HOME_SCREEN,
      page: () => const  HomeScreenViews(),
      binding: HomeScreenBindings(),
    ),
  ];
}