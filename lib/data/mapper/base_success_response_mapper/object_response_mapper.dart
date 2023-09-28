import '../../models/base_data/data_response.dart';
import '../base/base_success_response.dart';

class ObjectResponseMapper<T extends Object> extends BaseSuccessResponseMapper<T, DataResponse<T>> {
  @override
  DataResponse<T> map(dynamic response) {
    return DataResponse.fromJson(response);
  }
}