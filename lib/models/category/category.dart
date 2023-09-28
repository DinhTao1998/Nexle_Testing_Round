import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class CategoryModel extends Equatable{
  int? id;
  String? createdAt;
  String? updatedAt;
  String? name;

  CategoryModel({this.id, this.createdAt, this.name, this.updatedAt}): super();

  @factoryMethod
  CategoryModel.fromJson(@factoryParam Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}