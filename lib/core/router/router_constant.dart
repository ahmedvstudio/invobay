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
  static const String itemBuyReceipts = 'itemBuyReceipts';

  // - Sell
  static const String sell = 'sell';
  static const String sellCheckout = 'sellCheckout';
  static const String sellReceipts = 'sellReceipts';
  static const String sellReceiptsDetails = 'sellReceiptsDetails';
  static const String sellReceiptsSuccess = 'sellReceiptsSuccess';

  // - Buy
  static const String buy = 'buy';
  static const String buyCheckout = 'buyCheckout';
  static const String buyReceipts = 'buyReceipts';
  static const String buyReceiptsDetails = 'buyReceiptsDetails';
  static const String buyReceiptsSuccess = 'buyReceiptsSuccess';

  // - Return
  static const String returns = 'returns';
  static const String returnsCheckout = 'returnsCheckout';
  static const String returnsReceipts = 'returnsReceipts';
  static const String returnsReceiptsDetails = 'returnsReceiptsDetails';
  static const String returnsReceiptsSuccess = 'returnsReceiptsSuccess';

  // - Receipts
  static const String receipts = 'receipts';
  static const String returnReceipts = 'returnReceipts';
  static const String returnCheckout = 'returnCheckout';

  // - Settings
  static const String settings = 'settings';
  static const String shopDetails = 'shopDetails';
  static const String appearance = 'appearance';
  static const String appLanguage = 'appLanguage';
  static const String profile = 'profile';
  static const String backupRestore = 'backupRestore';
  static const String about = 'about';

  // - Customer
  static const String customers = 'customers';
  static const String addNewCustomer = 'addNewCustomer';
  static const String editCustomer = 'editCustomer';

  // - Supplier
  static const String suppliers = 'suppliers';
  static const String addNewSupplier = 'addNewSupplier';
  static const String editSupplier = 'editSupplier';

  // - Reports
  static const String reports = 'reports';
  static const String newStockItems = 'newStockItems';
  static const String lowStockItems = 'lowStockItems';
  static const String outOfStockItems = 'outOfStockItems';

  // - Vault / Expenses
  static const String vault = 'vault';

  // -
  static const String notification = 'notification';
}
