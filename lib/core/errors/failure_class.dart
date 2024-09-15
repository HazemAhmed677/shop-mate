// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';

class FailureService {
  final String errorMsg;

  FailureService(this.errorMsg);

  factory FailureService.fromDioException(
      {required DioExceptionType dioExecption,
      dynamic response,
      int? statusCode}) {
    switch (dioExecption) {
      case DioExceptionType.connectionTimeout:
        return FailureService('Connection timeout, Please try again');
      case DioExceptionType.sendTimeout:
        return FailureService('Send timeout, Check your network');
      case DioExceptionType.receiveTimeout:
        return FailureService('Receive timeout, Check your network');
      case DioExceptionType.badCertificate:
        return FailureService('Bad certificate, Please try later');
      case DioExceptionType.badResponse:
        return FailureService.fromBadResponse(
            statusCode: statusCode, response: response);
      case DioExceptionType.cancel:
        return FailureService('Request to server was canceled');
      case DioExceptionType.connectionError:
        return FailureService('No Internet connection');
      case DioExceptionType.unknown:
        return FailureService('Oops, there something wrong!');
      default:
        return FailureService('Oops, there something wrong!');
    }
  }
  factory FailureService.fromBadResponse({int? statusCode, dynamic response}) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return FailureService(
        response['error']['message'],
      );
    } else if (statusCode == 404) {
      return FailureService('Your request not found');
    } else {
      return FailureService('Oops, there somthing wronggvu!');
    }
  }
}
