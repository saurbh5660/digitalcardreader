class InventoryResponse {
  InventoryResponse({
      this.success, 
      this.code, 
      this.message, 
      this.body,});

  InventoryResponse.fromJson(dynamic json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    if (json['body'] != null) {
      body = [];
      json['body'].forEach((v) {
        body?.add(InventoryBody.fromJson(v));
      });
    }
  }
  bool? success;
  int? code;
  String? message;
  List<InventoryBody>? body;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['code'] = code;
    map['message'] = message;
    if (body != null) {
      map['body'] = body?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class InventoryBody {
  InventoryBody({
      this.id, 
      this.createdAt, 
      this.updatedAt, 
      this.status, 
      this.userId, 
      this.name,});

  InventoryBody.fromJson(dynamic json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    status = json['status'];
    userId = json['userId'];
    name = json['name'];
  }
  String? id;
  String? createdAt;
  String? updatedAt;
  int? status;
  String? userId;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['status'] = status;
    map['userId'] = userId;
    map['name'] = name;
    return map;
  }

}