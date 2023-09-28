import '../../models/base_data/data_response.dart';
import '../base/base_success_response.dart';
class ArrayValueResponseMapper<T extends Object> extends BaseSuccessResponseMapper<T, DataListResponse<T>> {
  @override
  DataListResponse<T> map(dynamic response) {
    List<T> listData  = (response as List).map<T>((e) => e).toList();
    return DataListResponse(listData);
  }
}