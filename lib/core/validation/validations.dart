abstract class Validations {
  // static const String _phoneNoRegExp = r'^(?:[0+][0-9])';
  static const String _visaNoRegExp = r'^(?:[0-9])?[0-9]{16}$';
  static const String _cvvNoRegExp = r'^(?:[0-9])?[0-9]{3}$';

  static String? validateName(String? name) {
    if (name!.trim().isEmpty) return 'Name is Required.';
    if (name.length < 2) return 'Name must be at least 2 characters.';
    if (name.length > 50) return 'Name must be at most 50 character.';
    return null;
  }

  static String? validatePhone(String? mobileNo) {
    if (mobileNo!.trim().isEmpty) return 'Phone No is Required.';
    // if (!RegExp(_phoneNoRegExp).hasMatch(mobileNo)) return 'Invalid phone number.';
    if (mobileNo.trim().startsWith('0')) {
      if (mobileNo.trim().length < 9) {
        return 'Invalid phone number.';
      }
    } else {
      if (mobileNo.trim().length < 9) {
        return 'Invalid phone number.';
      }
    }
    if (!RegExp(r'^(?:[0-9])').hasMatch(mobileNo))
      return 'Invalid phone number.';
    // if (mobileNo.length != 11) return 'Mobile No must have 11 digits.';
    return null;
  }

  static String? validateBirthdate(String? birthdate) {
    if (birthdate!.trim().isEmpty) return 'Birthdate is Required.';
    return null;
  }

  static String? validateGender(String? gender) {
    if (gender!.trim().isEmpty) return 'Gender is Required.';
    return null;
  }

  static String? validatePassword(String? password) {
    if (password!.trim().isEmpty) return 'Password is Required.';
    if (password.length < 6) return 'Password must be at least 6 characters.';
    if (password.length > 100) return 'Password must be at most 100 character.';
    return null;
  }

  static String? validateConfirmPassword(
      String? confirmPassword, String? password) {
    if (confirmPassword != password) return 'Password is\'t identical.';
    return null;
  }

  static String? validatorPasswordLogin(String? password) {
    if (password!.trim().isEmpty) return 'Password is Required.';
    return null;
  }

  static String? validateVisaCardNumber(String? cardNumber) {
    if (cardNumber!.trim().isEmpty) return 'Card Number is Required.';
    if (!RegExp(_visaNoRegExp).hasMatch(cardNumber))
      return 'Incorrect card number.';
    return null;
  }

  static String? validateCVVCard(String? cvv) {
    if (cvv!.trim().isEmpty) return 'CVV Number is Required.';
    if (!RegExp(_cvvNoRegExp).hasMatch(cvv)) return 'Incorrect cvv number.';
    return null;
  }

  static String? validateCardDate(String? date) {
    if (date!.trim().isEmpty) return ' Card Date is Required.';
    if (date.trim().length != 5) return 'Invalid date format';

    return null;
  }

  static String? validateCardName(String? cardName) {
    if (cardName!.trim().isEmpty) return 'Card Name is Required.';
    return null;
  }
}
