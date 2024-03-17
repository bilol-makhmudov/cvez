class UserModel {
  final String? userId;
  final String? displayName;
  final String? email;
  final String? password;

  UserModel({
    this.userId,
    this.displayName,
    this.email,
    this.password
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['userId'],
      displayName: json['displayName'],
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'displayName': displayName,
      'email': email,
      'password': password,
    };
  }
}
