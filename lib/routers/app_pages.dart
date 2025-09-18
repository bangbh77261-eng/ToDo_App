

import 'package:get/get.dart';

import '../modules/Login_Screen_User/Login_Screen_bindings.dart';
import '../modules/Login_Screen_User/Login_Screen_views.dart';
import '../modules/Main_Screen/Main_bindings.dart';
import '../modules/Main_Screen/Main_views.dart';
import 'app_router.dart';

class AppPages {
  // ignore: constant_identifier_names
  static const INITIAL = Routes.MAIN;

  static final routes = [
    GetPage(
      name: Routes.MAIN,
      page: () => const  MainViews(),
      binding: MainBindings(),
    ),
    GetPage(
      name: Routes.LOGIN_SCREEN,
      page: () => const  LoginScreenUserViews(),
      binding: LoginScreenUserBindings(),
    ),
  ];
}