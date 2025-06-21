// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `InvoBay`
  String get appTitle {
    return Intl.message('InvoBay', name: 'appTitle', desc: '', args: []);
  }

  /// `Welcome`
  String get welcome {
    return Intl.message('Welcome', name: 'welcome', desc: '', args: []);
  }

  /// `Search in stock`
  String get searchInStock {
    return Intl.message(
      'Search in stock',
      name: 'searchInStock',
      desc: '',
      args: [],
    );
  }

  /// `Items stock looks good`
  String get itemStockLooksGood {
    return Intl.message(
      'Items stock looks good',
      name: 'itemStockLooksGood',
      desc: '',
      args: [],
    );
  }

  /// `Low stock items: {count}`
  String lowStockItemsWithCount(Object count) {
    return Intl.message(
      'Low stock items: $count',
      name: 'lowStockItemsWithCount',
      desc: 'Message showing the number of low stock items.',
      args: [count],
    );
  }

  /// `Welcome back`
  String get welcomeBack {
    return Intl.message(
      'Welcome back',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `Inventory`
  String get inventory {
    return Intl.message('Inventory', name: 'inventory', desc: '', args: []);
  }

  /// `Sell`
  String get sell {
    return Intl.message('Sell', name: 'sell', desc: '', args: []);
  }

  /// `Buy`
  String get buy {
    return Intl.message('Buy', name: 'buy', desc: '', args: []);
  }

  /// `Return`
  String get returns {
    return Intl.message('Return', name: 'returns', desc: '', args: []);
  }

  /// `Receipts`
  String get receipts {
    return Intl.message('Receipts', name: 'receipts', desc: '', args: []);
  }

  /// `Reports`
  String get reports {
    return Intl.message('Reports', name: 'reports', desc: '', args: []);
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Stock Status`
  String get stockStatus {
    return Intl.message(
      'Stock Status',
      name: 'stockStatus',
      desc: '',
      args: [],
    );
  }

  /// `No Low Stock`
  String get noLowStock {
    return Intl.message('No Low Stock', name: 'noLowStock', desc: '', args: []);
  }

  /// `No Out of Stock`
  String get noOutOfStock {
    return Intl.message(
      'No Out of Stock',
      name: 'noOutOfStock',
      desc: '',
      args: [],
    );
  }

  /// `Low Stock`
  String get lowStock {
    return Intl.message('Low Stock', name: 'lowStock', desc: '', args: []);
  }

  /// `Out of Stock`
  String get outOfStock {
    return Intl.message('Out of Stock', name: 'outOfStock', desc: '', args: []);
  }

  /// `Name`
  String get name {
    return Intl.message('Name', name: 'name', desc: '', args: []);
  }

  /// `Quantity`
  String get quantity {
    return Intl.message('Quantity', name: 'quantity', desc: '', args: []);
  }

  /// `Buying Price`
  String get buyingPrice {
    return Intl.message(
      'Buying Price',
      name: 'buyingPrice',
      desc: '',
      args: [],
    );
  }

  /// `Selling Price`
  String get sellingPrice {
    return Intl.message(
      'Selling Price',
      name: 'sellingPrice',
      desc: '',
      args: [],
    );
  }

  /// `Barcode`
  String get barcode {
    return Intl.message('Barcode', name: 'barcode', desc: '', args: []);
  }

  /// `Description`
  String get description {
    return Intl.message('Description', name: 'description', desc: '', args: []);
  }

  /// `Item Unit`
  String get itemUnit {
    return Intl.message('Item Unit', name: 'itemUnit', desc: '', args: []);
  }

  /// `Stock`
  String get stock {
    return Intl.message('Stock', name: 'stock', desc: '', args: []);
  }

  /// `Price`
  String get price {
    return Intl.message('Price', name: 'price', desc: '', args: []);
  }

  /// `Clear Filters`
  String get clearFilters {
    return Intl.message(
      'Clear Filters',
      name: 'clearFilters',
      desc: '',
      args: [],
    );
  }

  /// `Item Details`
  String get itemDetails {
    return Intl.message(
      'Item Details',
      name: 'itemDetails',
      desc: '',
      args: [],
    );
  }

  /// `Show more`
  String get showMore {
    return Intl.message('Show more', name: 'showMore', desc: '', args: []);
  }

  /// `Less`
  String get less {
    return Intl.message('Less', name: 'less', desc: '', args: []);
  }

  /// `Edit`
  String get edit {
    return Intl.message('Edit', name: 'edit', desc: '', args: []);
  }

  /// `Fix`
  String get fix {
    return Intl.message('Fix', name: 'fix', desc: '', args: []);
  }

  /// `Receipt No`
  String get receiptNo {
    return Intl.message('Receipt No', name: 'receiptNo', desc: '', args: []);
  }

  /// `Supplier`
  String get supplier {
    return Intl.message('Supplier', name: 'supplier', desc: '', args: []);
  }

  /// `Loading`
  String get loading {
    return Intl.message('Loading', name: 'loading', desc: '', args: []);
  }

  /// `Error loading supplier`
  String get errorLoadingSupplier {
    return Intl.message(
      'Error loading supplier',
      name: 'errorLoadingSupplier',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get details {
    return Intl.message('Details', name: 'details', desc: '', args: []);
  }

  /// `Receipts & Suppliers`
  String get receiptsAndSuppliers {
    return Intl.message(
      'Receipts & Suppliers',
      name: 'receiptsAndSuppliers',
      desc: '',
      args: [],
    );
  }

  /// `data`
  String get data {
    return Intl.message('data', name: 'data', desc: '', args: []);
  }

  /// `More`
  String get more {
    return Intl.message('More', name: 'more', desc: '', args: []);
  }

  /// `Error`
  String get error {
    return Intl.message('Error', name: 'error', desc: '', args: []);
  }

  /// `Add Item`
  String get addItem {
    return Intl.message('Add Item', name: 'addItem', desc: '', args: []);
  }

  /// `Edit Item`
  String get editItem {
    return Intl.message('Edit Item', name: 'editItem', desc: '', args: []);
  }

  /// `Update Item`
  String get updateItem {
    return Intl.message('Update Item', name: 'updateItem', desc: '', args: []);
  }

  /// `Low Stock Items`
  String get lowStockItems {
    return Intl.message(
      'Low Stock Items',
      name: 'lowStockItems',
      desc: '',
      args: [],
    );
  }

  /// `All items are in stock`
  String get allItemsAreInStock {
    return Intl.message(
      'All items are in stock',
      name: 'allItemsAreInStock',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `Change Profile Picture`
  String get changeProfilePicture {
    return Intl.message(
      'Change Profile Picture',
      name: 'changeProfilePicture',
      desc: '',
      args: [],
    );
  }

  /// `Profile Information`
  String get profileInformation {
    return Intl.message(
      'Profile Information',
      name: 'profileInformation',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get username {
    return Intl.message('Username', name: 'username', desc: '', args: []);
  }

  /// `Personal Information`
  String get personalInformation {
    return Intl.message(
      'Personal Information',
      name: 'personalInformation',
      desc: '',
      args: [],
    );
  }

  /// `User ID`
  String get userId {
    return Intl.message('User ID', name: 'userId', desc: '', args: []);
  }

  /// `E-mail`
  String get email {
    return Intl.message('E-mail', name: 'email', desc: '', args: []);
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number (Optional)`
  String get phoneNumberOptional {
    return Intl.message(
      'Phone Number (Optional)',
      name: 'phoneNumberOptional',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get gender {
    return Intl.message('Gender', name: 'gender', desc: '', args: []);
  }

  /// `Date of Birth`
  String get dateOfBirth {
    return Intl.message(
      'Date of Birth',
      name: 'dateOfBirth',
      desc: '',
      args: [],
    );
  }

  /// `Delete Account`
  String get deleteAccount {
    return Intl.message(
      'Delete Account',
      name: 'deleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get account {
    return Intl.message('Account', name: 'account', desc: '', args: []);
  }

  /// `Shop Settings`
  String get shopSettings {
    return Intl.message(
      'Shop Settings',
      name: 'shopSettings',
      desc: '',
      args: [],
    );
  }

  /// `Customers`
  String get customers {
    return Intl.message('Customers', name: 'customers', desc: '', args: []);
  }

  /// `Add Loyal Customers Details.`
  String get addLoyalCustomersDetails {
    return Intl.message(
      'Add Loyal Customers Details.',
      name: 'addLoyalCustomersDetails',
      desc: '',
      args: [],
    );
  }

  /// `Suppliers`
  String get suppliers {
    return Intl.message('Suppliers', name: 'suppliers', desc: '', args: []);
  }

  /// `Add Your Suppliers Details.`
  String get addYourSuppliersDetails {
    return Intl.message(
      'Add Your Suppliers Details.',
      name: 'addYourSuppliersDetails',
      desc: '',
      args: [],
    );
  }

  /// `Vault / Expense`
  String get vaultExpense {
    return Intl.message(
      'Vault / Expense',
      name: 'vaultExpense',
      desc: '',
      args: [],
    );
  }

  /// `Add Your Vault And Expense Details.`
  String get addYourVaultAndExpenseDetails {
    return Intl.message(
      'Add Your Vault And Expense Details.',
      name: 'addYourVaultAndExpenseDetails',
      desc: '',
      args: [],
    );
  }

  /// `Shop Details`
  String get shopDetails {
    return Intl.message(
      'Shop Details',
      name: 'shopDetails',
      desc: '',
      args: [],
    );
  }

  /// `Add Shop Details.`
  String get addShopDetails {
    return Intl.message(
      'Add Shop Details.',
      name: 'addShopDetails',
      desc: '',
      args: [],
    );
  }

  /// `App Settings`
  String get appSettings {
    return Intl.message(
      'App Settings',
      name: 'appSettings',
      desc: '',
      args: [],
    );
  }

  /// `Appearance`
  String get appearance {
    return Intl.message('Appearance', name: 'appearance', desc: '', args: []);
  }

  /// `Personalize The App To Your Liking.`
  String get personalizeTheAppToYourLiking {
    return Intl.message(
      'Personalize The App To Your Liking.',
      name: 'personalizeTheAppToYourLiking',
      desc: '',
      args: [],
    );
  }

  /// `Set Any Kind Of Notification Message.`
  String get setAnyKindOfNotificationMessage {
    return Intl.message(
      'Set Any Kind Of Notification Message.',
      name: 'setAnyKindOfNotificationMessage',
      desc: '',
      args: [],
    );
  }

  /// `Data Settings`
  String get dataSettings {
    return Intl.message(
      'Data Settings',
      name: 'dataSettings',
      desc: '',
      args: [],
    );
  }

  /// `Sync Data`
  String get syncData {
    return Intl.message('Sync Data', name: 'syncData', desc: '', args: []);
  }

  /// `Sync Data To The Cloud.`
  String get syncDataToTheCloud {
    return Intl.message(
      'Sync Data To The Cloud.',
      name: 'syncDataToTheCloud',
      desc: '',
      args: [],
    );
  }

  /// `Backup Data`
  String get backupData {
    return Intl.message('Backup Data', name: 'backupData', desc: '', args: []);
  }

  /// `Backup Data To Your Local Storage.`
  String get backupDataToYourLocalStorage {
    return Intl.message(
      'Backup Data To Your Local Storage.',
      name: 'backupDataToYourLocalStorage',
      desc: '',
      args: [],
    );
  }

  /// `Load Data`
  String get loadData {
    return Intl.message('Load Data', name: 'loadData', desc: '', args: []);
  }

  /// `Load Data From Your Local Storage.`
  String get loadDataFromYourLocalStorage {
    return Intl.message(
      'Load Data From Your Local Storage.',
      name: 'loadDataFromYourLocalStorage',
      desc: '',
      args: [],
    );
  }

  /// `Delete Data`
  String get deleteData {
    return Intl.message('Delete Data', name: 'deleteData', desc: '', args: []);
  }

  /// `Delete Data From Your Local Storage.`
  String get deleteDataFromYourLocalStorage {
    return Intl.message(
      'Delete Data From Your Local Storage.',
      name: 'deleteDataFromYourLocalStorage',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }

  /// `Supplier Deleted Successfully`
  String get supplierDeletedSuccessfully {
    return Intl.message(
      'Supplier Deleted Successfully',
      name: 'supplierDeletedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Error Deleting Supplier`
  String get errorDeletingSupplier {
    return Intl.message(
      'Error Deleting Supplier',
      name: 'errorDeletingSupplier',
      desc: '',
      args: [],
    );
  }

  /// `Customer Deleted Successfully`
  String get customerDeletedSuccessfully {
    return Intl.message(
      'Customer Deleted Successfully',
      name: 'customerDeletedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Error Deleting Customer`
  String get errorDeletingCustomer {
    return Intl.message(
      'Error Deleting Customer',
      name: 'errorDeletingCustomer',
      desc: '',
      args: [],
    );
  }

  /// `Add new Customer`
  String get addNewCustomer {
    return Intl.message(
      'Add new Customer',
      name: 'addNewCustomer',
      desc: '',
      args: [],
    );
  }

  /// `Add new Supplier`
  String get addNewSupplier {
    return Intl.message(
      'Add new Supplier',
      name: 'addNewSupplier',
      desc: '',
      args: [],
    );
  }

  /// `Edit Customer`
  String get editCustomer {
    return Intl.message(
      'Edit Customer',
      name: 'editCustomer',
      desc: '',
      args: [],
    );
  }

  /// `Edit Supplier`
  String get editSupplier {
    return Intl.message(
      'Edit Supplier',
      name: 'editSupplier',
      desc: '',
      args: [],
    );
  }

  /// `Save Customer`
  String get saveCustomer {
    return Intl.message(
      'Save Customer',
      name: 'saveCustomer',
      desc: '',
      args: [],
    );
  }

  /// `Save Supplier`
  String get saveSupplier {
    return Intl.message(
      'Save Supplier',
      name: 'saveSupplier',
      desc: '',
      args: [],
    );
  }

  /// `Update Customer`
  String get updateCustomer {
    return Intl.message(
      'Update Customer',
      name: 'updateCustomer',
      desc: '',
      args: [],
    );
  }

  /// `Update Supplier`
  String get updateSupplier {
    return Intl.message(
      'Update Supplier',
      name: 'updateSupplier',
      desc: '',
      args: [],
    );
  }

  /// `Customer with this name already exists.`
  String get customerWithThisNameAlreadyExists {
    return Intl.message(
      'Customer with this name already exists.',
      name: 'customerWithThisNameAlreadyExists',
      desc: '',
      args: [],
    );
  }

  /// `Supplier with this name already exists.`
  String get supplierWithThisNameAlreadyExists {
    return Intl.message(
      'Supplier with this name already exists.',
      name: 'supplierWithThisNameAlreadyExists',
      desc: '',
      args: [],
    );
  }

  /// `Street`
  String get street {
    return Intl.message('Street', name: 'street', desc: '', args: []);
  }

  /// `City`
  String get city {
    return Intl.message('City', name: 'city', desc: '', args: []);
  }

  /// `State`
  String get state {
    return Intl.message('State', name: 'state', desc: '', args: []);
  }

  /// `Country`
  String get country {
    return Intl.message('Country', name: 'country', desc: '', args: []);
  }

  /// `Display`
  String get display {
    return Intl.message('Display', name: 'display', desc: '', args: []);
  }

  /// `App Language.`
  String get appLanguage {
    return Intl.message(
      'App Language.',
      name: 'appLanguage',
      desc: '',
      args: [],
    );
  }

  /// `General`
  String get general {
    return Intl.message('General', name: 'general', desc: '', args: []);
  }

  /// `Currency.`
  String get currency {
    return Intl.message('Currency.', name: 'currency', desc: '', args: []);
  }

  /// `Tax Percentage.`
  String get taxPercentage {
    return Intl.message(
      'Tax Percentage.',
      name: 'taxPercentage',
      desc: '',
      args: [],
    );
  }

  /// `Low Stock Threshold.`
  String get lowStockThreshold {
    return Intl.message(
      'Low Stock Threshold.',
      name: 'lowStockThreshold',
      desc: '',
      args: [],
    );
  }

  /// `Theme:`
  String get theme {
    return Intl.message('Theme:', name: 'theme', desc: '', args: []);
  }

  /// `System`
  String get system {
    return Intl.message('System', name: 'system', desc: '', args: []);
  }

  /// `Light`
  String get light {
    return Intl.message('Light', name: 'light', desc: '', args: []);
  }

  /// `Dark`
  String get dark {
    return Intl.message('Dark', name: 'dark', desc: '', args: []);
  }

  /// `Save`
  String get save {
    return Intl.message('Save', name: 'save', desc: '', args: []);
  }

  /// `Update`
  String get update {
    return Intl.message('Update', name: 'update', desc: '', args: []);
  }

  /// `Shop Details Saved`
  String get shopDetailsSaved {
    return Intl.message(
      'Shop Details Saved',
      name: 'shopDetailsSaved',
      desc: '',
      args: [],
    );
  }

  /// `Piece`
  String get unit_piece {
    return Intl.message('Piece', name: 'unit_piece', desc: '', args: []);
  }

  /// `KG`
  String get unit_kg {
    return Intl.message('KG', name: 'unit_kg', desc: '', args: []);
  }

  /// `Bag`
  String get unit_bag {
    return Intl.message('Bag', name: 'unit_bag', desc: '', args: []);
  }

  /// `Meter`
  String get unit_meter {
    return Intl.message('Meter', name: 'unit_meter', desc: '', args: []);
  }

  /// `Liter`
  String get unit_liter {
    return Intl.message('Liter', name: 'unit_liter', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
