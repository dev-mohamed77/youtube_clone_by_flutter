import 'dart:io';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:youtube_clone/core/services/network_services/error_model.dart';

part 'error_handle.freezed.dart';

// use error handle by freezed package

@freezed
class ErrorHandle with _$ErrorHandle {
  const factory ErrorHandle.requestCancelled() = RequestCancelled;

  const factory ErrorHandle.unauthorizedRequest(String reason) =
      UnauthorizedRequest;

  const factory ErrorHandle.badRequest(String error) = BadRequest;

  const factory ErrorHandle.notFound(String reason) = NotFound;

  const factory ErrorHandle.methodNotAllowed() = MethodNotAllowed;

  const factory ErrorHandle.notAcceptable() = NotAcceptable;

  const factory ErrorHandle.requestTimeout() = RequestTimeout;

  const factory ErrorHandle.sendTimeout() = SendTimeout;

  const factory ErrorHandle.unprocessableEntity(String reason) =
      UnprocessableEntity;

  const factory ErrorHandle.conflict() = Conflict;

  const factory ErrorHandle.internalServerError() = InternalServerError;

  const factory ErrorHandle.notImplemented() = NotImplemented;

  const factory ErrorHandle.serviceUnavailable() = ServiceUnavailable;

  const factory ErrorHandle.noInternetConnection() = NoInternetConnection;

  const factory ErrorHandle.formatException() = FormatException;

  const factory ErrorHandle.unableToProcess() = UnableToProcess;

  const factory ErrorHandle.defaultError(String error) = DefaultError;

  const factory ErrorHandle.unexpectedError() = UnexpectedError;

  static ErrorHandle handleResponse(Response? response) {
    ErrorModel errorModel = ErrorModel.fromMap(response?.data);

    int statusCode = response?.statusCode ?? 0;

    switch (statusCode) {
      case 400:
        return ErrorHandle.badRequest(
          errorModel.message,
        );
      case 401:
        return ErrorHandle.unauthorizedRequest(
          errorModel.message,
        );
      case 403:
        return ErrorHandle.unauthorizedRequest(
          errorModel.message,
        );
      case 404:
        return ErrorHandle.notFound(
          errorModel.message,
        );
      case 409:
        return const ErrorHandle.conflict();
      case 408:
        return const ErrorHandle.requestTimeout();
      case 422:
        return ErrorHandle.unprocessableEntity(
          "${errorModel.status} ${errorModel.message}",
        );
      case 500:
        return const ErrorHandle.internalServerError();
      case 503:
        return const ErrorHandle.serviceUnavailable();
      default:
        var responseCode = statusCode;
        return ErrorHandle.defaultError(
          "Received invalid status code: $responseCode",
        );
    }
  }

  static ErrorHandle getDioException(error) {
    if (error is Exception) {
      try {
        late ErrorHandle errorHandle;
        if (error is DioError) {
          switch (error.type) {
            case DioErrorType.cancel:
              errorHandle = const ErrorHandle.requestCancelled();
              break;
            case DioErrorType.connectTimeout:
              errorHandle = const ErrorHandle.requestTimeout();
              break;
            case DioErrorType.other:
              errorHandle = const ErrorHandle.noInternetConnection();
              break;
            case DioErrorType.receiveTimeout:
              errorHandle = const ErrorHandle.sendTimeout();
              break;
            case DioErrorType.response:
              errorHandle = ErrorHandle.handleResponse(error.response);
              break;
            case DioErrorType.sendTimeout:
              errorHandle = const ErrorHandle.sendTimeout();
              break;
          }
        } else if (error is SocketException) {
          errorHandle = const ErrorHandle.noInternetConnection();
        } else {
          errorHandle = const ErrorHandle.unexpectedError();
        }
        return errorHandle;
      } on FormatException catch (_) {
        return const ErrorHandle.formatException();
      } catch (_) {
        return const ErrorHandle.unexpectedError();
      }
    } else {
      if (error.toString().contains("is not a subtype of")) {
        return const ErrorHandle.unableToProcess();
      } else {
        return const ErrorHandle.unexpectedError();
      }
    }
  }

