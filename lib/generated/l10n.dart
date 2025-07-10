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

  /// `Welcome To`
  String get welcomeTo {
    return Intl.message('Welcome To', name: 'welcomeTo', desc: '', args: []);
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

  /// `Low Stock Alert`
  String get lowStockAlert {
    return Intl.message(
      'Low Stock Alert',
      name: 'lowStockAlert',
      desc: '',
      args: [],
    );
  }

  /// `is low on stock`
  String get isLowOnStock {
    return Intl.message(
      'is low on stock',
      name: 'isLowOnStock',
      desc: '',
      args: [],
    );
  }

  /// `Out of Stock Alert`
  String get outOfStockAlert {
    return Intl.message(
      'Out of Stock Alert',
      name: 'outOfStockAlert',
      desc: '',
      args: [],
    );
  }

  /// `is out of stock`
  String get isOutOfStock {
    return Intl.message(
      'is out of stock',
      name: 'isOutOfStock',
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

  /// `Clear All`
  String get clearAll {
    return Intl.message('Clear All', name: 'clearAll', desc: '', args: []);
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

  /// `Customer`
  String get customer {
    return Intl.message('Customer', name: 'customer', desc: '', args: []);
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

  /// `Notification`
  String get notification {
    return Intl.message(
      'Notification',
      name: 'notification',
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

  /// `Vault not found`
  String get vaultNotFound {
    return Intl.message(
      'Vault not found',
      name: 'vaultNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Vault Balance`
  String get vaultBalance {
    return Intl.message(
      'Vault Balance',
      name: 'vaultBalance',
      desc: '',
      args: [],
    );
  }

  /// `Total In`
  String get totalIn {
    return Intl.message('Total In', name: 'totalIn', desc: '', args: []);
  }

  /// `Total Out`
  String get totalOut {
    return Intl.message('Total Out', name: 'totalOut', desc: '', args: []);
  }

  /// `Add Expense`
  String get addExpense {
    return Intl.message('Add Expense', name: 'addExpense', desc: '', args: []);
  }

  /// `Add To Vault`
  String get addToVault {
    return Intl.message('Add To Vault', name: 'addToVault', desc: '', args: []);
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

  /// `Stay organized and in control with a secure vault and much more—all in one app.`
  String get onBoardingFooterText {
    return Intl.message(
      'Stay organized and in control with a secure vault and much more—all in one app.',
      name: 'onBoardingFooterText',
      desc: '',
      args: [],
    );
  }

  /// `I agree to`
  String get iAgreeTo {
    return Intl.message('I agree to', name: 'iAgreeTo', desc: '', args: []);
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Terms of use`
  String get termsOfUse {
    return Intl.message('Terms of use', name: 'termsOfUse', desc: '', args: []);
  }

  /// `and`
  String get and {
    return Intl.message('and', name: 'and', desc: '', args: []);
  }

  /// `Continue`
  String get continue1 {
    return Intl.message('Continue', name: 'continue1', desc: '', args: []);
  }

  /// `Effortlessly manage your inventory with features for tracking:`
  String get onBoardingHeaderText {
    return Intl.message(
      'Effortlessly manage your inventory with features for tracking:',
      name: 'onBoardingHeaderText',
      desc: '',
      args: [],
    );
  }

  /// `Page Not Found`
  String get pageNotFound {
    return Intl.message(
      'Page Not Found',
      name: 'pageNotFound',
      desc: '',
      args: [],
    );
  }

  /// `No notifications yet.`
  String get noNotificationYet {
    return Intl.message(
      'No notifications yet.',
      name: 'noNotificationYet',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete all notifications?`
  String get areYouSureYouWantToDeleteAllNotifications {
    return Intl.message(
      'Are you sure you want to delete all notifications?',
      name: 'areYouSureYouWantToDeleteAllNotifications',
      desc: '',
      args: [],
    );
  }

  /// `Sell Checkout Successful`
  String get sellCheckoutSuccessful {
    return Intl.message(
      'Sell Checkout Successful',
      name: 'sellCheckoutSuccessful',
      desc: '',
      args: [],
    );
  }

  /// `Buy Checkout Successful`
  String get buyCheckoutSuccessful {
    return Intl.message(
      'Buy Checkout Successful',
      name: 'buyCheckoutSuccessful',
      desc: '',
      args: [],
    );
  }

  /// `Return Checkout Successful`
  String get returnCheckoutSuccessful {
    return Intl.message(
      'Return Checkout Successful',
      name: 'returnCheckoutSuccessful',
      desc: '',
      args: [],
    );
  }

  /// `Sell Checkout`
  String get sellCheckout {
    return Intl.message(
      'Sell Checkout',
      name: 'sellCheckout',
      desc: '',
      args: [],
    );
  }

  /// `Buy Checkout`
  String get buyCheckout {
    return Intl.message(
      'Buy Checkout',
      name: 'buyCheckout',
      desc: '',
      args: [],
    );
  }

  /// `Return Checkout`
  String get returnCheckout {
    return Intl.message(
      'Return Checkout',
      name: 'returnCheckout',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get total {
    return Intl.message('Total', name: 'total', desc: '', args: []);
  }

  /// `About`
  String get about {
    return Intl.message('About', name: 'about', desc: '', args: []);
  }

  /// `Application Info And Update.`
  String get appInfoAndUpdate {
    return Intl.message(
      'Application Info And Update.',
      name: 'appInfoAndUpdate',
      desc: '',
      args: [],
    );
  }

  /// `Open Source License`
  String get openSourceLicense {
    return Intl.message(
      'Open Source License',
      name: 'openSourceLicense',
      desc: '',
      args: [],
    );
  }

  /// `Check For Update`
  String get checkForUpdate {
    return Intl.message(
      'Check For Update',
      name: 'checkForUpdate',
      desc: '',
      args: [],
    );
  }

  /// `Version`
  String get version {
    return Intl.message('Version', name: 'version', desc: '', args: []);
  }

  /// `Error getting app version:`
  String get errorGettingAppVersion {
    return Intl.message(
      'Error getting app version:',
      name: 'errorGettingAppVersion',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load version`
  String get failedToLoadVersion {
    return Intl.message(
      'Failed to load version',
      name: 'failedToLoadVersion',
      desc: '',
      args: [],
    );
  }

  /// `Encryption Key`
  String get encryptionKey {
    return Intl.message(
      'Encryption Key',
      name: 'encryptionKey',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete all data?`
  String get areYouSureYouWantToDeleteAllData {
    return Intl.message(
      'Are you sure you want to delete all data?',
      name: 'areYouSureYouWantToDeleteAllData',
      desc: '',
      args: [],
    );
  }

  /// `Profit & Loss Statement`
  String get profitAndLossStatement {
    return Intl.message(
      'Profit & Loss Statement',
      name: 'profitAndLossStatement',
      desc: '',
      args: [],
    );
  }

  /// `Gross Revenue`
  String get grossRevenue {
    return Intl.message(
      'Gross Revenue',
      name: 'grossRevenue',
      desc: '',
      args: [],
    );
  }

  /// `COGS`
  String get cOGS {
    return Intl.message('COGS', name: 'cOGS', desc: '', args: []);
  }

  /// `Return Loss`
  String get returnLoss {
    return Intl.message('Return Loss', name: 'returnLoss', desc: '', args: []);
  }

  /// `Profit Margin`
  String get profitMargin {
    return Intl.message(
      'Profit Margin',
      name: 'profitMargin',
      desc: '',
      args: [],
    );
  }

  /// `Sales vs Purchases`
  String get salesVsPurchases {
    return Intl.message(
      'Sales vs Purchases',
      name: 'salesVsPurchases',
      desc: '',
      args: [],
    );
  }

  /// `Summary`
  String get summary {
    return Intl.message('Summary', name: 'summary', desc: '', args: []);
  }

  /// `Inventory Value`
  String get inventoryValue {
    return Intl.message(
      'Inventory Value',
      name: 'inventoryValue',
      desc: '',
      args: [],
    );
  }

  /// `Sales`
  String get sales {
    return Intl.message('Sales', name: 'sales', desc: '', args: []);
  }

  /// `Expenses`
  String get expenses {
    return Intl.message('Expenses', name: 'expenses', desc: '', args: []);
  }

  /// `Profit / Loss`
  String get profitLoss {
    return Intl.message(
      'Profit / Loss',
      name: 'profitLoss',
      desc: '',
      args: [],
    );
  }

  /// `change range`
  String get changeRange {
    return Intl.message(
      'change range',
      name: 'changeRange',
      desc: '',
      args: [],
    );
  }

  /// `From`
  String get from {
    return Intl.message('From', name: 'from', desc: '', args: []);
  }

  /// `To`
  String get to {
    return Intl.message('To', name: 'to', desc: '', args: []);
  }

  /// `Sales by Payment Method`
  String get salesByPaymentMethod {
    return Intl.message(
      'Sales by Payment Method',
      name: 'salesByPaymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Tax Collected`
  String get taxCollected {
    return Intl.message(
      'Tax Collected',
      name: 'taxCollected',
      desc: '',
      args: [],
    );
  }

  /// `Error loading payment methods:`
  String get errorLoadingPaymentMethods {
    return Intl.message(
      'Error loading payment methods:',
      name: 'errorLoadingPaymentMethods',
      desc: '',
      args: [],
    );
  }

  /// `Error loading tax:`
  String get errorLoadingTax {
    return Intl.message(
      'Error loading tax:',
      name: 'errorLoadingTax',
      desc: '',
      args: [],
    );
  }

  /// `Top Suppliers`
  String get topSuppliers {
    return Intl.message(
      'Top Suppliers',
      name: 'topSuppliers',
      desc: '',
      args: [],
    );
  }

  /// `Supplier Debts`
  String get supplierDebts {
    return Intl.message(
      'Supplier Debts',
      name: 'supplierDebts',
      desc: '',
      args: [],
    );
  }

  /// `Debt`
  String get debt {
    return Intl.message('Debt', name: 'debt', desc: '', args: []);
  }

  /// `Most Bought Items`
  String get mostBoughtItems {
    return Intl.message(
      'Most Bought Items',
      name: 'mostBoughtItems',
      desc: '',
      args: [],
    );
  }

  /// `Average Cost Per Item`
  String get averageCostPerItem {
    return Intl.message(
      'Average Cost Per Item',
      name: 'averageCostPerItem',
      desc: '',
      args: [],
    );
  }

  /// `Avg Cost`
  String get avgCost {
    return Intl.message('Avg Cost', name: 'avgCost', desc: '', args: []);
  }

  /// `Qty`
  String get qty {
    return Intl.message('Qty', name: 'qty', desc: '', args: []);
  }

  /// `No data available.`
  String get noDataAvailable {
    return Intl.message(
      'No data available.',
      name: 'noDataAvailable',
      desc: '',
      args: [],
    );
  }

  /// `New Stock Items`
  String get newStockItems {
    return Intl.message(
      'New Stock Items',
      name: 'newStockItems',
      desc: '',
      args: [],
    );
  }

  /// `Out of Stock Items`
  String get outOfStockItems {
    return Intl.message(
      'Out of Stock Items',
      name: 'outOfStockItems',
      desc: '',
      args: [],
    );
  }

  /// `No items to display.`
  String get NoItemsToDisplay {
    return Intl.message(
      'No items to display.',
      name: 'NoItemsToDisplay',
      desc: '',
      args: [],
    );
  }

  /// `Most returned items`
  String get mostReturnedItems {
    return Intl.message(
      'Most returned items',
      name: 'mostReturnedItems',
      desc: '',
      args: [],
    );
  }

  /// `No returned items found.`
  String get noReturnedItemsFound {
    return Intl.message(
      'No returned items found.',
      name: 'noReturnedItemsFound',
      desc: '',
      args: [],
    );
  }

  /// `returned`
  String get returned {
    return Intl.message('returned', name: 'returned', desc: '', args: []);
  }

  /// `pcs`
  String get pcs {
    return Intl.message('pcs', name: 'pcs', desc: '', args: []);
  }

  /// `Top Costumers`
  String get topCostumers {
    return Intl.message(
      'Top Costumers',
      name: 'topCostumers',
      desc: '',
      args: [],
    );
  }

  /// `Customer Debts`
  String get customerDebts {
    return Intl.message(
      'Customer Debts',
      name: 'customerDebts',
      desc: '',
      args: [],
    );
  }

  /// `Most Sold Items`
  String get mostSoldItems {
    return Intl.message(
      'Most Sold Items',
      name: 'mostSoldItems',
      desc: '',
      args: [],
    );
  }

  /// `No debtors found.`
  String get noDebtorsFound {
    return Intl.message(
      'No debtors found.',
      name: 'noDebtorsFound',
      desc: '',
      args: [],
    );
  }

  /// `No items sold yet.`
  String get noItemsSoldYet {
    return Intl.message(
      'No items sold yet.',
      name: 'noItemsSoldYet',
      desc: '',
      args: [],
    );
  }

  /// `Qty Sold`
  String get qtySold {
    return Intl.message('Qty Sold', name: 'qtySold', desc: '', args: []);
  }

  /// `Top`
  String get top {
    return Intl.message('Top', name: 'top', desc: '', args: []);
  }

  /// `Checkout Review`
  String get checkoutReview {
    return Intl.message(
      'Checkout Review',
      name: 'checkoutReview',
      desc: '',
      args: [],
    );
  }

  /// `Exceed total amount`
  String get exceedTotalAmount {
    return Intl.message(
      'Exceed total amount',
      name: 'exceedTotalAmount',
      desc: '',
      args: [],
    );
  }

  /// `Checkout`
  String get checkout {
    return Intl.message('Checkout', name: 'checkout', desc: '', args: []);
  }

  /// `Add Fees`
  String get addFees {
    return Intl.message('Add Fees', name: 'addFees', desc: '', args: []);
  }

  /// `Customer Address`
  String get customerAddress {
    return Intl.message(
      'Customer Address',
      name: 'customerAddress',
      desc: '',
      args: [],
    );
  }

  /// `Supplier Address`
  String get supplierAddress {
    return Intl.message(
      'Supplier Address',
      name: 'supplierAddress',
      desc: '',
      args: [],
    );
  }

  /// `Change`
  String get change {
    return Intl.message('Change', name: 'change', desc: '', args: []);
  }

  /// `Select a Customer`
  String get selectCustomer {
    return Intl.message(
      'Select a Customer',
      name: 'selectCustomer',
      desc: '',
      args: [],
    );
  }

  /// `Select a Supplier`
  String get selectSupplier {
    return Intl.message(
      'Select a Supplier',
      name: 'selectSupplier',
      desc: '',
      args: [],
    );
  }

  /// `Subtotal`
  String get subtotal {
    return Intl.message('Subtotal', name: 'subtotal', desc: '', args: []);
  }

  /// `Discount`
  String get discount {
    return Intl.message('Discount', name: 'discount', desc: '', args: []);
  }

  /// `Shipping Fee`
  String get shippingFee {
    return Intl.message(
      'Shipping Fee',
      name: 'shippingFee',
      desc: '',
      args: [],
    );
  }

  /// `Tax Fee`
  String get taxFee {
    return Intl.message('Tax Fee', name: 'taxFee', desc: '', args: []);
  }

  /// `Order Total`
  String get orderTotal {
    return Intl.message('Order Total', name: 'orderTotal', desc: '', args: []);
  }

  /// `Paid Amount`
  String get paidAmount {
    return Intl.message('Paid Amount', name: 'paidAmount', desc: '', args: []);
  }

  /// `Debt Amount`
  String get debtAmount {
    return Intl.message('Debt Amount', name: 'debtAmount', desc: '', args: []);
  }

  /// `Select Payment Method`
  String get selectPaymentMethod {
    return Intl.message(
      'Select Payment Method',
      name: 'selectPaymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Payment Method`
  String get paymentMethod {
    return Intl.message(
      'Payment Method',
      name: 'paymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Discount % here.`
  String get discountPercentHere {
    return Intl.message(
      'Discount % here.',
      name: 'discountPercentHere',
      desc: '',
      args: [],
    );
  }

  /// `Discount amount here.`
  String get discountAmountHere {
    return Intl.message(
      'Discount amount here.',
      name: 'discountAmountHere',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid number`
  String get enterValidNumber {
    return Intl.message(
      'Enter a valid number',
      name: 'enterValidNumber',
      desc: '',
      args: [],
    );
  }

  /// `Percentage cannot exceed 100%`
  String get percentageCannotExceed100 {
    return Intl.message(
      'Percentage cannot exceed 100%',
      name: 'percentageCannotExceed100',
      desc: '',
      args: [],
    );
  }

  /// `Discount cannot exceed subtotal`
  String get discountCannotExceedSubtotal {
    return Intl.message(
      'Discount cannot exceed subtotal',
      name: 'discountCannotExceedSubtotal',
      desc: '',
      args: [],
    );
  }

  /// `Apply`
  String get apply {
    return Intl.message('Apply', name: 'apply', desc: '', args: []);
  }

  /// `Undo`
  String get undo {
    return Intl.message('Undo', name: 'undo', desc: '', args: []);
  }

  /// `Search and Add Items`
  String get searchAndAddItems {
    return Intl.message(
      'Search and Add Items',
      name: 'searchAndAddItems',
      desc: '',
      args: [],
    );
  }

  /// `Item not found!`
  String get itemNotFound {
    return Intl.message(
      'Item not found!',
      name: 'itemNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Cart`
  String get cart {
    return Intl.message('Cart', name: 'cart', desc: '', args: []);
  }

  /// `Proceed to checkout`
  String get proceedToCheckout {
    return Intl.message(
      'Proceed to checkout',
      name: 'proceedToCheckout',
      desc: '',
      args: [],
    );
  }

  /// `Your list is Empty!`
  String get yourListIsEmpty {
    return Intl.message(
      'Your list is Empty!',
      name: 'yourListIsEmpty',
      desc: '',
      args: [],
    );
  }

  /// `removed`
  String get removed {
    return Intl.message('removed', name: 'removed', desc: '', args: []);
  }

  /// `Receipt Details`
  String get receiptDetails {
    return Intl.message(
      'Receipt Details',
      name: 'receiptDetails',
      desc: '',
      args: [],
    );
  }

  /// `Bought Items`
  String get boughtItems {
    return Intl.message(
      'Bought Items',
      name: 'boughtItems',
      desc: '',
      args: [],
    );
  }

  /// `Item removed from inventory`
  String get itemRemovedFromInventory {
    return Intl.message(
      'Item removed from inventory',
      name: 'itemRemovedFromInventory',
      desc: '',
      args: [],
    );
  }

  /// `Loading item...`
  String get loadingItem {
    return Intl.message(
      'Loading item...',
      name: 'loadingItem',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this receipt?`
  String get areYouSureYouWantToDeleteThisReceipt {
    return Intl.message(
      'Are you sure you want to delete this receipt?',
      name: 'areYouSureYouWantToDeleteThisReceipt',
      desc: '',
      args: [],
    );
  }

  /// `Error loading receipt details`
  String get errorLoadingReceiptDetails {
    return Intl.message(
      'Error loading receipt details',
      name: 'errorLoadingReceiptDetails',
      desc: '',
      args: [],
    );
  }

  /// `Error loading shop details`
  String get errorLoadingShopDetails {
    return Intl.message(
      'Error loading shop details',
      name: 'errorLoadingShopDetails',
      desc: '',
      args: [],
    );
  }

  /// `Buy Receipts`
  String get buyReceipts {
    return Intl.message(
      'Buy Receipts',
      name: 'buyReceipts',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message('Done', name: 'done', desc: '', args: []);
  }

  /// `selected`
  String get selected {
    return Intl.message('selected', name: 'selected', desc: '', args: []);
  }

  /// `Are you sure you want to delete {count} receipt(s)?`
  String areYouSureYouWantToDeleteWithCount(Object count) {
    return Intl.message(
      'Are you sure you want to delete $count receipt(s)?',
      name: 'areYouSureYouWantToDeleteWithCount',
      desc: 'Message confirm deletion.',
      args: [count],
    );
  }

  /// `Sold Items`
  String get soldItems {
    return Intl.message('Sold Items', name: 'soldItems', desc: '', args: []);
  }

  /// `Returned Items`
  String get returnedItems {
    return Intl.message(
      'Returned Items',
      name: 'returnedItems',
      desc: '',
      args: [],
    );
  }

  /// `Return Receipts`
  String get returnReceipts {
    return Intl.message(
      'Return Receipts',
      name: 'returnReceipts',
      desc: '',
      args: [],
    );
  }

  /// `Sell Receipts`
  String get sellReceipts {
    return Intl.message(
      'Sell Receipts',
      name: 'sellReceipts',
      desc: '',
      args: [],
    );
  }

  /// `Scan QR Code`
  String get scanQRCode {
    return Intl.message('Scan QR Code', name: 'scanQRCode', desc: '', args: []);
  }

  /// `New Payment`
  String get newPayment {
    return Intl.message('New Payment', name: 'newPayment', desc: '', args: []);
  }

  /// `Status`
  String get status {
    return Intl.message('Status', name: 'status', desc: '', args: []);
  }

  /// `Date`
  String get date {
    return Intl.message('Date', name: 'date', desc: '', args: []);
  }

  /// `Subtotal Price`
  String get subtotalPrice {
    return Intl.message(
      'Subtotal Price',
      name: 'subtotalPrice',
      desc: '',
      args: [],
    );
  }

  /// `Unknown Customer`
  String get unknownCustomer {
    return Intl.message(
      'Unknown Customer',
      name: 'unknownCustomer',
      desc: '',
      args: [],
    );
  }

  /// `Error loading customer`
  String get errorLoadingCustomer {
    return Intl.message(
      'Error loading customer',
      name: 'errorLoadingCustomer',
      desc: '',
      args: [],
    );
  }

  /// `Unknown Supplier`
  String get unknownSupplier {
    return Intl.message(
      'Unknown Supplier',
      name: 'unknownSupplier',
      desc: '',
      args: [],
    );
  }

  /// `Completed`
  String get completed {
    return Intl.message('Completed', name: 'completed', desc: '', args: []);
  }

  /// `Pending`
  String get pending {
    return Intl.message('Pending', name: 'pending', desc: '', args: []);
  }

  /// `Confirm Deletion`
  String get confirmDeletion {
    return Intl.message(
      'Confirm Deletion',
      name: 'confirmDeletion',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this?`
  String get areYouSureYouWantToDeleteThis {
    return Intl.message(
      'Are you sure you want to delete this?',
      name: 'areYouSureYouWantToDeleteThis',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this customer?`
  String get areYouSureYouWantToDeleteThisCustomer {
    return Intl.message(
      'Are you sure you want to delete this customer?',
      name: 'areYouSureYouWantToDeleteThisCustomer',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this supplier?`
  String get areYouSureYouWantToDeleteThisSupplier {
    return Intl.message(
      'Are you sure you want to delete this supplier?',
      name: 'areYouSureYouWantToDeleteThisSupplier',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Delete`
  String get delete {
    return Intl.message('Delete', name: 'delete', desc: '', args: []);
  }

  /// `Change Discount Type`
  String get changeDiscountType {
    return Intl.message(
      'Change Discount Type',
      name: 'changeDiscountType',
      desc: '',
      args: [],
    );
  }

  /// `Switch between percentage and fixed amount.`
  String get switchBetweenPercentageFixedAmount {
    return Intl.message(
      'Switch between percentage and fixed amount.',
      name: 'switchBetweenPercentageFixedAmount',
      desc: '',
      args: [],
    );
  }

  /// `Percentage %`
  String get percentage {
    return Intl.message('Percentage %', name: 'percentage', desc: '', args: []);
  }

  /// `Amount`
  String get amount {
    return Intl.message('Amount', name: 'amount', desc: '', args: []);
  }

  /// `Customer added successfully`
  String get customerAddedSuccessfully {
    return Intl.message(
      'Customer added successfully',
      name: 'customerAddedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Enter customer name`
  String get enterCustomerName {
    return Intl.message(
      'Enter customer name',
      name: 'enterCustomerName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a name`
  String get pleaseEnterName {
    return Intl.message(
      'Please enter a name',
      name: 'pleaseEnterName',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message('Add', name: 'add', desc: '', args: []);
  }

  /// `Error Adding Customer`
  String get errorAddingCustomer {
    return Intl.message(
      'Error Adding Customer',
      name: 'errorAddingCustomer',
      desc: '',
      args: [],
    );
  }

  /// `Add New Item`
  String get addNewItem {
    return Intl.message('Add New Item', name: 'addNewItem', desc: '', args: []);
  }

  /// `Please fill all the fields correctly`
  String get pleaseFillAllTheFieldsCorrectly {
    return Intl.message(
      'Please fill all the fields correctly',
      name: 'pleaseFillAllTheFieldsCorrectly',
      desc: '',
      args: [],
    );
  }

  /// `Item added successfully`
  String get itemAddedSuccessfully {
    return Intl.message(
      'Item added successfully',
      name: 'itemAddedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Supplier added successfully`
  String get supplierAddedSuccessfully {
    return Intl.message(
      'Supplier added successfully',
      name: 'supplierAddedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Enter supplier name`
  String get enterSupplierName {
    return Intl.message(
      'Enter supplier name',
      name: 'enterSupplierName',
      desc: '',
      args: [],
    );
  }

  /// `Error adding supplier`
  String get errorAddingSupplier {
    return Intl.message(
      'Error adding supplier',
      name: 'errorAddingSupplier',
      desc: '',
      args: [],
    );
  }

  /// `Add Quantity`
  String get addQuantity {
    return Intl.message(
      'Add Quantity',
      name: 'addQuantity',
      desc: '',
      args: [],
    );
  }

  /// `Enter Quantity`
  String get enterQuantity {
    return Intl.message(
      'Enter Quantity',
      name: 'enterQuantity',
      desc: '',
      args: [],
    );
  }

  /// `Checkout Summary`
  String get checkoutSummary {
    return Intl.message(
      'Checkout Summary',
      name: 'checkoutSummary',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message('Confirm', name: 'confirm', desc: '', args: []);
  }

  /// `Total Amount`
  String get totalAmount {
    return Intl.message(
      'Total Amount',
      name: 'totalAmount',
      desc: '',
      args: [],
    );
  }

  /// `Item Receipts Details`
  String get itemReceiptsDetails {
    return Intl.message(
      'Item Receipts Details',
      name: 'itemReceiptsDetails',
      desc: '',
      args: [],
    );
  }

  /// `No receipts found.`
  String get noReceiptsFound {
    return Intl.message(
      'No receipts found.',
      name: 'noReceiptsFound',
      desc: '',
      args: [],
    );
  }

  /// `Error loading receipts`
  String get errorLoadingReceipts {
    return Intl.message(
      'Error loading receipts',
      name: 'errorLoadingReceipts',
      desc: '',
      args: [],
    );
  }

  /// `More Info`
  String get moreInfo {
    return Intl.message('More Info', name: 'moreInfo', desc: '', args: []);
  }

  /// `Buying Total`
  String get buyingTotal {
    return Intl.message(
      'Buying Total',
      name: 'buyingTotal',
      desc: '',
      args: [],
    );
  }

  /// `Selling Total`
  String get sellingTotal {
    return Intl.message(
      'Selling Total',
      name: 'sellingTotal',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message('Close', name: 'close', desc: '', args: []);
  }

  /// `Update Buying Price`
  String get updateBuyingPrice {
    return Intl.message(
      'Update Buying Price',
      name: 'updateBuyingPrice',
      desc: '',
      args: [],
    );
  }

  /// `Receipts with higher buying prices:`
  String get receiptsWithHigherBuyingPrices {
    return Intl.message(
      'Receipts with higher buying prices:',
      name: 'receiptsWithHigherBuyingPrices',
      desc: '',
      args: [],
    );
  }

  /// `New Buying Price`
  String get newBuyingPrice {
    return Intl.message(
      'New Buying Price',
      name: 'newBuyingPrice',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Price`
  String get invalidPrice {
    return Intl.message(
      'Invalid Price',
      name: 'invalidPrice',
      desc: '',
      args: [],
    );
  }

  /// `Should Be Greater Than Current Buying Price.`
  String get shouldBeGreaterThanCurrentBuyingPrice {
    return Intl.message(
      'Should Be Greater Than Current Buying Price.',
      name: 'shouldBeGreaterThanCurrentBuyingPrice',
      desc: '',
      args: [],
    );
  }

  /// `Update Selling Price`
  String get updateSellingPrice {
    return Intl.message(
      'Update Selling Price',
      name: 'updateSellingPrice',
      desc: '',
      args: [],
    );
  }

  /// `Selling price must be greater than buying Price.`
  String get sellingPriceMustBeGreaterThanBuyingPrice {
    return Intl.message(
      'Selling price must be greater than buying Price.',
      name: 'sellingPriceMustBeGreaterThanBuyingPrice',
      desc: '',
      args: [],
    );
  }

  /// `New Selling Price`
  String get newSellingPrice {
    return Intl.message(
      'New Selling Price',
      name: 'newSellingPrice',
      desc: '',
      args: [],
    );
  }

  /// `Enter new selling price`
  String get enterNewSellingPrice {
    return Intl.message(
      'Enter new selling price',
      name: 'enterNewSellingPrice',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid price greater than buying price.`
  String get pleaseEnterValidPriceGreaterThanBuyingPrice {
    return Intl.message(
      'Please enter a valid price greater than buying price.',
      name: 'pleaseEnterValidPriceGreaterThanBuyingPrice',
      desc: '',
      args: [],
    );
  }

  /// `Select Receipt Type`
  String get selectReceiptType {
    return Intl.message(
      'Select Receipt Type',
      name: 'selectReceiptType',
      desc: '',
      args: [],
    );
  }

  /// `Enter Values`
  String get enterValues {
    return Intl.message(
      'Enter Values',
      name: 'enterValues',
      desc: '',
      args: [],
    );
  }

  /// `Invalid quantity.`
  String get invalidQuantity {
    return Intl.message(
      'Invalid quantity.',
      name: 'invalidQuantity',
      desc: '',
      args: [],
    );
  }

  /// `Enter a number with max 2 decimals.`
  String get invalidQuantityEnterNumberWithMaxDecimals {
    return Intl.message(
      'Enter a number with max 2 decimals.',
      name: 'invalidQuantityEnterNumberWithMaxDecimals',
      desc: '',
      args: [],
    );
  }

  /// `No items found`
  String get noItemsFound {
    return Intl.message(
      'No items found',
      name: 'noItemsFound',
      desc: '',
      args: [],
    );
  }

  /// `Not found!`
  String get notFound {
    return Intl.message('Not found!', name: 'notFound', desc: '', args: []);
  }

  /// `Your Inventory is Empty`
  String get yourInventoryIsEmpty {
    return Intl.message(
      'Your Inventory is Empty',
      name: 'yourInventoryIsEmpty',
      desc: '',
      args: [],
    );
  }

  /// `No returnable items found`
  String get noReturnableItemsFound {
    return Intl.message(
      'No returnable items found',
      name: 'noReturnableItemsFound',
      desc: '',
      args: [],
    );
  }

  /// `Select App Language`
  String get selectAppLanguage {
    return Intl.message(
      'Select App Language',
      name: 'selectAppLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Select Currency`
  String get selectCurrency {
    return Intl.message(
      'Select Currency',
      name: 'selectCurrency',
      desc: '',
      args: [],
    );
  }

  /// `No currencies found.`
  String get noCurrenciesFound {
    return Intl.message(
      'No currencies found.',
      name: 'noCurrenciesFound',
      desc: '',
      args: [],
    );
  }

  /// `Currency updated to`
  String get currencyUpdatedTo {
    return Intl.message(
      'Currency updated to',
      name: 'currencyUpdatedTo',
      desc: '',
      args: [],
    );
  }

  /// `Change Encryption Key`
  String get changeEncryptionKey {
    return Intl.message(
      'Change Encryption Key',
      name: 'changeEncryptionKey',
      desc: '',
      args: [],
    );
  }

  /// `Must be 32 character long.`
  String get mustBeCharacterLong {
    return Intl.message(
      'Must be 32 character long.',
      name: 'mustBeCharacterLong',
      desc: '',
      args: [],
    );
  }

  /// `Encryption key updated!`
  String get encryptionKeyUpdated {
    return Intl.message(
      'Encryption key updated!',
      name: 'encryptionKeyUpdated',
      desc: '',
      args: [],
    );
  }

  /// `Threshold Value`
  String get thresholdValue {
    return Intl.message(
      'Threshold Value',
      name: 'thresholdValue',
      desc: '',
      args: [],
    );
  }

  /// `warning when stock ≤ threshold`
  String get warningWhenStockThreshold {
    return Intl.message(
      'warning when stock ≤ threshold',
      name: 'warningWhenStockThreshold',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid positive number.`
  String get enterValidPositiveNumber {
    return Intl.message(
      'Enter a valid positive number.',
      name: 'enterValidPositiveNumber',
      desc: '',
      args: [],
    );
  }

  /// `Low stock threshold updated and saved`
  String get lowStockThresholdUpdatedSaved {
    return Intl.message(
      'Low stock threshold updated and saved',
      name: 'lowStockThresholdUpdatedSaved',
      desc: '',
      args: [],
    );
  }

  /// `Notification Settings`
  String get notificationSettings {
    return Intl.message(
      'Notification Settings',
      name: 'notificationSettings',
      desc: '',
      args: [],
    );
  }

  /// `All Notifications`
  String get allNotifications {
    return Intl.message(
      'All Notifications',
      name: 'allNotifications',
      desc: '',
      args: [],
    );
  }

  /// `Edit Tax Percentage`
  String get editTaxPercentage {
    return Intl.message(
      'Edit Tax Percentage',
      name: 'editTaxPercentage',
      desc: '',
      args: [],
    );
  }

  /// `Tax %`
  String get tax {
    return Intl.message('Tax %', name: 'tax', desc: '', args: []);
  }

  /// `Enter tax percentage`
  String get enterTaxPercentage {
    return Intl.message(
      'Enter tax percentage',
      name: 'enterTaxPercentage',
      desc: '',
      args: [],
    );
  }

  /// `Tax percentage updated and saved`
  String get taxPercentageUpdatedSaved {
    return Intl.message(
      'Tax percentage updated and saved',
      name: 'taxPercentageUpdatedSaved',
      desc: '',
      args: [],
    );
  }

  /// `Edit Expense`
  String get editExpense {
    return Intl.message(
      'Edit Expense',
      name: 'editExpense',
      desc: '',
      args: [],
    );
  }

  /// `Edit Addition`
  String get editAddition {
    return Intl.message(
      'Edit Addition',
      name: 'editAddition',
      desc: '',
      args: [],
    );
  }

  /// `This will permanently delete this transaction.`
  String get thisWillPermanentlyDeleteThisTransaction {
    return Intl.message(
      'This will permanently delete this transaction.',
      name: 'thisWillPermanentlyDeleteThisTransaction',
      desc: '',
      args: [],
    );
  }

  /// `Note (optional)`
  String get noteOptional {
    return Intl.message(
      'Note (optional)',
      name: 'noteOptional',
      desc: '',
      args: [],
    );
  }

  /// `Edit Vault Balance`
  String get editVaultBalance {
    return Intl.message(
      'Edit Vault Balance',
      name: 'editVaultBalance',
      desc: '',
      args: [],
    );
  }

  /// `Please enter an amount`
  String get pleaseEnterAmount {
    return Intl.message(
      'Please enter an amount',
      name: 'pleaseEnterAmount',
      desc: '',
      args: [],
    );
  }

  /// `Customer Action`
  String get customerAction {
    return Intl.message(
      'Customer Action',
      name: 'customerAction',
      desc: '',
      args: [],
    );
  }

  /// `Supplier Action`
  String get supplierAction {
    return Intl.message(
      'Supplier Action',
      name: 'supplierAction',
      desc: '',
      args: [],
    );
  }

  /// `Call`
  String get call {
    return Intl.message('Call', name: 'call', desc: '', args: []);
  }

  /// `Shop Name`
  String get shopName {
    return Intl.message('Shop Name', name: 'shopName', desc: '', args: []);
  }

  /// `Edit Sale Payment`
  String get editSalePayment {
    return Intl.message(
      'Edit Sale Payment',
      name: 'editSalePayment',
      desc: '',
      args: [],
    );
  }

  /// `Edit Buy Payment`
  String get editBuyPayment {
    return Intl.message(
      'Edit Buy Payment',
      name: 'editBuyPayment',
      desc: '',
      args: [],
    );
  }

  /// `Edit Return Payment`
  String get editReturnPayment {
    return Intl.message(
      'Edit Return Payment',
      name: 'editReturnPayment',
      desc: '',
      args: [],
    );
  }

  /// `Today`
  String get today {
    return Intl.message('Today', name: 'today', desc: '', args: []);
  }

  /// `Yesterday`
  String get yesterday {
    return Intl.message('Yesterday', name: 'yesterday', desc: '', args: []);
  }

  /// `Last Week`
  String get lastWeek {
    return Intl.message('Last Week', name: 'lastWeek', desc: '', args: []);
  }

  /// `This Month`
  String get thisMonth {
    return Intl.message('This Month', name: 'thisMonth', desc: '', args: []);
  }

  /// `Older`
  String get older {
    return Intl.message('Older', name: 'older', desc: '', args: []);
  }

  /// `In Stock`
  String get inStock {
    return Intl.message('In Stock', name: 'inStock', desc: '', args: []);
  }

  /// `Out of Stock`
  String get outOfStock2 {
    return Intl.message(
      'Out of Stock',
      name: 'outOfStock2',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message('OK', name: 'ok', desc: '', args: []);
  }

  /// `Creating backup...`
  String get creatingBackup {
    return Intl.message(
      'Creating backup...',
      name: 'creatingBackup',
      desc: '',
      args: [],
    );
  }

  /// `Backup complete!`
  String get backupComplete {
    return Intl.message(
      'Backup complete!',
      name: 'backupComplete',
      desc: '',
      args: [],
    );
  }

  /// `Backup failed`
  String get backupFailed {
    return Intl.message(
      'Backup failed',
      name: 'backupFailed',
      desc: '',
      args: [],
    );
  }

  /// `Restore cancelled.`
  String get restoreCancelled {
    return Intl.message(
      'Restore cancelled.',
      name: 'restoreCancelled',
      desc: '',
      args: [],
    );
  }

  /// `Invalid backup file. Please select a .invobak file.`
  String get invalidBackupFilePleaseSelectInvobakFile {
    return Intl.message(
      'Invalid backup file. Please select a .invobak file.',
      name: 'invalidBackupFilePleaseSelectInvobakFile',
      desc: '',
      args: [],
    );
  }

  /// `Restoring...`
  String get restoring {
    return Intl.message('Restoring...', name: 'restoring', desc: '', args: []);
  }

  /// `Encryption key must be 32 characters for AES-256.`
  String get encryptionKeyMustBe32 {
    return Intl.message(
      'Encryption key must be 32 characters for AES-256.',
      name: 'encryptionKeyMustBe32',
      desc: '',
      args: [],
    );
  }

  /// `Restore complete! Restarting in`
  String get restoreCompleteRestarting {
    return Intl.message(
      'Restore complete! Restarting in',
      name: 'restoreCompleteRestarting',
      desc: '',
      args: [],
    );
  }

  /// `Restore failed:`
  String get restoreFailed {
    return Intl.message(
      'Restore failed:',
      name: 'restoreFailed',
      desc: '',
      args: [],
    );
  }

  /// `Restarting in`
  String get restartingIn {
    return Intl.message(
      'Restarting in',
      name: 'restartingIn',
      desc: '',
      args: [],
    );
  }

  /// `*Must restart the app for changes to take effect`
  String get mustRestartTheAppForChangesToTakeEffect {
    return Intl.message(
      '*Must restart the app for changes to take effect',
      name: 'mustRestartTheAppForChangesToTakeEffect',
      desc: '',
      args: [],
    );
  }

  /// `Cash`
  String get cash {
    return Intl.message('Cash', name: 'cash', desc: '', args: []);
  }

  /// `MasterCard`
  String get masterCard {
    return Intl.message('MasterCard', name: 'masterCard', desc: '', args: []);
  }

  /// `Bank Transfer`
  String get bankTransfer {
    return Intl.message(
      'Bank Transfer',
      name: 'bankTransfer',
      desc: '',
      args: [],
    );
  }

  /// `Completed successfully With Total: {count}`
  String completedSuccessfullyWithTotal(Object count) {
    return Intl.message(
      'Completed successfully With Total: $count',
      name: 'completedSuccessfullyWithTotal',
      desc: '',
      args: [count],
    );
  }

  /// `{itemName} is low on stock ({count} left).`
  String lowStockItemWithQuantity(Object itemName, Object count) {
    return Intl.message(
      '$itemName is low on stock ($count left).',
      name: 'lowStockItemWithQuantity',
      desc: '',
      args: [itemName, count],
    );
  }

  /// `{itemName} is out of stock.`
  String outOfStockItemWithName(Object itemName) {
    return Intl.message(
      '$itemName is out of stock.',
      name: 'outOfStockItemWithName',
      desc: '',
      args: [itemName],
    );
  }

  /// `This field is required`
  String get thisFieldIsRequired {
    return Intl.message(
      'This field is required',
      name: 'thisFieldIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get success {
    return Intl.message('Success', name: 'success', desc: '', args: []);
  }

  /// `Receipt saved successfully`
  String get receiptSavedSuccessfully {
    return Intl.message(
      'Receipt saved successfully',
      name: 'receiptSavedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `This is the first version of the app.`
  String get thisIsTheFirstVersionOfTheApp {
    return Intl.message(
      'This is the first version of the app.',
      name: 'thisIsTheFirstVersionOfTheApp',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this item?`
  String get areYouSureYouWantToDeleteThisItem {
    return Intl.message(
      'Are you sure you want to delete this item?',
      name: 'areYouSureYouWantToDeleteThisItem',
      desc: '',
      args: [],
    );
  }

  /// `Checking...`
  String get checking {
    return Intl.message('Checking...', name: 'checking', desc: '', args: []);
  }

  /// `Update Available`
  String get updateAvailable {
    return Intl.message(
      'Update Available',
      name: 'updateAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Error fetching update info`
  String get errorFetchingUpdateInfo {
    return Intl.message(
      'Error fetching update info',
      name: 'errorFetchingUpdateInfo',
      desc: '',
      args: [],
    );
  }

  /// `No update check recorded yet.`
  String get noUpdateCheckRecordedYet {
    return Intl.message(
      'No update check recorded yet.',
      name: 'noUpdateCheckRecordedYet',
      desc: '',
      args: [],
    );
  }

  /// `Last Checked : {time}`
  String lastChecked(Object time) {
    return Intl.message(
      'Last Checked : $time',
      name: 'lastChecked',
      desc: 'Last time the update was checked.',
      args: [time],
    );
  }

  /// `🔄 Downloading update...`
  String get downloadingUpdate {
    return Intl.message(
      '🔄 Downloading update...',
      name: 'downloadingUpdate',
      desc: '',
      args: [],
    );
  }

  /// `✅ Update downloaded. Please restart the app.`
  String get updateDownloadedPleaseRestartTheApp {
    return Intl.message(
      '✅ Update downloaded. Please restart the app.',
      name: 'updateDownloadedPleaseRestartTheApp',
      desc: '',
      args: [],
    );
  }

  /// `🎉 App is already up to date.`
  String get appIsAlreadyUpToDate {
    return Intl.message(
      '🎉 App is already up to date.',
      name: 'appIsAlreadyUpToDate',
      desc: '',
      args: [],
    );
  }

  /// `⚠️ In-App Update Error: {error}`
  String inAppUpdateError(Object error) {
    return Intl.message(
      '⚠️ In-App Update Error: $error',
      name: 'inAppUpdateError',
      desc: 'Error message for in-app update errors.',
      args: [error],
    );
  }

  /// `⚠️ Could not check for update.`
  String get couldNotCheckForUpdate {
    return Intl.message(
      '⚠️ Could not check for update.',
      name: 'couldNotCheckForUpdate',
      desc: '',
      args: [],
    );
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
