class User {
  final String id;
  final String token;
  final String fullname;
  final String document;
  final String phone;

  User({
    required this.id,
    required this.token,
    required this.fullname,
    required this.document,
    required this.phone,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String,
      token: map['token'] as String,
      fullname: map['fullname'] as String,
      document: map['document'] as String,
      phone: map['phone'] as String,
    );
  }
}
