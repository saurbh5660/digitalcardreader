import 'collection_response.dart';

class MarketplaceResponse {
  MarketplaceResponse({
      this.success, 
      this.code, 
      this.message, 
      this.body,});

  MarketplaceResponse.fromJson(dynamic json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    if (json['body'] != null) {
      body = [];
      json['body'].forEach((v) {
        body?.add(MarketList.fromJson(v));
      });
    }
  }
  bool? success;
  int? code;
  String? message;
  List<MarketList>? body;

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

class MarketList {
  MarketList({
      this.id, 
      this.createdAt, 
      this.updatedAt, 
      this.status, 
      this.userId, 
      this.cardId, 
      this.price, 
      this.additionalNotes, 
      this.userCard,
      this.user});

  MarketList.fromJson(dynamic json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    status = json['status'];
    userId = json['userId'];
    cardId = json['cardId'];
    price = json['price'];
    additionalNotes = json['additionalNotes'];
    userCard = json['userCard'] != null ? UserCard.fromJson(json['userCard']) : null;
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  String? id;
  String? createdAt;
  String? updatedAt;
  int? status;
  String? userId;
  String? cardId;
  String? price;
  String? additionalNotes;
  UserCard? userCard;
  User? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['status'] = status;
    map['userId'] = userId;
    map['cardId'] = cardId;
    map['price'] = price;
    map['additionalNotes'] = additionalNotes;
    if (userCard != null) {
      map['userCard'] = userCard?.toJson();
    }
    return map;
  }

}

class UserCard {
  UserCard({
      this.id, 
      this.createdAt, 
      this.updatedAt, 
      this.status, 
      this.userId, 
      this.collectionId, 
      this.cardName, 
      this.cardType, 
      this.additionalNotes, 
      this.imagePath, 
      this.backImagePath, 
      this.backCentering, 
      this.backEdges, 
      this.backSurface, 
      this.backCorners, 
      this.backOverall, 
      this.centering, 
      this.edges, 
      this.surface, 
      this.corners, 
      this.overall,});

  UserCard.fromJson(dynamic json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    status = json['status'];
    userId = json['userId'];
    collectionId = json['collectionId'];
    cardName = json['cardName'];
    cardType = json['cardType'];
    additionalNotes = json['additionalNotes'];
    imagePath = json['imagePath'];
    backImagePath = json['backImagePath'];
    backCentering = json['backCentering'];
    backEdges = json['backEdges'];
    backSurface = json['backSurface'];
    backCorners = json['backCorners'];
    backOverall = json['backOverall'];
    centering = json['centering'];
    edges = json['edges'];
    surface = json['surface'];
    corners = json['corners'];
    overall = json['overall'];
  }
  String? id;
  String? createdAt;
  String? updatedAt;
  int? status;
  String? userId;
  String? collectionId;
  String? cardName;
  int? cardType;
  String? additionalNotes;
  String? imagePath;
  String? backImagePath;
  num? backCentering;
  num? backEdges;
  num? backSurface;
  num? backCorners;
  num? backOverall;
  num? centering;
  num? edges;
  num? surface;
  num? corners;
  num? overall;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['status'] = status;
    map['userId'] = userId;
    map['collectionId'] = collectionId;
    map['cardName'] = cardName;
    map['cardType'] = cardType;
    map['additionalNotes'] = additionalNotes;
    map['imagePath'] = imagePath;
    map['backImagePath'] = backImagePath;
    map['backCentering'] = backCentering;
    map['backEdges'] = backEdges;
    map['backSurface'] = backSurface;
    map['backCorners'] = backCorners;
    map['backOverall'] = backOverall;
    map['centering'] = centering;
    map['edges'] = edges;
    map['surface'] = surface;
    map['corners'] = corners;
    map['overall'] = overall;
    return map;
  }

}