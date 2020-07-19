import 'dart:convert';

VerifyModel verifyModelFromJson(String str) => VerifyModel.fromJson(jsonDecode(str));

String verifyModelToJson(VerifyModel data) => json.encode(data.toJson());

class VerifyModel {
  VerifyModel({
    this.status,
    this.message,
    this.data,
  });

  bool status;
  String message;
  DataModel data;

  factory VerifyModel.fromJson(Map<String, dynamic> json) => VerifyModel(
    status: json["status"],
    message: json["message"],
    data: DataModel.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class DataModel {
  DataModel({
    this.vid,
    this.name,
    this.mobile,
    this.email,
    this.cid,
    this.cname,
    this.cavatar,
    this.isVerify=0,
    //this.createAt,
    //this.updateAt,
  });

  String vid;
  String name;
  String mobile;
  String email;
  String cid;
  String cname;
  String cavatar;
  int isVerify;
  //DateTime createAt;
  //DateTime updateAt;

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
    vid: json["vid"]??'',
    name: json["name"]??'',
    mobile: json["mobile"]??'',
    email: json["email"]??'',
    cid: json["cid"]??'',
    cname: json["cname"]??'',
    cavatar: json["cavatar"]??'',
    isVerify: json["is_verify"]??0,
//    createAt: DateTime.parse(json["create_at"]??DateTime.now()),
  //  updateAt: DateTime.parse(json["update_at"]??DateTime.now()),
  );

  Map<String, dynamic> toJson() => {
    "vid": vid,
    "name": name,
    "mobile": mobile,
    "email": email,
    "cid": cid,
    "cname": cname,
    "cavatar": cavatar,
    "is_verify": isVerify,
    //"create_at": createAt.toIso8601String(),
    //"update_at": updateAt.toIso8601String(),
  };
}
