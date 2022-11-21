class GetCategories {
  String? status;
  String? message;
  List<Data>? data;

  GetCategories({this.status, this.message, this.data});

  GetCategories.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? catId;
  String? catName;
  String? catImg;
  String? status;
  String? createdAt;
  String? modifiedAt;

  Data(
      {this.catId,
        this.catName,
        this.catImg,
        this.status,
        this.createdAt,
        this.modifiedAt});

  Data.fromJson(Map<String, dynamic> json) {
    catId = json['catId'];
    catName = json['catName'];
    catImg = json['catImg'];
    status = json['status'];
    createdAt = json['createdAt'];
    modifiedAt = json['modifiedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['catId'] = this.catId;
    data['catName'] = this.catName;
    data['catImg'] = this.catImg;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['modifiedAt'] = this.modifiedAt;
    return data;
  }
}
