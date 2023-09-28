import 'package:dio/dio.dart';
class ResponseErrorHelper{
  String matchError(Response response){
    switch(response.statusCode){
      case 404:
        return 'Page Not Found';
      case 403:
        return 'Forbidden';
      case 401:
        return 'Permission denied';
      case 400:
        return 'Bad Request';
      case 500:
        return 'Server Error';
      case 302:
        return 'Invalid Param';
      default:
        return 'Unknown error';
    }
  }

  String handleError (Response response){
    return '${response.realUri.path} [${response.statusCode}] ${getMessage(response)}';
  }

  String getMessage(Response response){
    if(response.data['message'] != null){
      if(response.data['message'] is List){
        return (response.data['message'] as List).join(", ");
      }

      return response.data['message'];
    }
    return matchError(response);
  }
}