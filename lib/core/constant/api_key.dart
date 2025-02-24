abstract class ApiKey {
  //Auth
  static const String username = "username";
  static const String email = "email";
  static const String password = "password";
  static const String phone = "phone";
  static const String verifyCode = "verifyCode";
  //home 
  static const String userId = "userId";
}

abstract class ApiResult {
  static const String status = "status";
  static const String data = "data";
  static const String success = "success";
  static const String failure = "failure";
  static const String noFound = "noFound";
  static const String noApprove = "noApprove";
}
