abstract class ApiConstant {
  static const String server =
      "https://9d1a-49-206-0-60.ngrok-free.app/"; // ngrok ngrok http --url=pleasantly-divine-bear.ngrok-free.app 80
  // static const String server = "http://192.168.0.113"; // home wifi
  // static const String server = "http://192.168.230.139";
  // static const String server = "http://192.168.50.139"; // mobile
  static const String project = "/project/ecommerce";
  static const String serverPath = "$server/$project";

  static const String imagePath = "$serverPath/upload";
  static const String categoryImagePath = "$imagePath/category";
  static const String productImagePath = "$imagePath/product";
 static const String folderUser = "$serverPath/users/";
  static const String folderAuth = "$folderUser/auth";
  static const String apiSignup = "$folderAuth/signup.php";
  static const String apiVerificationSignup =
      "$folderAuth/verify_code_signup.php";
  static const String apiVerification = "$folderAuth/verify_code.php";
  static const String apiLogin = "$folderAuth/login.php";
  static const String apiForgetPassword = "$folderAuth/forget_password.php";
  static const String apiResetPassword = "$folderAuth/reset_password.php";
  static const String apiViewAuth = "$folderAuth/view_auth.php";

  static const String folderHome = "$folderUser/home";
  static const String apiHome = "$folderHome/home.php";
  static const String apiSearchPrdouct = "$folderHome/search_product.php";

  static const String folderCart = "$folderUser/cart";
  static const String apiView = "$folderCart/view.php";
  static const String apiInsert = "$folderCart/insert.php";
  static const String apiDeleteAllProduct =
      "$folderCart/delete_all_product.php";
  static const String apiIncrement = "$folderCart/increment.php";
  static const String apiDecrement = "$folderCart/decrement.php";

  static const String folderAddress = "$folderUser/address";
  static const String apiViewAddress = "$folderAddress/view_address.php";
  static const String apiInsertAddress = "$folderAddress/insert_address.php";
  static const String apiDeleteAddress = "$folderAddress/delete_address.php";
  static const String apiUpdateAddress = "$folderAddress/update_address.php";

  static const String folderCoupons = "$folderUser/coupons";
  static const String apiViewCoupons = "$folderCoupons/view_coupons.php";

  static const String folderOrder = "$folderUser/order";
  // static const String apiCheckProductNo =
  //     "$folderOrder/check_product_no.php";
  static const String apiCheckout = "$folderOrder/checkout.php";
  static const String apiViewOrder = "$folderOrder/view_order.php";
  static const String apiDeleteOrder = "$folderOrder/delete_order.php";
  static const String apiViewArchive = "$folderOrder/view_archive.php";
  static const String apiViewDetailOrder = "$folderOrder/view_detail_order.php";
  static const String apiViewInvalidOrder =
      "$folderOrder/view_invalid_order.php";
  static const String apiInsertSubmitInvalidOrder =
      "$folderOrder/insert_submit_invalid_order.php";

  static const String folderNotification = "$folderUser/notification";
  static const String apiViewNotification =
      "$folderNotification/view_notification.php";
  static const String apiInsertNotification =
      "$folderNotification/insert_notification.php";
  static const String apiDeleteNotification =
      "$folderNotification/delete_notification.php";

  static const String folderRating = "$folderUser/rating";
  static const String apiInsertRating = "$folderRating/insert_rating.php";
}
