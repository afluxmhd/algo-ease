class AppUser {
  String email;
  String password;
  AppUser({
    required this.email,
    required this.password,
  });

  AppUser copyWith({
    String? email,
    String? password,
  }) {
    return AppUser(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  @override
  String toString() => 'Auth(email: $email, password: $password)';

  @override
  bool operator ==(covariant AppUser other) {
    if (identical(this, other)) return true;

    return other.email == email && other.password == password;
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode;
}
