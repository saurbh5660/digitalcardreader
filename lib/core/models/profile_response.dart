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
      this.friendsCount,
      this.packType,
      this.isFollow,
      this.hasLimited,
      this.packUsed,
      this.myCredits,
      this.otpVerify,
      this.socketId, 
      this.isOnline,});

  ProfileData.fromJson(dynamic json) {
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
    myCredits = json['myCredits'];
    packType = json['packType'];
    hasLimited = json['hasLimited'];
    packUsed = json['packUsed'];
    friendsCount = json['friendsCount'];
    socketId = json['socketId'];
    isFollow = json['isFollow'];
    isOnline = json['isOnline'];
  }
  String? id;
  String? createdAt;
  String? updatedAt;
  int? status;
  int? role;
  int? isFollow;
  String? customerId;
  String? name;
  int? myCredits;
  int? hasLimited;
  int? packUsed;
  int? friendsCount;
  String? packType;
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
    map['myCredits'] = myCredits;
    map['hasLimited'] = hasLimited;
    map['packUsed'] = packUsed;
    map['packType'] = packType;
    map['otpVerify'] = otpVerify;
    map['friendsCount'] = friendsCount;
    map['socketId'] = socketId;
    map['isFollow'] = isFollow;
    map['isOnline'] = isOnline;
    return map;
  }

}