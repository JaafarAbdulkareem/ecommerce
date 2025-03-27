abstract class ApiKey {
  //Auth
  static const String username = "username";
  static const String email = "email";
  static const String password = "password";
  static const String phone = "phone";
  static const String verifyCode = "verifyCode";
  //cart
  static const String id = "id";
  static const String userId = "userId";
  static const String productId = "productId";
  static const String count = "count";
}

abstract class ApiResult {
  static const String status = "status";
  static const String data = "data";
  static const String success = "success";
  static const String failure = "failure";
  static const String noFound = "noFound";
  static const String noApprove = "noApprove";
  static const String category = "category";
  static const String product = "product";
  static const String verifyCode = "verifyCode";
  // static const String noData = "noData";
  static const String noChange = "noChange";
  // static const String noDecrement = "noDecrement";
}
