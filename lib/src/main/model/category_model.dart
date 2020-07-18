import 'dart:convert';

CategoryModel categoryModelFromJson(String str) => CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  CategoryModel({
    this.status,
    this.message,
    this.data,
  });

  bool status;
  String message;
  List<DataList> data;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    status: json["status"],
    message: json["message"],
    data: List<DataList>.from(json["data"].map((x) => DataList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class DataList {
  DataList({
    this.categoryId,
    this.categoryName,
    this.categoryAvatar,
  });

  String categoryId;
  String categoryName;
  String categoryAvatar;

  factory DataList.fromJson(Map<String, dynamic> json) => DataList(
    categoryId: json["cid"],
    categoryName: json["cname"],
    categoryAvatar: json["avatar"]
  );

  Map<String, dynamic> toJson() => {
    "cid": categoryId,
    "cname": categoryName,
    "avatar": categoryAvatar
  };
}
