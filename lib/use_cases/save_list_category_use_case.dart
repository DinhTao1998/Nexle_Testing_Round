import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:nexle_testing_round/models/category/category.dart';
import 'package:nexle_testing_round/services/services.dart';

import 'base_use_case/base_use_case.dart';
@lazySingleton
class SaveListCategoryUseCase extends BaseUseCase<SaveListCategoryUseCaseInput,SaveListCategoryUseCaseOutput> with LogMixin{
  @override
  Future<SaveListCategoryUseCaseOutput> buildUseCase([SaveListCategoryUseCaseInput ?input]) async {
    if(input!.listModel.isNotEmpty){
      LocalStorageService.instance.setValue('category', jsonEncode(input.listModel.map((e) => e.toJson()).toList()));
    }else{
      LocalStorageService.instance.removeValue('category');
    }
    return const SaveListCategoryUseCaseOutput();
  }
}

class SaveListCategoryUseCaseInput extends BaseUseCaseInput{
  const SaveListCategoryUseCaseInput(this.listModel);

  final List<CategoryModel> listModel;
}
class SaveListCategoryUseCaseOutput extends BaseUseCaseOutput{
  const SaveListCategoryUseCaseOutput();
}