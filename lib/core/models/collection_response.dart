class CollectionResponse {
  CollectionResponse({
      this.success, 
      this.code, 
      this.message, 
      this.body,});

  CollectionResponse.fromJson(dynamic json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    if (json['body'] != null) {
      body = [];
      json['body'].forEach((v) {
        body?.add(CollectionBody.fromJson(v));
      });
    }
  }
  bool? success;
  int? code;
  String? message;
  List<CollectionBody>? body;

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

class CollectionBody {
  CollectionBody({
      this.id, 
      this.createdAt, 
      this.updatedAt, 
      this.status, 
      this.userId, 
      this.cardName, 
      this.imagePath, 
      this.user,});

  CollectionBody.fromJson(dynamic json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    status = json['status'];
    userId = json['userId'];
    cardName = json['cardName'];
    imagePath = json['imagePath'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  String? id;
  String? createdAt;
  String? updatedAt;
  int? status;
  String? userId;
  String? cardName;
  String? imagePath;
  User? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['status'] = status;
    map['userId'] = userId;
    map['cardName'] = cardName;
    map['imagePath'] = imagePath;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }

}

class User {
  User({
      this.id, 
      this.createdAt, 
      this.updatedAt, 
      this.status, 
      this.role, 
      this.customerId, 
      this.name, 
      this.email, 
      this.password, 
      this.profilePicture, 
      this.resetToken, 
      this.resetTokenExpires, 
      this.deviceToken, 
      this.deviceType, 
      this.bio, 
      this.otpVerify, 
      this.socketId, 
      this.isOnline,});

  User.fromJson(dynamic json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    status = json['status'];
    role = json['role'];
    customerId = json['customerId'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    profilePicture = json['profilePicture'];
    resetToken = json['resetToken'];
    resetTokenExpires = json['resetTokenExpires'];
    deviceToken = json['deviceToken'];
    deviceType = json['deviceType'];
    bio = json['bio'];
    otpVerify = json['otpVerify'];
    socketId = json['socketId'];
    isOnline = json['isOnline'];
  }
  String? id;
  String? createdAt;
  String? updatedAt;
  int? status;
  int? role;
  String? customerId;
  String? name;
  String? email;
  String? password;
  dynamic profilePicture;
  dynamic resetToken;
  dynamic resetTokenExpires;
  String? deviceToken;
  String? deviceType;
  dynamic bio;
  dynamic otpVerify;
  String? socketId;
  int? isOnline;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['status'] = status;
    map['role'] = role;
    map['customerId'] = customerId;
    map['name'] = name;
    map['email'] = email;
    map['password'] = password;
    map['profilePicture'] = profilePicture;
    map['resetToken'] = resetToken;
    map['resetTokenExpires'] = resetTokenExpires;
    map['deviceToken'] = deviceToken;
    map['deviceType'] = deviceType;
    map['bio'] = bio;
    map['otpVerify'] = otpVerify;
    map['socketId'] = socketId;
    map['isOnline'] = isOnline;
    return map;
  }

}