  static String getErrorMessage(ErrorHandle errorHandle) {
    var errorMessage = "";
    errorHandle.when(notImplemented: () {
      errorMessage = "Not Implemented";
    }, requestCancelled: () {
      errorMessage = "Request Cancelled";
    }, internalServerError: () {
      errorMessage = "Internal Server Error";
    }, notFound: (String reason) {
      errorMessage = reason;
    }, serviceUnavailable: () {
      errorMessage = "Service unavailable";
    }, methodNotAllowed: () {
      errorMessage = "Method Allowed";
    }, badRequest: (String error) {
      errorMessage = error;
    }, unauthorizedRequest: (String error) {
      errorMessage = error;
    }, unprocessableEntity: (String error) {
      errorMessage = error;
    }, unexpectedError: () {
      errorMessage = "Unexpected error occurred";
    }, requestTimeout: () {
      errorMessage = "Connection request timeout";
    }, noInternetConnection: () {
      errorMessage = "No internet connection";
    }, conflict: () {
      errorMessage = "Error due to a conflict";
    }, sendTimeout: () {
      errorMessage = "Send timeout in connection with API server";
    }, unableToProcess: () {
      errorMessage = "Unable to process the data";
    }, defaultError: (String error) {
      errorMessage = error;
    }, formatException: () {
      errorMessage = "Unexpected error occurred";
    }, notAcceptable: () {
      errorMessage = "Not acceptable";
    });
    return errorMessage;
  }
}








// use error handle by abstract class


// import 'dart:io';

// import 'package:dio/dio.dart';

// import 'error_model.dart';


// abstract class ErrorHandle {}

// class RequestCancelled extends ErrorHandle {}

// class UnauthorizedRequest extends ErrorHandle {
//   final String message;
//   UnauthorizedRequest({
//     required this.message,
//   });
// }

// class NotFound extends ErrorHandle {
//   final String message;
//   NotFound({
//     required this.message,
//   });
// }

// class BadRequest extends ErrorHandle {}

// class MethodNotAllowed extends ErrorHandle {}

// class NotAcceptable extends ErrorHandle {}

// class RequestTimeout extends ErrorHandle {}

// class SendTimeout extends ErrorHandle {}

// class UnprocessableEntity extends ErrorHandle {
//   final String message;
//   UnprocessableEntity({
//     required this.message,
//   });
// }

// class Conflict extends ErrorHandle {}

// class InternalServerError extends ErrorHandle {}

// class NotImplemented extends ErrorHandle {}

// class ServiceUnavailable extends ErrorHandle {}

// class NoInternetConnection extends ErrorHandle {}

// class FormatException extends ErrorHandle {}

// class UnableToProcess extends ErrorHandle {}

// class DefaultError extends ErrorHandle {
//   final String error;
//   DefaultError({
//     required this.error,
//   });
// }

// class UnexpectedError extends ErrorHandle {}

// class NetWorkExceptionHandle {
//   static ErrorHandle handleResponse(Response? response) {
//     var errorModel = ErrorModel.fromMap(response?.data);

//     var statusCode = response?.statusCode ?? 0;

//     switch (statusCode) {
//       case 400:
//         return BadRequest();
//       case 401:
//         return UnauthorizedRequest(
//           message: "${errorModel.status} ${errorModel.message}",
//         );
//       case 403:
//         return UnauthorizedRequest(
//           message: "${errorModel.status} ${errorModel.message}",
//         );
//       case 404:
//         return NotFound(
//           message: "${errorModel.status} ${errorModel.message}",
//         );
//       case 409:
//         return Conflict();
//       case 408:
//         return RequestTimeout();
//       case 422:
//         return UnprocessableEntity(
//           message: "${errorModel.status} ${errorModel.message}",
//         );
//       case 500:
//         return InternalServerError();
//       case 503:
//         return ServiceUnavailable();
//       default:
//         var responseCode = statusCode;
//         return DefaultError(
//           error: "Received invalid status code: $responseCode",
//         );
//     }
//   }

//   static ErrorHandle getDioException(error) {
//     if (error is Exception) {
//       try {
//         ErrorHandle errorHandle;
//         if (error is DioError) {
//           switch (error.type) {
//             case DioErrorType.cancel:
//               errorHandle = RequestCancelled();
//               break;
//             case DioErrorType.connectTimeout:
//               errorHandle = RequestTimeout();
//               break;
//             case DioErrorType.other:
//               errorHandle = NoInternetConnection();
//               break;
//             case DioErrorType.receiveTimeout:
//               errorHandle = SendTimeout();
//               break;
//             case DioErrorType.response:
//               errorHandle =
//                   NetWorkExceptionHandle.handleResponse(error.response);
//               break;
//             case DioErrorType.sendTimeout:
//               errorHandle = SendTimeout();
//               break;
//           }
//         } else if (error is SocketException) {
//           errorHandle = NoInternetConnection();
//         } else {
//           errorHandle = UnexpectedError();
//         }
//         return errorHandle;
//       } on FormatException catch (e) {
//         return FormatException();
//       } catch (_) {
//         return UnexpectedError();
//       }
//     } else {
//       if (error.toString().contains("is not a subtype of")) {
//         return UnableToProcess();
//       } else {
//         return UnexpectedError();
//       }
//     }
    
//   }


  