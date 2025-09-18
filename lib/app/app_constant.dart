class AppConstant {
  // static final AppConstant _singleton = AppConstant._internal();
  // factory AppConstant() {
  //   return _singleton;
  // }
  AppConstant._internal();

  static const String fcmToken = 'FCM_TOKEN';
  static const String languageCode = 'LANGUAGE_CODE';

  // 1: username/pass, 2: facebook, 3: google, 4: apple
  static const String loginType = 'LOGIN_TYPE';
  static const int loginUserAccount = 1;
  static const int loginUserFacebook = 2;
  static const int loginUserGoogle = 3;
  static const int loginUserApple = 4;

  static const String phoneNumber = 'PHONE_NUMBER';
  static const String password = 'PASSWORD';
  static const String registerRequest = 'REGISTER_REQUEST';
  static const String otpType = 'OTP_TYPE';
  static const String token = 'TOKEN';
  static const String code = 'CODE';

  static const String productsDetail = 'productsDetail';
  static const String category = 'category';
  static const String subCategories = 'subCategories';
  static const String serviceSelected = 'serviceSelected';

  static const String serviceItem = 'serviceItem';
  static const String serviceUnit = 'serviceUnit';

  static const String imagePath = 'imagePath';
  static const String imageFile = 'imageFile';
  static const String imageXFile = 'imageXFile';
}
