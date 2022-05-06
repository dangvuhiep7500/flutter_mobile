class Login {
  late String email;
  late String password;
  Login(
    this.email,
    this.password,
  );
  Login.fromJson(Map<String, dynamic> json) {
    email:
    json["email"];
    password:
    json["password"];
  }
}
