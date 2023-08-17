class UserModel {
  String name;
  String living_location;
  int age;
  String phone;
  String email;
  //String password;
  //String confirmPassword;

  UserModel(
      {
        required this.name,
        required this.age,
        required this.living_location,
        required this.phone,
        required this.email,
        //required this.password,
        //required this.confirmPassword,

      });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'name': name,
      'email': email,
      'age': age,
      'living_location': living_location,
      'phone': phone,
      //'password': password,
      //'confirm_password': confirmPassword,
    };
    return map;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      email: map['email'] as String,
      age: map['age'] as int ,
      living_location: map['living_location'] as String,
      phone: map['phone'] as String ,
      //password: map['password'] as String,
      //confirmPassword: map['confirm_password'] as String,
    );
  }

  UserModel copyWith({
    String? name,
    String? email,
    int? age,
    String? living_location,
    String? phone,

    //String? password,
    //String? confirmPassword,


  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      age: age ?? this.age,
      living_location: email ?? this.living_location,
      phone: phone ?? this.phone,
      //password: password ?? this.password,
      //confirmPassword: confirmPassword ?? this.confirmPassword,

    );
  }
}
