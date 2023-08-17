class Doctor {
  final int id;
  final String name;
  final String phone;
  final String email;

  Doctor({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['id'] ?? 0,
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
    );
  }
}