import 'dart:convert';

import 'package:app/constants/config.dart';
import 'package:app/model/User.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
class Resource<T>{
  final String url;
  T Function(Response response) parse;

  Resource({this.url,this.parse});


}

class Server{
  Future<T> load<T>(Resource<T> resource ) async{
    final response = await http.get(resource.url);
    if(response.statusCode == 200){
      return resource.parse(response);
    }else{
      throw Exception('Fallie to fetch users');
    }
  }

  update(User user) async{
    var inputs =['user',{
      "name": user.name,
      "occupation": user.occupation,
      "email" : user.email,
      "bio" : user.bio,
    }];
    String myUrl = Config.SERVER_PATCH;
    final response = await  http.patch(myUrl,
        headers: {
          'Accept':'application/json'
        },
        body: {
          "name": user.name,
          "occupation": user.occupation,
          "email" : user.email,
          "bio" : user.bio,
        } ) ;
    var status = response.body.contains('error');

    var data = json.decode(response.body);

    print('body response : ${response.body.toString()}');

    if(status){
      var message = data["error"];
      print('data : ${data["error"]}');
    }else{
      print('data : ${data["success"]}');
    }

  }
}