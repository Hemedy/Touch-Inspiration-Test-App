import 'dart:convert';

import 'package:app/constants/config.dart';
import 'package:app/controller/server_requests.dart';

class User{
  final int id;
  final String name;
  final String occupation;
  final String email;
  final String bio;
  final String created_at;
  final String updated_at;

  User({this.id,this.name,this.occupation,this.email,this.bio,this.created_at,this.updated_at});

  factory User.fromJson(Map<String, dynamic> json){
    return User(
        id: json['id'],
      name: json['name'],
      occupation: json['occupation'],
      email: json['email'],
      bio: json['bio'],
      created_at: json['created_at'],
      updated_at:json['updated_at']
    );

  }

  static Resource<List<User>> get all{
    return Resource(
      url: Config.SERVER_GET,
      parse: (response){
        final result = json.decode(response.body);
        Iterable list = result;
        return list.map((model) => User.fromJson(model)).toList();
      }
    );
  }


}