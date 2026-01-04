class ProfileResponse {
  ProfileResponse({
      this.success, 
      this.code, 
      this.message, 
      this.body,});

  ProfileResponse.fromJson(dynamic json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    body = json['body'] != null ? ProfileData.fromJson(json['body']) : null;
  }
  bool? success;
  int? code;
  String? message;
  ProfileData? body;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['code'] = code;
    map['message'] = message;
    if (body != null) {
      map['body'] = body?.toJson();
    }
    return map;
  }

}

class ProfileData {
  ProfileData({
      this.response, 
      this.packBuyList,});

  ProfileData.fromJson(dynamic json) {
    response = json['response'] != null ? Response.fromJson(json['response']) : null;
    if (json['packBuyList'] != null) {
      packBuyList = [];
      json['packBuyList'].forEach((v) {
        packBuyList?.add(PackBuyList.fromJson(v));
      });
    }
  }
  Response? response;
  List<PackBuyList>? packBuyList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (response != null) {
      map['response'] = response?.toJson();
    }
    if (packBuyList != null) {
      map['packBuyList'] = packBuyList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class PackBuyList {
  PackBuyList({
      this.id, 
      this.createdAt, 
      this.updatedAt, 
      this.status, 
      this.userId, 
      this.packType, 
      this.packUsed,});

  PackBuyList.fromJson(dynamic json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    status = json['status'];
    userId = json['userId'];
    packType = json['packType'];
    packUsed = json['packUsed'];
  }
  String? id;
  String? createdAt;
  String? updatedAt;
  int? status;
  String? userId;
  String? packType;
  int? packUsed;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['status'] = status;
    map['userId'] = userId;
    map['packType'] = packType;
    map['packUsed'] = packUsed;
    return map;
  }

}

class Response {
  Response({
      this.id, 
      this.createdAt, 
      this.updatedAt, 
      this.status, 
      this.role, 
      this.customerId, 
      this.myCredits, 
      this.hasLimited, 
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
      this.isOnline, 
      this.friendsCount, 
      this.isFollow,});

  Response.fromJson(dynamic json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    status = json['status'];
    role = json['role'];
    customerId = json['customerId'];
    myCredits = json['myCredits'];
    hasLimited = json['hasLimited'];
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
    friendsCount = json['friendsCount'];
    isFollow = json['isFollow'];
  }
  String? id;
  String? createdAt;
  String? updatedAt;
  int? status;
  int? role;
  String? customerId;
  int? myCredits;
  int? hasLimited;
  String? name;
  String? email;
  String? password;
  dynamic profilePicture;
  dynamic resetToken;
  dynamic resetTokenExpires;
  String? deviceToken;
  String? deviceType;
  dynamic bio;
  int? otpVerify;
  String? socketId;
  int? isOnline;
  int? friendsCount;
  int? isFollow;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['status'] = status;
    map['role'] = role;
    map['customerId'] = customerId;
    map['myCredits'] = myCredits;
    map['hasLimited'] = hasLimited;
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
    map['friendsCount'] = friendsCount;
    map['isFollow'] = isFollow;
    return map;
  }

}