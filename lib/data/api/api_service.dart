import 'package:nexle_testing_round/data/data.dart';
import 'package:nexle_testing_round/data/models/base_data/data_response.dart';
import 'package:nexle_testing_round/models/form/form.dart';
import 'package:nexle_testing_round/services/services.dart';
import 'package:nexle_testing_round/resources/resources.dart';
import 'package:dio/dio.dart';
class AppApiService{
  static AppApiService ?_appApiService;
  const AppApiService._(this._clientService);
  static AppApiService getInstance(){
    _appApiService ??= AppApiService._(ClientService.instance);
    return _appApiService!;
  }

  final ClientService _clientService;

  Future<DataListResponse<CategoryData>> getCategories({LogService logService = const LogService()}) async {
    return await _clientService.request<DataListResponse<CategoryData>,CategoryData>(
        path: DataResource.API_GET_LIST_CATEGORY,
        method: MyHttpMethod.GET,
        logService: logService,
        successResponseMapperType: SuccessResponseMapperType.arrayObject
    );
  }

  Future<DataResponse<UserData>> signUp({required BaseFormDataModel formData,LogService logService = const LogService()}) async {
    return await _clientService.request<DataResponse<UserData>,UserData>(
        path: DataResource.API_SIGN_UP,
        method: MyHttpMethod.POST,
        data: formData.toJson(),
        contentType: Headers.formUrlEncodedContentType,
        logService: logService,
        successResponseMapperType: SuccessResponseMapperType.object
    );
  }

  Future<DataResponse<AuthData>> signIn({required BaseFormDataModel formData,LogService logService = const LogService()}) async {
    return await _clientService.request<DataResponse<AuthData>,AuthData>(
        path: DataResource.API_SIGN_IN,
        method: MyHttpMethod.POST,
        data: formData.toJson(),
        contentType: Headers.formUrlEncodedContentType,
        logService: logService,
        successResponseMapperType: SuccessResponseMapperType.object
    );
  }
}