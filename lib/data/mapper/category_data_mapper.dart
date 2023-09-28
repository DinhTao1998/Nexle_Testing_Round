import 'package:nexle_testing_round/data/data.dart';
import 'package:injectable/injectable.dart';
import 'package:nexle_testing_round/models/models.dart';
@lazySingleton
class CategoryDataMapper extends BaseDataMapper<CategoryData,CategoryModel>{
  const CategoryDataMapper();

  @override
  CategoryModel mapToEntity(CategoryData? data) {
    return CategoryModel(
        id: data?.id??-1,
        name: data?.name??'',
        createdAt: data?.createdAt??'',
        updatedAt: data?.updatedAt??''
    );
  }
}