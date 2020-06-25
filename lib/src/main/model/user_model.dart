
import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.status,
    this.message,
    this.data,
  });

  bool status;
  String message;
  Data data;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.uid,
    this.name,
    this.email,
    this.mobile,
    this.gender,
    this.userAvatar,
    this.token,
    this.address,
    this.pincode,
    this.createAt,
  });

  String uid;
  String name;
  String email;
  String mobile;
  String gender;
  dynamic userAvatar;
  String token;
  dynamic address;
  dynamic pincode;
  DateTime createAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    uid: json["uid"],
    name: json["name"],
    email: json["email"],
    mobile: json["mobile"],
    gender: json["gender"],
    userAvatar: json["user_avatar"],
    token: json["token"],
    address: json["address"],
    pincode: json["pincode"],
    createAt: DateTime.parse(json["create_at"]),
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
    "create_at": createAt.toIso8601String(),
  };
}
