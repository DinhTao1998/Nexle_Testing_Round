import 'package:get_it/get_it.dart';
class DataResponse<T extends Object> {
  DataResponse(this.data);
  factory DataResponse.fromJson(Map<String, dynamic> json){
    return DataResponse(GetIt.instance.get<T>(param1: json));
  }
  final T? data;
}
class DataListResponse<T extends Object> {
  DataListResponse(this.data);
  factory DataListResponse.fromJson(List listJson){
    List<T> listData = listJson.map((e) => GetIt.instance.get<T>(param1: e)).toList();
    return DataListResponse(listData);
  }
  final List<T>? data;
}