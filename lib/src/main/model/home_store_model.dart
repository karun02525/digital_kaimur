import 'dart:convert';

HomeStoreModel storeModelFromJson(String str) => HomeStoreModel.fromJson(json.decode(str));

String storeModelToJson(HomeStoreModel data) => json.encode(data.toJson());

class HomeStoreModel {
  HomeStoreModel({
    this.status,
    this.message,
    this.data,
  });

  bool status;
  String message;
  List<StoreModel> data;

  factory HomeStoreModel.fromJson(Map<String, dynamic> json) => HomeStoreModel(
    status: json["status"],
    message: json["message"],
    data: List<StoreModel>.from(json["data"].map((x) => StoreModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class StoreModel {
  StoreModel({
    this.uid,
    this.name,
    this.email,
    this.mobile,
    this.gender,
    this.userAvatar,
    this.sid,
    this.cid,
    this.cname,
    this.vid,
    this.sname,
    this.semail,
    this.smobile,
    this.color,
    this.latitude,
    this.longitude,
    this.address,
    this.nearby,
    this.pinCode,
    this.ownerName,
    this.ownerMobile,
    this.ownerEmail,
    this.imgarray,
  });

  String uid;
  String name;
  String email;
  String mobile;
  String gender;
  String userAvatar;
  String sid;
  String cid;
  String cname;
  String vid;
  String sname;
  String semail;
  String smobile;
  String color;
  double latitude;
  double longitude;
  String address;
  String nearby;
  String pinCode;
  String ownerName;
  String ownerMobile;
  String ownerEmail;
  List<String> imgarray;

  factory StoreModel.fromJson(Map<String, dynamic> json) => StoreModel(
    uid: json["uid"],
    name: json["name"],
    email: json["email"],
    mobile: json["mobile"],
    gender: json["gender"],
    userAvatar: json["user_avatar"],
    sid: json["sid"],
    cid: json["cid"],
    cname: json["cname"],
    vid: json["vid"],
    sname: json["sname"],
    semail: json["semail"],
    smobile: json["smobile"],
    color: json["color"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    address: json["address"],
    nearby: json["nearby"],
    pinCode: json["pin_code"],
    ownerName: json["owner_name"],
    ownerMobile: json["owner_mobile"],
    ownerEmail: json["owner_email"],
    imgarray: List<String>.from(json["imgarray"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "uid": uid,
    "name": name,
    "email": email,
    "mobile": mobile,
    "gender": gender,
    "user_avatar": userAvatar,
    "sid": sid,
    "cid": cid,
    "cname": cname,
    "vid": vid,
    "sname": sname,
    "semail": semail,
    "smobile": smobile,
    "color": color,
    "latitude": latitude,
    "longitude": longitude,
    "address": address,
    "nearby": nearby,
    "pin_code": pinCode,
    "owner_name": ownerName,
    "owner_mobile": ownerMobile,
    "owner_email": ownerEmail,
    "imgarray": List<dynamic>.from(imgarray.map((x) => x)),
  };
}
