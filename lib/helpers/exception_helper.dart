import 'dart:math';

import 'package:dio/dio.dart';
import 'package:nexle_testing_round/helpers/helpers.dart';
abstract class BaseException implements Exception{
  const BaseException();
  String getError();
  @override
  String toString() {
    // TODO: implement toString
    return super.toString();
  }
}

class MyDefaultException extends BaseException{
  final String error;
  const MyDefaultException(this.error);

  @override
  String getError() {
    return error;
  }
}

class MyHttpResponseTimeOut extends BaseException{
  final String error;
  const MyHttpResponseTimeOut(this.error);

  @override
  String getError() {
    return error;
  }
}

class MyHttpResponseError extends BaseException with ResponseErrorHelper{
  final DioError error;
  const MyHttpResponseError(this.error);

  @override
  String getError() {
    return error.response!= null?handleError(error.response!):error.error.toString();
  }
}