
import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(jsonDecode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.status,
    this.message,
    this.data,
  });

  bool status;
  String message;
  LoginData data;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    status: json["status"],
    message: json["message"],
    data: LoginData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class LoginData {
  LoginData({
    this.uid,
    this.name,
    this.email,
    this.mobile,
    this.gender,
    this.userAvatar,
    this.token,
    this.address,
    this.pincode,
  });

  String uid;
  String name;
  String email;
  String mobile;
  String gender;
  String userAvatar;
  String token;
  String address;
  String pincode;

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
    uid: json["uid"],
    name: json["name"],
    email: json["email"],
    mobile: json["mobile"],
    gender: json["gender"],
    userAvatar: json["user_avatar"],
    token: json["token"],
    address: json["address"],
    pincode: json["pincode"],
  );

  Map<String, dynamic> toJson() => {
    "uid": uid,
    "name": name,
    "email": email,
    "mobile": mobile,
    "gender": gender,
    "user_avatar": userAvatar,
    "token": token,
    "address": address,
    "pincode": pincode,
  };
}
