// ignore_for_file: non_constant_identifier_names

class User {
  int? id;
  String? token;
  String? username;
  String? email, first_name, last_name;

  User({
    this.email,
    this.first_name,
    this.id,
    this.last_name,
    this.token,
    this.username,
    
  });

//{"pk":9,"username":"Ruma","email":"ruma@ruma.com","first_name":"Rudy","last_name":"Mailse"}
  factory User.fromJson(json) {
    return User(
      email: json["email"],
      first_name: json["first_name"],
      id: json["pk"],
      last_name: json["last_name"],
      token: json["token"],
      username: json["username"],
  
    );
  }
}
