//php Body
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
  //search
  static const String searchName = "searchName";
  //address
  static const String typeAddress = "typeAddress";
  static const String city = "city";
  static const String street = "street";
  static const String latitude = "latitude";
  static const String longitude = "longitude";
  static const String detailAddress = "detailAddress";
  //coupons
  static const String couponsName = "couponsName";
  //order
  static const String typePayment = "typePayment";
  static const String typeDelivery = "typeDelivery";
  static const String deliveryPrice = "deliveryPrice";
  static const String price = "price";
  static const String totalPrice = "totalPrice";
  static const String status = "status";
  static const String couponsId = "couponsId";
  static const String addressId = "addressId";
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
  static const String insertAddressError = "insertAddressError";
  // static const String orderId = "orderId"; // checkout php + order controller
}
