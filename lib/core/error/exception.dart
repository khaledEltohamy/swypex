class ExceptionService implements Exception {}

// SERVER
class ExceptionServiceCallBack implements Exception {
  final String massage;

  ExceptionServiceCallBack({required this.massage});
}

// AUTHENTICATION
class ExceptionServiceValidationError implements Exception {
  // final UserFailureValidation userFailureValidation;
  // ExceptionServiceValidationError(this.userFailureValidation);
}

// AUTHORIZED
class ExceptionServiceAuthentication implements Exception {
  final String error;
  ExceptionServiceAuthentication({required this.error});
}

// CONNECTION NETWORK
class ExceptionOffline implements Exception {}

//LOCAL DATA BASE
class ExceptionEmptyCache implements Exception {}
