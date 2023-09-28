import 'package:get/get.dart';
import 'package:nexle_testing_round/models/models.dart';
import 'package:injectable/injectable.dart';
abstract class BaseOptionItemMapper<T>{
  BaseOptionItemMapper({required this.model,required this.selected});
  final T model;
  RxBool selected;
  int getId();
  String getName();
}
@Injectable()
class CategoryOptionMapper extends BaseOptionItemMapper<CategoryModel>{
  CategoryOptionMapper({@factoryParam required super.model,@factoryParam required super.selected});

  @override
  int getId() {
    return model.id!;
  }

  @override
  String getName() {
    return model.name!;
  }

}