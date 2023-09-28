import 'dart:async';
import 'package:dio/dio.dart';
import 'package:nexle_testing_round/services/client_service/config/dio_service.dart';
import 'package:nexle_testing_round/services/services.dart';
import 'package:nexle_testing_round/helpers/helpers.dart';
import 'package:nexle_testing_round/data/data.dart';
class ClientService with ResponseErrorHelper{
  static ClientService ? _clientService;
  const ClientService._internal();
  factory ClientService.init(){
    if(_clientService == null){
      _clientService = const ClientService._internal();
      _dio = DioService.createDio();
    }
    return _clientService!;
  }

  static late final Dio _dio;

  static ClientService get instance => _clientService!;

  static Map<String,dynamic> ?_auth;

  set setAuth(Map<String,String> ?auth){
    _auth ??= auth;
  }

  Map<String,dynamic> _getHeaders(Map<String,dynamic> ? header){
    Map<String,dynamic> headers = {};
    if(header != null) {
      headers.addAll(header);
    }
    if(_auth != null) {
      headers.addAll(_auth!);
    }
    return headers;
  }

  Future<T> request<T,D extends Object>({
      required String path, 
      required MyHttpMethod method,Map<String,
      dynamic> ?headers,
      String ?contentType,
      dynamic data,
      Map<String,dynamic> ?queryParameters,
      SuccessResponseMapperType ?successResponseMapperType,
      LogService logService = const LogService()})
  async{
    try {
      Response response = await _dio.request(
        path,
        options:Options(method: method.name,headers: _getHeaders(headers),contentType: contentType),
        data: data,
        queryParameters: queryParameters
      );
      return _responseConvert<T,D>(response,successResponseMapperType,logService);
    }on TimeoutException catch(e){
      throw logService.writeLog<MyDefaultException>(const MyDefaultException('Time out'));
    }on DioError catch (e){
      throw logService.writeLog<MyHttpResponseError>(MyHttpResponseError(e));
    }catch(e){
      throw logService.writeLog<MyDefaultException>(MyDefaultException(e.toString()));
    }
  }

  T _responseConvert<T,D extends Object>(Response response,SuccessResponseMapperType ?successResponseMapperType, LogService logService){
    if(response.statusCode ==200 || response.statusCode == 201){
      return BaseSuccessResponseMapper<D,T>.fromType(successResponseMapperType??SuccessResponseMapperType.defaultType).map(response.data);
    }
    throw logService.writeLog<MyHttpResponseError>(MyDefaultException(handleError(response)));
  }
}

enum MyHttpMethod{
  GET,
  PUT,
  PATCH,
  POST,
  DELETE
}

// class MyHttpResponse{
//   final bool success;
//   final String ?error;
//   final dynamic data;
//
//   MyHttpResponse._internal(this.success,this.data,this.error);
//
//   factory MyHttpResponse.success({required dynamic data}){
//     return MyHttpResponse._internal(true,data,null);
//   }
//
//   factory MyHttpResponse.error({required String error, data}){
//     return MyHttpResponse._internal(false,data,error);
//   }
// }