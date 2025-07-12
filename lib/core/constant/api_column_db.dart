class ApiColumnDb {
  static const String id = "id";
  static const String customerId = 'customer_id';
  static const String username = "username";
  static const String email = "email";
  static const String password = "password";
  static const String phone = "phone";
  static const String verifyCode = "verify_code";
  static const String approve = "approve";
  static const String timeCreate = "time_create";
//home
  static const String userId = "user_id";
  static const String arabicName = "arabic_name";
  static const String englishName = "english_name";
  static const String image = "image";
//product
  static const String arabicDescription = "arabic_description";
  static const String englishDescription = "english_description";
  static const String productImage = "product_image";
  static const String countProduct = "countProduct";
  static const String count = "count";
  static const String active = "active";
  static const String price = "price";
  static const String discount = "discount";
  static const String discountPrice = "discountPrice";
  static const String categoryId = "category_id";
  static const String categoryArabicName = "category_arabic_name";
  static const String categoryEnglishName = "category_english_name";
  static const String categoryImage = "category_image";
  static const String categoryTimeCreate = "category_time_create";
//cart
  static const String productId = "product_id";
//Address
  static const String address = "address";
  static const String typeAddress = "type_address";
  static const String city = "city";
  static const String street = "street";
  static const String detailAddress = "detail_address";
  static const String latitude = "latitude";
  static const String longitude = "longitude";
//coupons
  static const String couponsName = "coupons_name";
  static const String amount = "amount";
  static const String expiryData = "expiry_date";
//order
  static const String addressId = 'address_id';
  static const String typePayment = 'type_payment';
  static const String typeDelivery = 'type_delivery';
  static const String deliveryPrice = 'delivery_price';
  static const String totalPrice = 'total_price';
  static const String status = "status";
  static const String rating = "rating";
  static const String couponsId = 'coupons_id';
  static const String productsData = "products_data";
//rating
  static const String orderId = "order_id";
  static const String star = "star";
  static const String comment = "comment";
//notification
  static const String title = "title";
  static const String body = "body";
//stripe api
  static const String object = 'object';
  static const String amountCapturable = 'amount_capturable';
  static const String amountReceived = 'amount_received';
  static const String clientSecret = 'client_secret';
  static const String currency = 'currency';
  static const String created = 'created';
  static const String captureMethod = 'capture_method';
  static const String confirmationMethod = 'confirmation_method';
  static const String livemode = 'livemode';
  static const String paymentMethodTypes = 'payment_method_types';
  static const String secretKey = 'secret_key';
  static const String customer = 'customer';

  static const String associatedObjects = 'associated_objects';
  static const String expires = 'expires';
  static const String secret = 'secret';
  static const String type = 'type';

  static const String balance = 'balance';
  static const String defaultSource = 'default_source';
  static const String delinquent = 'delinquent';
  static const String description = 'description';
  static const String invoicePrefix = 'invoice_prefix';
  static const String invoiceSettings = 'invoice_settings';
  static const String name = 'name';
  static const String nextInvoiceSequence = 'next_invoice_sequence';
  static const String preferredLocales = 'preferred_locales';
  static const String taxExempt = 'tax_exempt';

  static const String customFields = 'custom_fields';
  static const String defaultPaymentMethod = 'default_payment_method';
  static const String footer = 'footer';
  static const String renderingOptions = 'rendering_options';
}
