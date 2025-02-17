abstract class ApiConstant {
  static const String server = "http://192.168.0.113";
  static const String project = "/project/ecommerce";
  static const String serverPath = "$server/$project";
  static const String folderAuth = "/auth";
  static const String apiSignup = "$serverPath/$folderAuth/signup.php";
  static const String apiVerification = "$serverPath/$folderAuth/verify_code.php";
  static const String apiLogin = "$serverPath/$folderAuth/login.php";
}