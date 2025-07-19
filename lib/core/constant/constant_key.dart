abstract class ConstantKey {
//shared references
  static const String keyLanguage = "keyLanguage";
  static const String keyOnboarding = "keyOnboarding";
  static const String keyLogin = "keyLogin";
  static const String keyfavoriteId = "keyFavoriteId";
  static const String keyUserId = "keyUserId";
  static const String keyCustomerId = "keyCustomerId";
  static const String keyUsername = "keyUsername";
  static const String keyIsDarkMode = "keyIsDarkMode";
  static const String keyIsMale = "keyIsMale";
  // static const String userIdValidator = "userId";
  //validator
  static const String usernameValidator = "username";
  static const String emailValidator = "email";
  static const String passwordValidator = "password";
  static const String phoneValidator = "phone";
  //agurement navigator
  static const String indexCategory = "indexCategory";
  static const String productData = "productData";
  static const String categoryNames = "categoryNames";
  static const String favoriteIDData = "favoriteIDData";
  static const String productId = "productId";
  static const String count = "count";
  static const String boolInsert = "boolInsert";
  // static const String boolGetOrder = "boolGetOrder";
  static const String userLocation = "latLng";
  static const String invalidProductIds = "invalidProductIds";
  // static const String orderData = "orderData";
  static const String callArchive = "callArchive";
  static const String orderData = "orderData";
//hero
  static const String tagProductImage = "tagProductImage";
//id GetBuilder
  static const String idListProductCart = "idListProductCart";
  static const String idFavoriteProduct = "idFavoriteProduct";
  static const String idReceiveShopping = "idReceiveShopping";
  static const String idUpdateAddress = "idUpdateAddress";
  static const String idInvalidButton = "idInvalidButton";
  static const String idRatingButton = "idRatingButton";
  static const String idGoogleMap = "idGoogleMap";
  static const String idCouponsApply = "idCouponsApply";
  // id marker in google map
  static const String idUserLocation = "userLocation";
  static const String idDeliveryLocation = "idDeliveryLocation";
  //checkout
  static const String idPaymentType = "idPaymentType";
  static const String idDeliveryType = "idDeliveryType";
  static const String idAddressType = "idAddressType";
  //notifiction
  static const String idDeleteIcon = "idDeleteIcon";
//choose option
  // static const String cachOption = "cachOption";
  // static const String paymentOption = "paymentOption";
  // static const String deliveryOption = "deliveryOption";
  // static const String receiveOption = "receiveOption";

  //topics
  static const String usersTopics = "users";
  //firebase store
  static const String collectionDelivery = "delivery";
}

abstract class ConstantLanguage {
  static const String ar = "ar";
  static const String en = "en";
}

abstract class ConstantTextFons {
  static const String englishFont = "PlayfairDisplay";
  static const String arabicFont = "Cairo";
  static const String sans = "sans"; //number fonts
}

abstract class ConstantText {
  static const String businessName = "King";
  static const String obscureText = "*";
  // static const String currencyPrice = '₹';
  // static const String currencyPayment = "inr";
  static const String currencyPrice = r'$';
  static const String currencyPayment = "usd";
  static const String phoneContactUs = "+1-555-010-999";
}
