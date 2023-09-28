import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:nexle_testing_round/models/category/category.dart';
import 'package:nexle_testing_round/services/services.dart';
import 'package:nexle_testing_round/use_cases/get_list_category_use_case.dart';

import 'base_use_case/base_use_case.dart';
@lazySingleton
class GetListCategoryFromLocalUseCase extends BaseUseCase<GetListCategoryUseCaseInput,GetListCategoryUseCaseOutput> with LogMixin{
  @override
  Future<GetListCategoryUseCaseOutput> buildUseCase([GetListCategoryUseCaseInput ?input]) async {
    String ?data = await LocalStorageService.instance.getValue('category');
    if(data == null) return GetListCategoryUseCaseOutput(List<CategoryModel>.empty());
    List<CategoryModel> listModel = (jsonDecode(data) as List).map((e) => CategoryModel.fromJson(e)).toList();
    return GetListCategoryUseCaseOutput(listModel);
  }
}
