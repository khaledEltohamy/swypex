import 'faliure.dart';

//errors Msg
const String OFFLINE_ERROR = "Offline Mode ";
const String SERVER_ERORR = "Server Not Stable";
const String SERVER_VALIDATION_ERORR = "Validation Error ";
const String SERVER_AUTHORIZED_ERORR = "Authorized Error ";
const String SERVER_INSTALLED_ERORR = "Installed Field";
const String SERVER_CONNECTION_ERORR = "Connection Field";
const String EMPTY_CACHED_ERORR = "Empty chaced data .";
const String DEFAULT_ERROR = "Authorized Error";

class ErrorModel {
  final String title;
  final String contant;

  ErrorModel({required this.title, required this.contant});

  factory ErrorModel.convertFailureError(Failure failure) {
    switch (failure.runtimeType) {
      case FailureService:
        return ErrorModel(title: SERVER_ERORR, contant: "SomeThing Wrong");
      case FailureServiceValidation:
        return ErrorModel(
            title: SERVER_VALIDATION_ERORR, contant: "Cerditional is Field");

      case FailureServiceWithResponse:
        return ErrorModel(title: DEFAULT_ERROR, contant: "Servicer ");
      case FailureOffline:
        return ErrorModel(
            title: OFFLINE_ERROR,
            contant: "OFFLINE mode Please check connection");
      default:
        return ErrorModel(
            title: DEFAULT_ERROR,
            contant: "حدث خطا ما يرجي المحاوله في وقت لاحق ");
    }
  }
}
