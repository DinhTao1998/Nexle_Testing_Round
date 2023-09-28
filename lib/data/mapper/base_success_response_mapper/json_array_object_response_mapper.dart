import 'dart:convert';
import '../../models/base_data/data_response.dart';
import '../base/base_success_response.dart';

class JsonArrayObjectResponseMapper<T extends Object> extends BaseSuccessResponseMapper<T, DataListResponse<T>> {
  @override
  DataListResponse<T> map(dynamic response) {
    return DataListResponse.fromJson(jsonDecode(response));
  }
}