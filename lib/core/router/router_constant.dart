class VRouter {
  VRouter._();
  static const String home = 'home';
  // - Auth
  static const String login = 'login';
  static const String signup = 'signup';
  static const String resetPass = 'resetPassword';
  static const String forgetPass = 'forgetPassword';

  // - Home
  static const String dashboard = 'home';
  static const String lowStockScreen = 'lowStockScreen';

  // - Inventory
  static const String inventory = 'inventory';
  static const String addItem = 'addItem';
  static const String editItem = 'editItem';
  static const String search = 'search';
  static const String itemDetail = 'itemDetail';

  // - Sell
  static const String sell = 'sell';
  static const String sellCheckout = 'sellCheckout';
  static const String buyCheckout = 'buyCheckout';
  static const String returnCheckout = 'returnCheckout';

  // - Receipts
  static const String receipts = 'receipts';
  static const String sellReceipts = 'sellReceipts';
  static const String buyReceipts = 'buyReceipts';
  static const String returnReceipts = 'returnReceipts';

  // - Settings
  static const String settings = 'settings';
  static const String profile = 'profile';
  static const String customers = 'customers';
  static const String addNewCustomer = 'addNewCustomer';
  static const String suppliers = 'suppliers';
  static const String addNewSupplier = 'addNewSupplier';

  ///
  static const String orders = 'orders';

  // -
  static const String buy = 'buy';
  static const String returns = 'returns';
  static const String reports = 'reports';
  static const String notification = 'notification';
}
