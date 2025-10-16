class LoginResponse {
  LoginResponse({
      this.success, 
      this.code, 
      this.message, 
      this.body,});

  LoginResponse.fromJson(dynamic json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  bool? success;
  int? code;
  String? message;
  Body? body;

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

class Body {
  Body({
      this.id, 
      this.createdAt, 
      this.updatedAt, 
      this.status, 
      this.role, 
      this.firstName, 
      this.lastName, 
      this.socialType, 
      this.socialId, 
      this.email, 
      this.countryCode, 
      this.phoneNumber, 
      this.churchAccessCode, 
      this.password, 
      this.otpVerify, 
      this.gender, 
      this.maritalStatus, 
      this.location, 
      this.latitude, 
      this.longitude, 
      this.donateEdifyLivers, 
      this.profileVisibility,
      this.traitAndExperience,
      this.postEmpSeekingSection, 
      this.hartOfService, 
      this.profilePicture, 
      this.churchName, 
      this.churchWebsite, 
      this.churchCode, 
      this.numberOfMembers, 
      this.visionStatement, 
      this.valuesStatement, 
      this.businessName, 
      this.typeOfBusiness, 
      this.businessAddress, 
      this.businessUserAddress, 
      this.businessLogo, 
      this.nameNonProfit, 
      this.addressNonProfit, 
      this.webSiteNonProfile, 
      this.nonProfitServe, 
      this.notificationStatus,
      this.nonPorfitOrganization,
      this.chruchAttendAddress, 
      this.companyLogo, 
      this.resetToken, 
      this.resetTokenExpires, 
      this.deviceToken, 
      this.deviceType, 
      this.subscriptionEndDate,
      this.token,});

  Body.fromJson(dynamic json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    status = json['status'];
    role = json['role'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    socialType = json['socialType'];
    socialId = json['socialId'];
    email = json['email'];
    countryCode = json['countryCode'];
    phoneNumber = json['phoneNumber'];
    churchAccessCode = json['churchAccessCode'];
    password = json['password'];
    otpVerify = json['otpVerify'];
    gender = json['gender'];
    notificationStatus = json['notificationStatus'];
    maritalStatus = json['maritalStatus'];
    location = json['location'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    donateEdifyLivers = json['donateEdifyLivers'];
    traitAndExperience = json['traitAndExperience'];
    postEmpSeekingSection = json['postEmpSeekingSection'];
    hartOfService = json['hartOfService'];
    profilePicture = json['profilePicture'];
    churchName = json['churchName'];
    churchWebsite = json['churchWebsite'];
    churchCode = json['churchCode'];
    numberOfMembers = json['numberOfMembers'];
    visionStatement = json['visionStatement'];
    valuesStatement = json['valuesStatement'];
    businessName = json['businessName'];
    typeOfBusiness = json['typeOfBusiness'];
    businessAddress = json['businessAddress'];
    businessUserAddress = json['businessUserAddress'];
    businessLogo = json['businessLogo'];
    nameNonProfit = json['nameNonProfit'];
    addressNonProfit = json['addressNonProfit'];
    webSiteNonProfile = json['webSiteNonProfile'];
    nonProfitServe = json['nonProfitServe'];
    nonPorfitOrganization = json['nonPorfitOrganization'];
    chruchAttendAddress = json['chruchAttendAddress'];
    companyLogo = json['companyLogo'];
    resetToken = json['resetToken'];
    resetTokenExpires = json['resetTokenExpires'];
    deviceToken = json['deviceToken'];
    deviceType = json['deviceType'];
    profileVisibility = json['profileVisibility'];
    token = json['token'];
    subscriptionEndDate = json['subscriptionEndDate'];
  }
  String? id;
  String? createdAt;
  String? updatedAt;
  int? status;
  int? role;
  String? firstName;
  String? lastName;
  int? socialType;
  String? socialId;
  String? email;
  String? countryCode;
  String? phoneNumber;
  dynamic churchAccessCode;
  String? password;
  int? otpVerify;
  int? profileVisibility;
  String? gender;
  dynamic maritalStatus;
  String? location;
  String? latitude;
  String? longitude;
  dynamic donateEdifyLivers;
  String? traitAndExperience;
  String? postEmpSeekingSection;
  String? hartOfService;
  String? profilePicture;
  String? churchName;
  String? churchWebsite;
  String? churchCode;
  String? numberOfMembers;
  int? notificationStatus;
  String? visionStatement;
  dynamic valuesStatement;
  String? businessName;
  String? typeOfBusiness;
  String? businessAddress;
  String? businessUserAddress;
  String? businessLogo;
  String? nameNonProfit;
  String? addressNonProfit;
  String? webSiteNonProfile;
  String? nonProfitServe;
  String? nonPorfitOrganization;
  String? chruchAttendAddress;
  String? companyLogo;
  dynamic resetToken;
  dynamic resetTokenExpires;
  String? deviceToken;
  String? deviceType;
  String? token;
  String? subscriptionEndDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['status'] = status;
    map['role'] = role;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['socialType'] = socialType;
    map['socialId'] = socialId;
    map['email'] = email;
    map['countryCode'] = countryCode;
    map['phoneNumber'] = phoneNumber;
    map['churchAccessCode'] = churchAccessCode;
    map['password'] = password;
    map['otpVerify'] = otpVerify;
    map['gender'] = gender;
    map['maritalStatus'] = maritalStatus;
    map['location'] = location;
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    map['donateEdifyLivers'] = donateEdifyLivers;
    map['traitAndExperience'] = traitAndExperience;
    map['postEmpSeekingSection'] = postEmpSeekingSection;
    map['hartOfService'] = hartOfService;
    map['profilePicture'] = profilePicture;
    map['churchName'] = churchName;
    map['churchWebsite'] = churchWebsite;
    map['churchCode'] = churchCode;
    map['numberOfMembers'] = numberOfMembers;
    map['visionStatement'] = visionStatement;
    map['valuesStatement'] = valuesStatement;
    map['businessName'] = businessName;
    map['typeOfBusiness'] = typeOfBusiness;
    map['businessAddress'] = businessAddress;
    map['businessUserAddress'] = businessUserAddress;
    map['businessLogo'] = businessLogo;
    map['nameNonProfit'] = nameNonProfit;
    map['addressNonProfit'] = addressNonProfit;
    map['webSiteNonProfile'] = webSiteNonProfile;
    map['nonProfitServe'] = nonProfitServe;
    map['nonPorfitOrganization'] = nonPorfitOrganization;
    map['chruchAttendAddress'] = chruchAttendAddress;
    map['companyLogo'] = companyLogo;
    map['resetToken'] = resetToken;
    map['notificationStatus'] = notificationStatus;
    map['resetTokenExpires'] = resetTokenExpires;
    map['deviceToken'] = deviceToken;
    map['deviceType'] = deviceType;
    map['token'] = token;
    map['profileVisibility'] = profileVisibility;
    map['subscriptionEndDate'] = subscriptionEndDate;
    return map;
  }

}