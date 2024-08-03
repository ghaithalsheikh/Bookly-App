import 'package:dio/dio.dart';

abstract class Faliure {
  final String errorMessage;

  Faliure({required this.errorMessage});
}

class ServerFaliure extends Faliure {
  ServerFaliure({required super.errorMessage});

  factory ServerFaliure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFaliure(errorMessage: 'Connection timeout with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFaliure(errorMessage: 'Send timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFaliure(errorMessage: 'Receive timeout with ApiServer');

      case DioExceptionType.badCertificate:
        return ServerFaliure(errorMessage: 'badCertificatet with ApiServer');
      case DioExceptionType.badResponse:
        return ServerFaliure.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data);
      case DioExceptionType.cancel:
        return ServerFaliure(errorMessage: 'Request to ApiServer are Canceled');

      case DioExceptionType.connectionError:
        return ServerFaliure(errorMessage: 'connection Error with ApiServer');
      case DioExceptionType.unknown:
        if (dioError.message!.contains('SocketException')) {
          return ServerFaliure(errorMessage: 'No Internet Connention');
        }
        return ServerFaliure(
            errorMessage: 'UnExpected Error, Please try later!');
      default:
        return ServerFaliure(
            errorMessage: 'Opps There are an Error, Please try again');
    }
  }

  factory ServerFaliure.fromResponse(int statusCode, dynamic repsonse) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFaliure(errorMessage: repsonse['error']['message']);
    } else if (statusCode == 404) {
      return ServerFaliure(
          errorMessage: 'You Request not found, please try again!');
    } else if (statusCode == 429) {
      return ServerFaliure(
          errorMessage: 'You Request not found, please try again!');
    } else if (statusCode == 500) {
      return ServerFaliure(
          errorMessage: 'Intenral Server error, please try later');
    } else {
      return ServerFaliure(
          errorMessage: 'Opps There are an Error, Please try again');
    }
  }
}
