class RegisterRequestModel {
  String? userName;
  String? password;
  String? email;

  RegisterRequestModel({this.userName, this.password, this.email});

  RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    password = json['password'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = this.userName;
    data['password'] = this.password;
    data['email'] = this.email;
    return data;
  }
}