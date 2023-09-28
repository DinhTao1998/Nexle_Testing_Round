import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:nexle_testing_round/models/models.dart';
import 'package:nexle_testing_round/use_cases/get_list_category_from_local_use_case.dart';
import 'package:nexle_testing_round/use_cases/get_list_category_use_case.dart';
import 'package:get_it/get_it.dart';
import 'package:nexle_testing_round/use_cases/save_list_category_use_case.dart';
@lazySingleton
class CategoryScreenController extends GetxController{
  CategoryScreenController(this._getListCategoryUseCase, this._saveListCategoryUseCase, this._getListCategoryFromLocalUseCase);
  final GetListCategoryUseCase _getListCategoryUseCase;
  final SaveListCategoryUseCase _saveListCategoryUseCase;
  final GetListCategoryFromLocalUseCase _getListCategoryFromLocalUseCase;

  List<CategoryModel> listCategory = List<CategoryModel>.empty();
  List<CategoryModel> listSelectedCategory = [];

  RxBool isLoading = false.obs;
  RxBool showButtonSave = false.obs;

  @override
  void onInit(){
    _initData();
    super.onInit();
  }

  Future _initData() async {
    isLoading.value = true;
    await Future.wait([
      _loadListCategory(),
      _loadListCategoryFromLocal()
    ]);
    isLoading.value = false;
    _showButtonSave();
  }

  void _showButtonSave(){
    showButtonSave.value = listSelectedCategory.isNotEmpty;
  }

  Future _loadListCategory() async{
    final res = await _getListCategoryUseCase.execute();
    listCategory = res.listModel;
  }

  Future _loadListCategoryFromLocal() async{
    final res = await _getListCategoryFromLocalUseCase.execute();
    listSelectedCategory.clear();
    listSelectedCategory.addAll(res.listModel);
  }

  Future _saveListCategory() async{
    await _saveListCategoryUseCase.execute(SaveListCategoryUseCaseInput(listSelectedCategory));
    Get.snackbar('Successfully', 'Save data successfully');
  }

  void selected(CategoryModel model){
    listSelectedCategory.add(model);
    _showButtonSave();
  }

  void unSelected(CategoryModel model){
    listSelectedCategory.remove(model);
    _showButtonSave();
  }

  void pressButtonDone(){
    _saveListCategory();
  }
}

class CategoryScreenControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetIt.instance.get<CategoryScreenController>());
  }
}