class VValidator {
  VValidator._();

  // ----- Empty validator -----//
  static String? validateEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  // ----- Number validator -----//
  static String? validateIntegerNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    if (int.tryParse(value) == null) {
      return 'Enter a valid number';
    }

    return null;
  }

  static String? validateDoubleNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }

    // Check if the input can be parsed as a double
    if (double.tryParse(value) == null) {
      return 'Enter a valid number';
    }

    // Regular expression to check for at most two decimal places
    final RegExp decimalRegExp = RegExp(r'^\d+(\.\d{1,2})?$');
    if (!decimalRegExp.hasMatch(value)) {
      return 'Enter a number with up to 2 decimal places';
    }

    return null;
  }

  static String? validateNumberWithLimit(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    if (double.tryParse(value) == null) {
      return 'Enter a valid number';
    }
    if (value.length > 10) {
      return 'Maximum 10 digits allowed';
    }
    return null;
  }

  // --- Selling price validator---//
  static String? validateSellingPrice(String? value, String? buyingPrice) {
    if (value == null || value.isEmpty) {
      return 'Selling price is required';
    }

    // Regular expression to check for valid number format with up to 2 decimal places
    final RegExp decimalRegExp = RegExp(r'^\d+(\.\d{1,2})?$');

    // Check if the selling price matches the decimal format
    if (!decimalRegExp.hasMatch(value)) {
      return 'Enter a number with up to 2 decimal places';
    }

    final sellingPrice = double.tryParse(value);
    final buying = double.tryParse(buyingPrice ?? '');

    if (sellingPrice == null) {
      return 'Enter a valid number';
    }

    if (buying != null && sellingPrice <= buying) {
      return 'Selling price must be greater than buying price';
    }

    return null;
  }

  static String? validateDiscountNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    if (int.tryParse(value) == null || int.tryParse(value)! > 100) {
      return 'Enter a valid number';
    }

    return null;
  }

  // ----- Email validator -----//
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required.';
    }

    // Regular exp. for validating emails
    final emailRegExp = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'Invalid email address';
    }
    return null;
  }

  // ----- Password validator -------
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    // minimum length
    if (value.length < 6) {
      return 'Password must be at least 6 character long.';
    }

    // Check for uppercase letters
    if (!value.contains(RegExp(r'[A,Z]'))) {
      return 'Password must contain at least one uppercase letter.';
    }

    // Check for numbers
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number';
    }

    // Check for special characters
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain at least one special character.';
    }
    return null;
  }

  // ----- Phone number validator ------
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required.';
    }

    // Reg exp with 10-digits
    final phoneRegExp = RegExp(r'^\d{10}$');
    if (!phoneRegExp.hasMatch(value)) {
      return 'Invalid phone number format (10 digits required.)';
    }
    return null;
  }
}
