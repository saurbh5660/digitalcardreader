import 'collection_response.dart';

class CardListResponse {
  CardListResponse({
      this.success, 
      this.code, 
      this.message, 
      this.body,});

  CardListResponse.fromJson(dynamic json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    if (json['body'] != null) {
      body = [];
      json['body'].forEach((v) {
        body?.add(CardList.fromJson(v));
      });
    }
  }
  bool? success;
  int? code;
  String? message;
  List<CardList>? body;

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

class CardList {
  CardList({
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
      this.overall,
    this.user,});

  CardList.fromJson(dynamic json) {
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
    user = json['user'] != null ? User.fromJson(json['user']) : null;

  }
  String? id;
  String? createdAt;
  String? updatedAt;
  int? status;
  String? userId;
  dynamic collectionId;
  String? cardName;
  int? cardType;
  String? additionalNotes;
  String? imagePath;
  dynamic backImagePath;
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
  User? user;


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
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }

}