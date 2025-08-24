class AuthLoginRequestModel {
  final String username;
  final String password;

  AuthLoginRequestModel({required this.username, required this.password});

  // Convert ke JSON untuk dikirim ke API
  Map<String, dynamic> toJson() {
    return {"username": username, "password": password};
  }

  // Kalau suatu saat butuh parsing dari JSON juga
  factory AuthLoginRequestModel.fromJson(Map<String, dynamic> json) {
    return AuthLoginRequestModel(
      username: json['username'],
      password: json['password'],
    );
  }
}

/* RESPONS API */
class AuthLoginResponseModel {
  final String? token;
  final String? error;

  AuthLoginResponseModel({this.token, this.error});

  factory AuthLoginResponseModel.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('data')) {
      return AuthLoginResponseModel(token: json['data']['token']);
    } else if (json.containsKey('errors')) {
      return AuthLoginResponseModel(error: json['errors']);
    }
    return AuthLoginResponseModel(error: "Unexpected response format");
  }

  Map<String, dynamic> toJson() {
    if (token != null) return {"token": token};
    return {"errors": error};
  }
}
