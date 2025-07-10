// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(count) =>
      "Are you sure you want to delete ${count} receipt(s)?";

  static String m1(count) => "Completed successfully With Total: ${count}";

  static String m2(error) => "⚠️ In-App Update Error: ${error}";

  static String m3(time) => "Last Checked : ${time}";

  static String m4(itemName, count) =>
      "${itemName} is low on stock (${count} left).";

  static String m5(count) => "Low stock items: ${count}";

  static String m6(itemName) => "${itemName} is out of stock.";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "NoItemsToDisplay": MessageLookupByLibrary.simpleMessage(
      "No items to display.",
    ),
    "about": MessageLookupByLibrary.simpleMessage("About"),
    "account": MessageLookupByLibrary.simpleMessage("Account"),
    "add": MessageLookupByLibrary.simpleMessage("Add"),
    "addExpense": MessageLookupByLibrary.simpleMessage("Add Expense"),
    "addFees": MessageLookupByLibrary.simpleMessage("Add Fees"),
    "addItem": MessageLookupByLibrary.simpleMessage("Add Item"),
    "addLoyalCustomersDetails": MessageLookupByLibrary.simpleMessage(
      "Add Loyal Customers Details.",
    ),
    "addNewCustomer": MessageLookupByLibrary.simpleMessage("Add new Customer"),
    "addNewItem": MessageLookupByLibrary.simpleMessage("Add New Item"),
    "addNewSupplier": MessageLookupByLibrary.simpleMessage("Add new Supplier"),
    "addQuantity": MessageLookupByLibrary.simpleMessage("Add Quantity"),
    "addShopDetails": MessageLookupByLibrary.simpleMessage("Add Shop Details."),
    "addToVault": MessageLookupByLibrary.simpleMessage("Add To Vault"),
    "addYourSuppliersDetails": MessageLookupByLibrary.simpleMessage(
      "Add Your Suppliers Details.",
    ),
    "addYourVaultAndExpenseDetails": MessageLookupByLibrary.simpleMessage(
      "Add Your Vault And Expense Details.",
    ),
    "allItemsAreInStock": MessageLookupByLibrary.simpleMessage(
      "All items are in stock",
    ),
    "allNotifications": MessageLookupByLibrary.simpleMessage(
      "All Notifications",
    ),
    "amount": MessageLookupByLibrary.simpleMessage("Amount"),
    "and": MessageLookupByLibrary.simpleMessage("and"),
    "appInfoAndUpdate": MessageLookupByLibrary.simpleMessage(
      "Application Info And Update.",
    ),
    "appIsAlreadyUpToDate": MessageLookupByLibrary.simpleMessage(
      "🎉 App is already up to date.",
    ),
    "appLanguage": MessageLookupByLibrary.simpleMessage("App Language."),
    "appSettings": MessageLookupByLibrary.simpleMessage("App Settings"),
    "appTitle": MessageLookupByLibrary.simpleMessage("InvoBay"),
    "appearance": MessageLookupByLibrary.simpleMessage("Appearance"),
    "apply": MessageLookupByLibrary.simpleMessage("Apply"),
    "areYouSureYouWantToDeleteAllData": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to delete all data?",
    ),
    "areYouSureYouWantToDeleteAllNotifications":
        MessageLookupByLibrary.simpleMessage(
          "Are you sure you want to delete all notifications?",
        ),
    "areYouSureYouWantToDeleteThis": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to delete this?",
    ),
    "areYouSureYouWantToDeleteThisCustomer":
        MessageLookupByLibrary.simpleMessage(
          "Are you sure you want to delete this customer?",
        ),
    "areYouSureYouWantToDeleteThisItem": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to delete this item?",
    ),
    "areYouSureYouWantToDeleteThisReceipt":
        MessageLookupByLibrary.simpleMessage(
          "Are you sure you want to delete this receipt?",
        ),
    "areYouSureYouWantToDeleteThisSupplier":
        MessageLookupByLibrary.simpleMessage(
          "Are you sure you want to delete this supplier?",
        ),
    "areYouSureYouWantToDeleteWithCount": m0,
    "averageCostPerItem": MessageLookupByLibrary.simpleMessage(
      "Average Cost Per Item",
    ),
    "avgCost": MessageLookupByLibrary.simpleMessage("Avg Cost"),
    "backupComplete": MessageLookupByLibrary.simpleMessage("Backup complete!"),
    "backupData": MessageLookupByLibrary.simpleMessage("Backup Data"),
    "backupDataToYourLocalStorage": MessageLookupByLibrary.simpleMessage(
      "Backup Data To Your Local Storage.",
    ),
    "backupFailed": MessageLookupByLibrary.simpleMessage("Backup failed"),
    "bankTransfer": MessageLookupByLibrary.simpleMessage("Bank Transfer"),
    "barcode": MessageLookupByLibrary.simpleMessage("Barcode"),
    "boughtItems": MessageLookupByLibrary.simpleMessage("Bought Items"),
    "buy": MessageLookupByLibrary.simpleMessage("Buy"),
    "buyCheckout": MessageLookupByLibrary.simpleMessage("Buy Checkout"),
    "buyCheckoutSuccessful": MessageLookupByLibrary.simpleMessage(
      "Buy Checkout Successful",
    ),
    "buyReceipts": MessageLookupByLibrary.simpleMessage("Buy Receipts"),
    "buyingPrice": MessageLookupByLibrary.simpleMessage("Buying Price"),
    "buyingTotal": MessageLookupByLibrary.simpleMessage("Buying Total"),
    "cOGS": MessageLookupByLibrary.simpleMessage("COGS"),
    "call": MessageLookupByLibrary.simpleMessage("Call"),
    "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
    "cart": MessageLookupByLibrary.simpleMessage("Cart"),
    "cash": MessageLookupByLibrary.simpleMessage("Cash"),
    "change": MessageLookupByLibrary.simpleMessage("Change"),
    "changeDiscountType": MessageLookupByLibrary.simpleMessage(
      "Change Discount Type",
    ),
    "changeEncryptionKey": MessageLookupByLibrary.simpleMessage(
      "Change Encryption Key",
    ),
    "changeProfilePicture": MessageLookupByLibrary.simpleMessage(
      "Change Profile Picture",
    ),
    "changeRange": MessageLookupByLibrary.simpleMessage("change range"),
    "checkForUpdate": MessageLookupByLibrary.simpleMessage("Check For Update"),
    "checking": MessageLookupByLibrary.simpleMessage("Checking..."),
    "checkout": MessageLookupByLibrary.simpleMessage("Checkout"),
    "checkoutReview": MessageLookupByLibrary.simpleMessage("Checkout Review"),
    "checkoutSummary": MessageLookupByLibrary.simpleMessage("Checkout Summary"),
    "city": MessageLookupByLibrary.simpleMessage("City"),
    "clearAll": MessageLookupByLibrary.simpleMessage("Clear All"),
    "clearFilters": MessageLookupByLibrary.simpleMessage("Clear Filters"),
    "close": MessageLookupByLibrary.simpleMessage("Close"),
    "completed": MessageLookupByLibrary.simpleMessage("Completed"),
    "completedSuccessfullyWithTotal": m1,
    "confirm": MessageLookupByLibrary.simpleMessage("Confirm"),
    "confirmDeletion": MessageLookupByLibrary.simpleMessage("Confirm Deletion"),
    "continue1": MessageLookupByLibrary.simpleMessage("Continue"),
    "couldNotCheckForUpdate": MessageLookupByLibrary.simpleMessage(
      "⚠️ Could not check for update.",
    ),
    "country": MessageLookupByLibrary.simpleMessage("Country"),
    "creatingBackup": MessageLookupByLibrary.simpleMessage(
      "Creating backup...",
    ),
    "currency": MessageLookupByLibrary.simpleMessage("Currency."),
    "currencyUpdatedTo": MessageLookupByLibrary.simpleMessage(
      "Currency updated to",
    ),
    "customer": MessageLookupByLibrary.simpleMessage("Customer"),
    "customerAction": MessageLookupByLibrary.simpleMessage("Customer Action"),
    "customerAddedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Customer added successfully",
    ),
    "customerAddress": MessageLookupByLibrary.simpleMessage("Customer Address"),
    "customerDebts": MessageLookupByLibrary.simpleMessage("Customer Debts"),
    "customerDeletedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Customer Deleted Successfully",
    ),
    "customerWithThisNameAlreadyExists": MessageLookupByLibrary.simpleMessage(
      "Customer with this name already exists.",
    ),
    "customers": MessageLookupByLibrary.simpleMessage("Customers"),
    "dark": MessageLookupByLibrary.simpleMessage("Dark"),
    "data": MessageLookupByLibrary.simpleMessage("data"),
    "dataSettings": MessageLookupByLibrary.simpleMessage("Data Settings"),
    "date": MessageLookupByLibrary.simpleMessage("Date"),
    "dateOfBirth": MessageLookupByLibrary.simpleMessage("Date of Birth"),
    "debt": MessageLookupByLibrary.simpleMessage("Debt"),
    "debtAmount": MessageLookupByLibrary.simpleMessage("Debt Amount"),
    "delete": MessageLookupByLibrary.simpleMessage("Delete"),
    "deleteAccount": MessageLookupByLibrary.simpleMessage("Delete Account"),
    "deleteData": MessageLookupByLibrary.simpleMessage("Delete Data"),
    "deleteDataFromYourLocalStorage": MessageLookupByLibrary.simpleMessage(
      "Delete Data From Your Local Storage.",
    ),
    "description": MessageLookupByLibrary.simpleMessage("Description"),
    "details": MessageLookupByLibrary.simpleMessage("Details"),
    "discount": MessageLookupByLibrary.simpleMessage("Discount"),
    "discountAmountHere": MessageLookupByLibrary.simpleMessage(
      "Discount amount here.",
    ),
    "discountCannotExceedSubtotal": MessageLookupByLibrary.simpleMessage(
      "Discount cannot exceed subtotal",
    ),
    "discountPercentHere": MessageLookupByLibrary.simpleMessage(
      "Discount % here.",
    ),
    "display": MessageLookupByLibrary.simpleMessage("Display"),
    "done": MessageLookupByLibrary.simpleMessage("Done"),
    "downloadingUpdate": MessageLookupByLibrary.simpleMessage(
      "🔄 Downloading update...",
    ),
    "edit": MessageLookupByLibrary.simpleMessage("Edit"),
    "editAddition": MessageLookupByLibrary.simpleMessage("Edit Addition"),
    "editBuyPayment": MessageLookupByLibrary.simpleMessage("Edit Buy Payment"),
    "editCustomer": MessageLookupByLibrary.simpleMessage("Edit Customer"),
    "editExpense": MessageLookupByLibrary.simpleMessage("Edit Expense"),
    "editItem": MessageLookupByLibrary.simpleMessage("Edit Item"),
    "editReturnPayment": MessageLookupByLibrary.simpleMessage(
      "Edit Return Payment",
    ),
    "editSalePayment": MessageLookupByLibrary.simpleMessage(
      "Edit Sale Payment",
    ),
    "editSupplier": MessageLookupByLibrary.simpleMessage("Edit Supplier"),
    "editTaxPercentage": MessageLookupByLibrary.simpleMessage(
      "Edit Tax Percentage",
    ),
    "editVaultBalance": MessageLookupByLibrary.simpleMessage(
      "Edit Vault Balance",
    ),
    "email": MessageLookupByLibrary.simpleMessage("E-mail"),
    "encryptionKey": MessageLookupByLibrary.simpleMessage("Encryption Key"),
    "encryptionKeyMustBe32": MessageLookupByLibrary.simpleMessage(
      "Encryption key must be 32 characters for AES-256.",
    ),
    "encryptionKeyUpdated": MessageLookupByLibrary.simpleMessage(
      "Encryption key updated!",
    ),
    "enterCustomerName": MessageLookupByLibrary.simpleMessage(
      "Enter customer name",
    ),
    "enterNewSellingPrice": MessageLookupByLibrary.simpleMessage(
      "Enter new selling price",
    ),
    "enterQuantity": MessageLookupByLibrary.simpleMessage("Enter Quantity"),
    "enterSupplierName": MessageLookupByLibrary.simpleMessage(
      "Enter supplier name",
    ),
    "enterTaxPercentage": MessageLookupByLibrary.simpleMessage(
      "Enter tax percentage",
    ),
    "enterValidNumber": MessageLookupByLibrary.simpleMessage(
      "Enter a valid number",
    ),
    "enterValidPositiveNumber": MessageLookupByLibrary.simpleMessage(
      "Enter a valid positive number.",
    ),
    "enterValues": MessageLookupByLibrary.simpleMessage("Enter Values"),
    "error": MessageLookupByLibrary.simpleMessage("Error"),
    "errorAddingCustomer": MessageLookupByLibrary.simpleMessage(
      "Error Adding Customer",
    ),
    "errorAddingSupplier": MessageLookupByLibrary.simpleMessage(
      "Error adding supplier",
    ),
    "errorDeletingCustomer": MessageLookupByLibrary.simpleMessage(
      "Error Deleting Customer",
    ),
    "errorDeletingSupplier": MessageLookupByLibrary.simpleMessage(
      "Error Deleting Supplier",
    ),
    "errorFetchingUpdateInfo": MessageLookupByLibrary.simpleMessage(
      "Error fetching update info",
    ),
    "errorGettingAppVersion": MessageLookupByLibrary.simpleMessage(
      "Error getting app version:",
    ),
    "errorLoadingCustomer": MessageLookupByLibrary.simpleMessage(
      "Error loading customer",
    ),
    "errorLoadingPaymentMethods": MessageLookupByLibrary.simpleMessage(
      "Error loading payment methods:",
    ),
    "errorLoadingReceiptDetails": MessageLookupByLibrary.simpleMessage(
      "Error loading receipt details",
    ),
    "errorLoadingReceipts": MessageLookupByLibrary.simpleMessage(
      "Error loading receipts",
    ),
    "errorLoadingShopDetails": MessageLookupByLibrary.simpleMessage(
      "Error loading shop details",
    ),
    "errorLoadingSupplier": MessageLookupByLibrary.simpleMessage(
      "Error loading supplier",
    ),
    "errorLoadingTax": MessageLookupByLibrary.simpleMessage(
      "Error loading tax:",
    ),
    "exceedTotalAmount": MessageLookupByLibrary.simpleMessage(
      "Exceed total amount",
    ),
    "expenses": MessageLookupByLibrary.simpleMessage("Expenses"),
    "failedToLoadVersion": MessageLookupByLibrary.simpleMessage(
      "Failed to load version",
    ),
    "fix": MessageLookupByLibrary.simpleMessage("Fix"),
    "from": MessageLookupByLibrary.simpleMessage("From"),
    "gender": MessageLookupByLibrary.simpleMessage("Gender"),
    "general": MessageLookupByLibrary.simpleMessage("General"),
    "grossRevenue": MessageLookupByLibrary.simpleMessage("Gross Revenue"),
    "iAgreeTo": MessageLookupByLibrary.simpleMessage("I agree to"),
    "inAppUpdateError": m2,
    "inStock": MessageLookupByLibrary.simpleMessage("In Stock"),
    "invalidBackupFilePleaseSelectInvobakFile":
        MessageLookupByLibrary.simpleMessage(
          "Invalid backup file. Please select a .invobak file.",
        ),
    "invalidPrice": MessageLookupByLibrary.simpleMessage("Invalid Price"),
    "invalidQuantity": MessageLookupByLibrary.simpleMessage(
      "Invalid quantity.",
    ),
    "invalidQuantityEnterNumberWithMaxDecimals":
        MessageLookupByLibrary.simpleMessage(
          "Enter a number with max 2 decimals.",
        ),
    "inventory": MessageLookupByLibrary.simpleMessage("Inventory"),
    "inventoryValue": MessageLookupByLibrary.simpleMessage("Inventory Value"),
    "isLowOnStock": MessageLookupByLibrary.simpleMessage("is low on stock"),
    "isOutOfStock": MessageLookupByLibrary.simpleMessage("is out of stock"),
    "itemAddedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Item added successfully",
    ),
    "itemDetails": MessageLookupByLibrary.simpleMessage("Item Details"),
    "itemNotFound": MessageLookupByLibrary.simpleMessage("Item not found!"),
    "itemReceiptsDetails": MessageLookupByLibrary.simpleMessage(
      "Item Receipts Details",
    ),
    "itemRemovedFromInventory": MessageLookupByLibrary.simpleMessage(
      "Item removed from inventory",
    ),
    "itemStockLooksGood": MessageLookupByLibrary.simpleMessage(
      "Items stock looks good",
    ),
    "itemUnit": MessageLookupByLibrary.simpleMessage("Item Unit"),
    "lastChecked": m3,
    "lastWeek": MessageLookupByLibrary.simpleMessage("Last Week"),
    "less": MessageLookupByLibrary.simpleMessage("Less"),
    "light": MessageLookupByLibrary.simpleMessage("Light"),
    "loadData": MessageLookupByLibrary.simpleMessage("Load Data"),
    "loadDataFromYourLocalStorage": MessageLookupByLibrary.simpleMessage(
      "Load Data From Your Local Storage.",
    ),
    "loading": MessageLookupByLibrary.simpleMessage("Loading"),
    "loadingItem": MessageLookupByLibrary.simpleMessage("Loading item..."),
    "logout": MessageLookupByLibrary.simpleMessage("Logout"),
    "lowStock": MessageLookupByLibrary.simpleMessage("Low Stock"),
    "lowStockAlert": MessageLookupByLibrary.simpleMessage("Low Stock Alert"),
    "lowStockItemWithQuantity": m4,
    "lowStockItems": MessageLookupByLibrary.simpleMessage("Low Stock Items"),
    "lowStockItemsWithCount": m5,
    "lowStockThreshold": MessageLookupByLibrary.simpleMessage(
      "Low Stock Threshold.",
    ),
    "lowStockThresholdUpdatedSaved": MessageLookupByLibrary.simpleMessage(
      "Low stock threshold updated and saved",
    ),
    "masterCard": MessageLookupByLibrary.simpleMessage("MasterCard"),
    "more": MessageLookupByLibrary.simpleMessage("More"),
    "moreInfo": MessageLookupByLibrary.simpleMessage("More Info"),
    "mostBoughtItems": MessageLookupByLibrary.simpleMessage(
      "Most Bought Items",
    ),
    "mostReturnedItems": MessageLookupByLibrary.simpleMessage(
      "Most returned items",
    ),
    "mostSoldItems": MessageLookupByLibrary.simpleMessage("Most Sold Items"),
    "mustBeCharacterLong": MessageLookupByLibrary.simpleMessage(
      "Must be 32 character long.",
    ),
    "mustRestartTheAppForChangesToTakeEffect":
        MessageLookupByLibrary.simpleMessage(
          "*Must restart the app for changes to take effect",
        ),
    "name": MessageLookupByLibrary.simpleMessage("Name"),
    "newBuyingPrice": MessageLookupByLibrary.simpleMessage("New Buying Price"),
    "newPayment": MessageLookupByLibrary.simpleMessage("New Payment"),
    "newSellingPrice": MessageLookupByLibrary.simpleMessage(
      "New Selling Price",
    ),
    "newStockItems": MessageLookupByLibrary.simpleMessage("New Stock Items"),
    "noCurrenciesFound": MessageLookupByLibrary.simpleMessage(
      "No currencies found.",
    ),
    "noDataAvailable": MessageLookupByLibrary.simpleMessage(
      "No data available.",
    ),
    "noDebtorsFound": MessageLookupByLibrary.simpleMessage("No debtors found."),
    "noItemsFound": MessageLookupByLibrary.simpleMessage("No items found"),
    "noItemsSoldYet": MessageLookupByLibrary.simpleMessage(
      "No items sold yet.",
    ),
    "noLowStock": MessageLookupByLibrary.simpleMessage("No Low Stock"),
    "noNotificationYet": MessageLookupByLibrary.simpleMessage(
      "No notifications yet.",
    ),
    "noOutOfStock": MessageLookupByLibrary.simpleMessage("No Out of Stock"),
    "noReceiptsFound": MessageLookupByLibrary.simpleMessage(
      "No receipts found.",
    ),
    "noReturnableItemsFound": MessageLookupByLibrary.simpleMessage(
      "No returnable items found",
    ),
    "noReturnedItemsFound": MessageLookupByLibrary.simpleMessage(
      "No returned items found.",
    ),
    "noUpdateCheckRecordedYet": MessageLookupByLibrary.simpleMessage(
      "No update check recorded yet.",
    ),
    "notFound": MessageLookupByLibrary.simpleMessage("Not found!"),
    "noteOptional": MessageLookupByLibrary.simpleMessage("Note (optional)"),
    "notification": MessageLookupByLibrary.simpleMessage("Notification"),
    "notificationSettings": MessageLookupByLibrary.simpleMessage(
      "Notification Settings",
    ),
    "notifications": MessageLookupByLibrary.simpleMessage("Notifications"),
    "ok": MessageLookupByLibrary.simpleMessage("OK"),
    "older": MessageLookupByLibrary.simpleMessage("Older"),
    "onBoardingFooterText": MessageLookupByLibrary.simpleMessage(
      "Stay organized and in control with a secure vault and much more—all in one app.",
    ),
    "onBoardingHeaderText": MessageLookupByLibrary.simpleMessage(
      "Effortlessly manage your inventory with features for tracking:",
    ),
    "openSourceLicense": MessageLookupByLibrary.simpleMessage(
      "Open Source License",
    ),
    "orderTotal": MessageLookupByLibrary.simpleMessage("Order Total"),
    "outOfStock": MessageLookupByLibrary.simpleMessage("Out of Stock"),
    "outOfStock2": MessageLookupByLibrary.simpleMessage("Out of Stock"),
    "outOfStockAlert": MessageLookupByLibrary.simpleMessage(
      "Out of Stock Alert",
    ),
    "outOfStockItemWithName": m6,
    "outOfStockItems": MessageLookupByLibrary.simpleMessage(
      "Out of Stock Items",
    ),
    "pageNotFound": MessageLookupByLibrary.simpleMessage("Page Not Found"),
    "paidAmount": MessageLookupByLibrary.simpleMessage("Paid Amount"),
    "paymentMethod": MessageLookupByLibrary.simpleMessage("Payment Method"),
    "pcs": MessageLookupByLibrary.simpleMessage("pcs"),
    "pending": MessageLookupByLibrary.simpleMessage("Pending"),
    "percentage": MessageLookupByLibrary.simpleMessage("Percentage %"),
    "percentageCannotExceed100": MessageLookupByLibrary.simpleMessage(
      "Percentage cannot exceed 100%",
    ),
    "personalInformation": MessageLookupByLibrary.simpleMessage(
      "Personal Information",
    ),
    "personalizeTheAppToYourLiking": MessageLookupByLibrary.simpleMessage(
      "Personalize The App To Your Liking.",
    ),
    "phoneNumber": MessageLookupByLibrary.simpleMessage("Phone Number"),
    "phoneNumberOptional": MessageLookupByLibrary.simpleMessage(
      "Phone Number (Optional)",
    ),
    "pleaseEnterAmount": MessageLookupByLibrary.simpleMessage(
      "Please enter an amount",
    ),
    "pleaseEnterName": MessageLookupByLibrary.simpleMessage(
      "Please enter a name",
    ),
    "pleaseEnterValidPriceGreaterThanBuyingPrice":
        MessageLookupByLibrary.simpleMessage(
          "Please enter a valid price greater than buying price.",
        ),
    "pleaseFillAllTheFieldsCorrectly": MessageLookupByLibrary.simpleMessage(
      "Please fill all the fields correctly",
    ),
    "price": MessageLookupByLibrary.simpleMessage("Price"),
    "privacyPolicy": MessageLookupByLibrary.simpleMessage("Privacy Policy"),
    "proceedToCheckout": MessageLookupByLibrary.simpleMessage(
      "Proceed to checkout",
    ),
    "profile": MessageLookupByLibrary.simpleMessage("Profile"),
    "profileInformation": MessageLookupByLibrary.simpleMessage(
      "Profile Information",
    ),
    "profitAndLossStatement": MessageLookupByLibrary.simpleMessage(
      "Profit & Loss Statement",
    ),
    "profitLoss": MessageLookupByLibrary.simpleMessage("Profit / Loss"),
    "profitMargin": MessageLookupByLibrary.simpleMessage("Profit Margin"),
    "qty": MessageLookupByLibrary.simpleMessage("Qty"),
    "qtySold": MessageLookupByLibrary.simpleMessage("Qty Sold"),
    "quantity": MessageLookupByLibrary.simpleMessage("Quantity"),
    "receiptDetails": MessageLookupByLibrary.simpleMessage("Receipt Details"),
    "receiptNo": MessageLookupByLibrary.simpleMessage("Receipt No"),
    "receiptSavedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Receipt saved successfully",
    ),
    "receipts": MessageLookupByLibrary.simpleMessage("Receipts"),
    "receiptsAndSuppliers": MessageLookupByLibrary.simpleMessage(
      "Receipts & Suppliers",
    ),
    "receiptsWithHigherBuyingPrices": MessageLookupByLibrary.simpleMessage(
      "Receipts with higher buying prices:",
    ),
    "removed": MessageLookupByLibrary.simpleMessage("removed"),
    "reports": MessageLookupByLibrary.simpleMessage("Reports"),
    "restartingIn": MessageLookupByLibrary.simpleMessage("Restarting in"),
    "restoreCancelled": MessageLookupByLibrary.simpleMessage(
      "Restore cancelled.",
    ),
    "restoreCompleteRestarting": MessageLookupByLibrary.simpleMessage(
      "Restore complete! Restarting in",
    ),
    "restoreFailed": MessageLookupByLibrary.simpleMessage("Restore failed:"),
    "restoring": MessageLookupByLibrary.simpleMessage("Restoring..."),
    "returnCheckout": MessageLookupByLibrary.simpleMessage("Return Checkout"),
    "returnCheckoutSuccessful": MessageLookupByLibrary.simpleMessage(
      "Return Checkout Successful",
    ),
    "returnLoss": MessageLookupByLibrary.simpleMessage("Return Loss"),
    "returnReceipts": MessageLookupByLibrary.simpleMessage("Return Receipts"),
    "returned": MessageLookupByLibrary.simpleMessage("returned"),
    "returnedItems": MessageLookupByLibrary.simpleMessage("Returned Items"),
    "returns": MessageLookupByLibrary.simpleMessage("Return"),
    "sales": MessageLookupByLibrary.simpleMessage("Sales"),
    "salesByPaymentMethod": MessageLookupByLibrary.simpleMessage(
      "Sales by Payment Method",
    ),
    "salesVsPurchases": MessageLookupByLibrary.simpleMessage(
      "Sales vs Purchases",
    ),
    "save": MessageLookupByLibrary.simpleMessage("Save"),
    "saveCustomer": MessageLookupByLibrary.simpleMessage("Save Customer"),
    "saveSupplier": MessageLookupByLibrary.simpleMessage("Save Supplier"),
    "scanQRCode": MessageLookupByLibrary.simpleMessage("Scan QR Code"),
    "searchAndAddItems": MessageLookupByLibrary.simpleMessage(
      "Search and Add Items",
    ),
    "searchInStock": MessageLookupByLibrary.simpleMessage("Search in stock"),
    "selectAppLanguage": MessageLookupByLibrary.simpleMessage(
      "Select App Language",
    ),
    "selectCurrency": MessageLookupByLibrary.simpleMessage("Select Currency"),
    "selectCustomer": MessageLookupByLibrary.simpleMessage("Select a Customer"),
    "selectPaymentMethod": MessageLookupByLibrary.simpleMessage(
      "Select Payment Method",
    ),
    "selectReceiptType": MessageLookupByLibrary.simpleMessage(
      "Select Receipt Type",
    ),
    "selectSupplier": MessageLookupByLibrary.simpleMessage("Select a Supplier"),
    "selected": MessageLookupByLibrary.simpleMessage("selected"),
    "sell": MessageLookupByLibrary.simpleMessage("Sell"),
    "sellCheckout": MessageLookupByLibrary.simpleMessage("Sell Checkout"),
    "sellCheckoutSuccessful": MessageLookupByLibrary.simpleMessage(
      "Sell Checkout Successful",
    ),
    "sellReceipts": MessageLookupByLibrary.simpleMessage("Sell Receipts"),
    "sellingPrice": MessageLookupByLibrary.simpleMessage("Selling Price"),
    "sellingPriceMustBeGreaterThanBuyingPrice":
        MessageLookupByLibrary.simpleMessage(
          "Selling price must be greater than buying Price.",
        ),
    "sellingTotal": MessageLookupByLibrary.simpleMessage("Selling Total"),
    "setAnyKindOfNotificationMessage": MessageLookupByLibrary.simpleMessage(
      "Set Any Kind Of Notification Message.",
    ),
    "settings": MessageLookupByLibrary.simpleMessage("Settings"),
    "shippingFee": MessageLookupByLibrary.simpleMessage("Shipping Fee"),
    "shopDetails": MessageLookupByLibrary.simpleMessage("Shop Details"),
    "shopDetailsSaved": MessageLookupByLibrary.simpleMessage(
      "Shop Details Saved",
    ),
    "shopName": MessageLookupByLibrary.simpleMessage("Shop Name"),
    "shopSettings": MessageLookupByLibrary.simpleMessage("Shop Settings"),
    "shouldBeGreaterThanCurrentBuyingPrice":
        MessageLookupByLibrary.simpleMessage(
          "Should Be Greater Than Current Buying Price.",
        ),
    "showMore": MessageLookupByLibrary.simpleMessage("Show more"),
    "soldItems": MessageLookupByLibrary.simpleMessage("Sold Items"),
    "state": MessageLookupByLibrary.simpleMessage("State"),
    "status": MessageLookupByLibrary.simpleMessage("Status"),
    "stock": MessageLookupByLibrary.simpleMessage("Stock"),
    "stockStatus": MessageLookupByLibrary.simpleMessage("Stock Status"),
    "street": MessageLookupByLibrary.simpleMessage("Street"),
    "subtotal": MessageLookupByLibrary.simpleMessage("Subtotal"),
    "subtotalPrice": MessageLookupByLibrary.simpleMessage("Subtotal Price"),
    "success": MessageLookupByLibrary.simpleMessage("Success"),
    "summary": MessageLookupByLibrary.simpleMessage("Summary"),
    "supplier": MessageLookupByLibrary.simpleMessage("Supplier"),
    "supplierAction": MessageLookupByLibrary.simpleMessage("Supplier Action"),
    "supplierAddedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Supplier added successfully",
    ),
    "supplierAddress": MessageLookupByLibrary.simpleMessage("Supplier Address"),
    "supplierDebts": MessageLookupByLibrary.simpleMessage("Supplier Debts"),
    "supplierDeletedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Supplier Deleted Successfully",
    ),
    "supplierWithThisNameAlreadyExists": MessageLookupByLibrary.simpleMessage(
      "Supplier with this name already exists.",
    ),
    "suppliers": MessageLookupByLibrary.simpleMessage("Suppliers"),
    "switchBetweenPercentageFixedAmount": MessageLookupByLibrary.simpleMessage(
      "Switch between percentage and fixed amount.",
    ),
    "syncData": MessageLookupByLibrary.simpleMessage("Sync Data"),
    "syncDataToTheCloud": MessageLookupByLibrary.simpleMessage(
      "Sync Data To The Cloud.",
    ),
    "system": MessageLookupByLibrary.simpleMessage("System"),
    "tax": MessageLookupByLibrary.simpleMessage("Tax %"),
    "taxCollected": MessageLookupByLibrary.simpleMessage("Tax Collected"),
    "taxFee": MessageLookupByLibrary.simpleMessage("Tax Fee"),
    "taxPercentage": MessageLookupByLibrary.simpleMessage("Tax Percentage."),
    "taxPercentageUpdatedSaved": MessageLookupByLibrary.simpleMessage(
      "Tax percentage updated and saved",
    ),
    "termsOfUse": MessageLookupByLibrary.simpleMessage("Terms of use"),
    "theme": MessageLookupByLibrary.simpleMessage("Theme:"),
    "thisFieldIsRequired": MessageLookupByLibrary.simpleMessage(
      "This field is required",
    ),
    "thisIsTheFirstVersionOfTheApp": MessageLookupByLibrary.simpleMessage(
      "This is the first version of the app.",
    ),
    "thisMonth": MessageLookupByLibrary.simpleMessage("This Month"),
    "thisWillPermanentlyDeleteThisTransaction":
        MessageLookupByLibrary.simpleMessage(
          "This will permanently delete this transaction.",
        ),
    "thresholdValue": MessageLookupByLibrary.simpleMessage("Threshold Value"),
    "to": MessageLookupByLibrary.simpleMessage("To"),
    "today": MessageLookupByLibrary.simpleMessage("Today"),
    "top": MessageLookupByLibrary.simpleMessage("Top"),
    "topCostumers": MessageLookupByLibrary.simpleMessage("Top Costumers"),
    "topSuppliers": MessageLookupByLibrary.simpleMessage("Top Suppliers"),
    "total": MessageLookupByLibrary.simpleMessage("Total"),
    "totalAmount": MessageLookupByLibrary.simpleMessage("Total Amount"),
    "totalIn": MessageLookupByLibrary.simpleMessage("Total In"),
    "totalOut": MessageLookupByLibrary.simpleMessage("Total Out"),
    "undo": MessageLookupByLibrary.simpleMessage("Undo"),
    "unit_bag": MessageLookupByLibrary.simpleMessage("Bag"),
    "unit_kg": MessageLookupByLibrary.simpleMessage("KG"),
    "unit_liter": MessageLookupByLibrary.simpleMessage("Liter"),
    "unit_meter": MessageLookupByLibrary.simpleMessage("Meter"),
    "unit_piece": MessageLookupByLibrary.simpleMessage("Piece"),
    "unknownCustomer": MessageLookupByLibrary.simpleMessage("Unknown Customer"),
    "unknownSupplier": MessageLookupByLibrary.simpleMessage("Unknown Supplier"),
    "update": MessageLookupByLibrary.simpleMessage("Update"),
    "updateAvailable": MessageLookupByLibrary.simpleMessage("Update Available"),
    "updateBuyingPrice": MessageLookupByLibrary.simpleMessage(
      "Update Buying Price",
    ),
    "updateCustomer": MessageLookupByLibrary.simpleMessage("Update Customer"),
    "updateDownloadedPleaseRestartTheApp": MessageLookupByLibrary.simpleMessage(
      "✅ Update downloaded. Please restart the app.",
    ),
    "updateItem": MessageLookupByLibrary.simpleMessage("Update Item"),
    "updateSellingPrice": MessageLookupByLibrary.simpleMessage(
      "Update Selling Price",
    ),
    "updateSupplier": MessageLookupByLibrary.simpleMessage("Update Supplier"),
    "userId": MessageLookupByLibrary.simpleMessage("User ID"),
    "username": MessageLookupByLibrary.simpleMessage("Username"),
    "vaultBalance": MessageLookupByLibrary.simpleMessage("Vault Balance"),
    "vaultExpense": MessageLookupByLibrary.simpleMessage("Vault / Expense"),
    "vaultNotFound": MessageLookupByLibrary.simpleMessage("Vault not found"),
    "version": MessageLookupByLibrary.simpleMessage("Version"),
    "warningWhenStockThreshold": MessageLookupByLibrary.simpleMessage(
      "warning when stock ≤ threshold",
    ),
    "welcome": MessageLookupByLibrary.simpleMessage("Welcome"),
    "welcomeBack": MessageLookupByLibrary.simpleMessage("Welcome back"),
    "welcomeTo": MessageLookupByLibrary.simpleMessage("Welcome To"),
    "yesterday": MessageLookupByLibrary.simpleMessage("Yesterday"),
    "yourInventoryIsEmpty": MessageLookupByLibrary.simpleMessage(
      "Your Inventory is Empty",
    ),
    "yourListIsEmpty": MessageLookupByLibrary.simpleMessage(
      "Your list is Empty!",
    ),
  };
}
