abstract class ApiConstant {
  static const String server =
      "https://f6a9-49-206-7-252.ngrok-free.app/"; // ngrok ngrok http --url=pleasantly-divine-bear.ngrok-free.app 80
  // static const String server = "http://192.168.0.113"; // home wifi
  // static const String server = "http://192.168.230.139";
  // static const String server = "http://192.168.50.139"; // mobile
  static const String project = "/project/ecommerce";
  static const String serverPath = "$server/$project";

  static const String imagePath = "$serverPath/upload";
  static const String categoryImagePath = "$imagePath/category";
  static const String productImagePath = "$imagePath/product";

  static const String folderAuth = "$serverPath/auth";
  static const String apiSignup = "$folderAuth/signup.php";
  static const String apiVerificationSignup =
      "$folderAuth/verify_code_signup.php";
  static const String apiVerification = "$folderAuth/verify_code.php";
  static const String apiLogin = "$folderAuth/login.php";
  static const String apiForgetPassword = "$folderAuth/forget_password.php";
  static const String apiResetPassword = "$folderAuth/reset_password.php";
  static const String apiViewAuth = "$folderAuth/view_auth.php";

  static const String folderHome = "$serverPath/home";
  static const String apiHome = "$folderHome/home.php";
  static const String apiSearchPrdouct = "$folderHome/search_product.php";

  static const String folderCart = "$serverPath/cart";
  static const String apiView = "$folderCart/view.php";
  static const String apiInsert = "$folderCart/insert.php";
  static const String apiDeleteAllProduct =
      "$folderCart/delete_all_product.php";
  static const String apiIncrement = "$folderCart/increment.php";
  static const String apiDecrement = "$folderCart/decrement.php";

  static const String folderAddress = "$serverPath/address";
  static const String apiViewAddress = "$folderAddress/view_address.php";
  static const String apiInsertAddress = "$folderAddress/insert_address.php";
  static const String apiDeleteAddress = "$folderAddress/delete_address.php";
  static const String apiUpdateAddress = "$folderAddress/update_address.php";

  static const String folderCoupons = "$serverPath/coupons";
  static const String apiViewCoupons = "$folderCoupons/view_coupons.php";

  static const String folderOrder = "$serverPath/order";
  // static const String apiCheckProductNo =
  //     "$folderOrder/check_product_no.php";
  static const String apiCheckout = "$folderOrder/checkout.php";
  static const String apiViewOrder = "$folderOrder/view_order.php";
  static const String apiDeleteOrder = "$folderOrder/delete_order.php";
  static const String apiViewArchive = "$folderOrder/view_archive.php";
  static const String apiViewDetailOrder = "$folderOrder/view_detail_order.php";

  static const String folderNotification = "$serverPath/notification";
  static const String apiViewNotification =
      "$folderNotification/view_notification.php";
  static const String apiInsertNotification =
      "$folderNotification/insert_notification.php";
  static const String apiDeleteNotification =
      "$folderNotification/delete_notification.php";
}
