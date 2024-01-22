class BaseURL {
  //API dev
  // static const String base_url = "https://flutter.aicoju.com/";

  // API product kidkul
  static const String base_url = "https://api-kidkul.aicoju.com/";

  // API product aicoju
  // static const String base_url = "https://api-pay.aicoju.com/";

  static const String getAccount = "${base_url}api/accounts/get-all";
  static const String getUserReceipt = "${base_url}api/user-receipts/get-all";
  static const String login = "${base_url}api/auth/login";
  static const String changePasswrod = "${base_url}api/accounts/reset-password";
  static const String getTotalPrice = "${base_url}api/user-receipts/total-price";
  static const String getRequest = "${base_url}api/requests/get-all";
  static const String getNotificationUnread = "${base_url}api/notification/count-unread-notifications";
  static const String sendRequest = "${base_url}/api/requests/store";

  static String? access_token;

}