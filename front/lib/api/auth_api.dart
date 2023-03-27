import 'dart:convert';
import 'dart:math';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

import '../models/user_models.dart';
import '../ui/common/app_constants.dart';

Future<dynamic> userAuth(String email, String password) async {
  Map body = {"username": "", "email": email, "password": password};
  var url = Uri.parse("$baseUrl/user/auth/login/");
  var res = await http.post(url, body: body);

  print(res.body);
  print(res.statusCode);

  if (res.statusCode == 200) {
    Map json = jsonDecode(res.body);
    String token = json['key'];
    var box = await Hive.openBox(authBox);
    box.put("token", token);
    User? user = await getUser(token);
    return user;
  } else {
    Map json = jsonDecode(res.body);
    print(json);
    if (json.containsKey("email")) {
      return json["email"][0];
    }
    if (json.containsKey("password")) {
      return json["email"][0];
    }
    if (json.containsKey("non_field_errors")) {
      return json["non_field_errors"][0];
    }
  }
}

Future<User?> getUser(String token) async {
  var url = Uri.parse("$baseUrl/user/auth/user/");
  var res = await http.get(url, headers: {
    'Authorization': 'Token ${token}',
  });
  if (res.statusCode == 200) {
    var json = jsonDecode(res.body);

    User user = User.fromJson(json);
    user.token = token;
    return user;
  } else {
    return null;
  }
}

Future<dynamic> registerUser(
  String username,
  String email,
  String password,
  String confirmPassword,
  String firstName,
  String lastName,
) async {
  Map<String, dynamic> data = {
    "username": username,
    "email": email,
    "password1": password,
    "password2": confirmPassword,
    "first_name": firstName,
    "last_name": lastName
  };
  var url = Uri.parse("$baseUrl/user/auth/registration/");
  var res = await http.post(url, body: data);
  if (res.statusCode == 200 || res.statusCode == 201) {
    Map json = jsonDecode(res.body);

    if (json.containsKey("key")) {
      String token = json["key"];
      var a = await getUser(token);
      if (a != null) {
        User user = a;
      } else {
        return null;
      }
    }
  } else if (res.statusCode == 400) {
    Map json = jsonDecode(res.body);
    if (json.containsKey("email")) {
      return json["email"][0];
    } else if (json.containsKey("password")) {
      return json["password"][0];
    }
  } else {
    print(res.body);
    print("res.body");
    print(res.statusCode);
    return null;
  }
}



//{"pk":9,"username":"Ruma","email":"ruma@ruma.com","first_name":"Rudy","last_name":"Mailse"}


//test3@test.com
//22313372Ss

// {
//     "key": "64deae12539376150fa1b146a856f9e3f425fcf4"
// }