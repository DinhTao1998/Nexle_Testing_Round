import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class UserModel{
  int? id;
  String? email;
  String? password;
  String? lastName;
  String? firstName;
  String? createdAt;
  String? updatedAt;
  String? role;

  UserModel({this.id,this.email, this.password, this.lastName, this.firstName,this.createdAt,this.updatedAt,this.role});

  @factoryMethod
  UserModel.fromJson(@factoryParam Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    password =  json['password'];
    lastName = json['lastName'];
    firstName = json['firstName'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['password'] = password;
    data['lastName'] = lastName;
    data['firstName'] = firstName;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['role'] = role;
    return data;
  }
}