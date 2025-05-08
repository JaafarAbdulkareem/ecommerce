abstract class ApiConstant {
  // static const String server = "http://192.168.0.113"; // home wifi
  // static const String server = "http://192.168.230.139";
  static const String server = "http://192.168.50.139"; // mobile
  static const String project = "/project/ecommerce";
  static const String serverPath = "$server/$project";

  static const String imagePath = "$serverPath/upload";
  static const String categoryImagePath = "$imagePath/category";
  static const String productImagePath = "$imagePath/product";

  static const String folderAuth = "/auth";
  static const String apiSignup = "$serverPath/$folderAuth/signup.php";
  static const String apiVerificationSignup =
      "$serverPath/$folderAuth/verify_code_signup.php";
  static const String apiVerification =
      "$serverPath/$folderAuth/verify_code.php";
  static const String apiLogin = "$serverPath/$folderAuth/login.php";
  static const String apiForgetPassword =
      "$serverPath/$folderAuth/forget_password.php";
  static const String apiResetPassword =
      "$serverPath/$folderAuth/reset_password.php";
  static const String apiViewAuth = "$serverPath/$folderAuth/view_auth.php";

  static const String folderHome = "/home";
  static const String apiHome = "$serverPath/$folderHome/home.php";
  static const String apiSearchPrdouct =
      "$serverPath/$folderHome/search_product.php";

  static const String folderCart = "/cart";
  static const String apiView = "$serverPath/$folderCart/view.php";
  static const String apiInsert = "$serverPath/$folderCart/insert.php";
  static const String apiDeleteAllProduct =
      "$serverPath/$folderCart/delete_all_product.php";
  static const String apiIncrement = "$serverPath/$folderCart/increment.php";
  static const String apiDecrement = "$serverPath/$folderCart/decrement.php";

  static const String folderAddress = "/address";
  static const String apiViewAddress =
      "$serverPath/$folderAddress/view_address.php";
  static const String apiInsertAddress =
      "$serverPath/$folderAddress/insert_address.php";
  static const String apiDeleteAddress =
      "$serverPath/$folderAddress/delete_address.php";
  static const String apiUpdateAddress =
      "$serverPath/$folderAddress/update_address.php";

  static const String folderCoupons = "/coupons";
   static const String apiViewCoupons =
      "$serverPath/$folderCoupons/view_coupons.php";

}
