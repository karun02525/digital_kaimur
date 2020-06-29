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
    this.categoryPostion,
    this.createAt,
  });

  String categoryId;
  String categoryName;
  String categoryAvatar;
  int categoryPostion;
  DateTime createAt;

  factory DataList.fromJson(Map<String, dynamic> json) => DataList(
    categoryId: json["category_id"],
    categoryName: json["category_name"],
    categoryAvatar: json["category_avatar"],
    categoryPostion: json["category_postion"],
    createAt: DateTime.parse(json["create_at"]),
  );

  Map<String, dynamic> toJson() => {
    "category_id": categoryId,
    "category_name": categoryName,
    "category_avatar": categoryAvatar,
    "category_postion": categoryPostion,
    "create_at": createAt.toIso8601String(),
  };
}
