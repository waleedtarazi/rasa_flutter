class UserV3 {
  final String imagePath;
  final String name;
  final String email;
  final String about;
  final bool isDarkMode;

  const UserV3({
    required this.imagePath,
    required this.name,
    required this.email,
    required this.about,
    required this.isDarkMode,
  });

  UserV3 copy({
    String? imagePath,
    String? name,
    String? email,
    String? about,
    bool? isDarkMode,
  }) =>
      UserV3(
        imagePath: imagePath ?? this.imagePath,
        name: name ?? this.name,
        email: email ?? this.email,
        about: about ?? this.about,
        isDarkMode: isDarkMode ?? this.isDarkMode,
      );

  static UserV3 fromJson(Map<String, dynamic> json) => UserV3(
        imagePath: json['imagePath'],
        name: json['name'],
        email: json['email'],
        about: json['about'],
        isDarkMode: json['isDarkMode'],
      );

  Map<String, dynamic> toJson() => {
        'imagePath': imagePath,
        'name': name,
        'email': email,
        'about': about,
        'isDarkMode': isDarkMode,
      };
}
