class User {
  final String name;
  final int age;
  final String email;
  final String token;

  User({required this.name, required this.email,required this.age ,required this.token});

Map<String, dynamic> toJson() => {
    'name': name,
    'age': age,
    'email': email,
    'token': token
  };


}




