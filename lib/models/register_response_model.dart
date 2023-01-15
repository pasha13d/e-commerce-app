
import 'dart:convert';

RegisterResponseModel registerResponseModel(String str)=>
    RegisterResponseModel.fromJson(json.decode(str));

class RegisterResponseModel {
  String? message;
  Data? data;

  RegisterResponseModel({this.message, this.data});

  RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? userName;
  String? email;
  String? date;
  String? id;

  Data({this.userName, this.email, this.date, this.id});

  Data.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    email = json['email'];
    date = json['date'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = this.userName;
    data['email'] = this.email;
    data['date'] = this.date;
    data['id'] = this.id;
    return data;
  }
}