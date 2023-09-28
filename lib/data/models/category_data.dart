import 'package:injectable/injectable.dart';
@injectable
class CategoryData{
  CategoryData._();
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;
  @factoryMethod
  CategoryData.fromJson(@factoryParam Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
}