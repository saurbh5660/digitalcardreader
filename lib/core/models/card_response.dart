class CardResponse {
  CardResponse({
      this.success, 
      this.code, 
      this.message, 
      this.body,});

  CardResponse.fromJson(dynamic json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    body = json['body'] != null ? Card.fromJson(json['body']) : null;
  }
  bool? success;
  num? code;
  String? message;
  Card? body;
CardResponse copyWith({  bool? success,
  num? code,
  String? message,
  Card? body,
}) => CardResponse(  success: success ?? this.success,
  code: code ?? this.code,
  message: message ?? this.message,
  body: body ?? this.body,
);
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

class Card {
  Card({
      this.grade, 
      this.scores, 
      this.overall, 
      this.rawLabels, 
      this.savedPath,});

  Card.fromJson(dynamic json) {
    grade = json['grade'];
    scores = json['scores'] != null ? Scores.fromJson(json['scores']) : null;
    overall = json['overall'];
    if (json['rawLabels'] != null) {
      rawLabels = [];
      json['rawLabels'].forEach((v) {
        rawLabels?.add(RawLabels.fromJson(v));
      });
    }
    savedPath = json['savedPath'];
  }
  String? grade;
  Scores? scores;
  num? overall;
  List<RawLabels>? rawLabels;
  String? savedPath;
  Card copyWith({  String? grade,
  Scores? scores,
  num? overall,
  List<RawLabels>? rawLabels,
  String? savedPath,
}) => Card(  grade: grade ?? this.grade,
  scores: scores ?? this.scores,
  overall: overall ?? this.overall,
  rawLabels: rawLabels ?? this.rawLabels,
  savedPath: savedPath ?? this.savedPath,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['grade'] = grade;
    if (scores != null) {
      map['scores'] = scores?.toJson();
    }
    map['overall'] = overall;
    if (rawLabels != null) {
      map['rawLabels'] = rawLabels?.map((v) => v.toJson()).toList();
    }
    map['savedPath'] = savedPath;
    return map;
  }

}

class RawLabels {
  RawLabels({
      this.confidence, 
      this.name,});

  RawLabels.fromJson(dynamic json) {
    confidence = json['Confidence'];
    name = json['Name'];
  }
  num? confidence;
  String? name;
RawLabels copyWith({  num? confidence,
  String? name,
}) => RawLabels(  confidence: confidence ?? this.confidence,
  name: name ?? this.name,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Confidence'] = confidence;
    map['Name'] = name;
    return map;
  }

}

class Scores {
  Scores({
      this.centering, 
      this.edges, 
      this.surface, 
      this.corners,
      this.overall,
  });

  Scores.fromJson(dynamic json) {
    centering = json['centering'];
    edges = json['edges'];
    surface = json['surface'];
    corners = json['corners'];
    overall = json['overall'];
  }
  num? centering;
  num? edges;
  num? surface;
  num? corners;
  num? overall;
Scores copyWith({  num? centering,
  num? edges,
  num? surface,
  num? corners,
  num? overall,
}) => Scores(  centering: centering ?? this.centering,
  edges: edges ?? this.edges,
  surface: surface ?? this.surface,
  corners: corners ?? this.corners,
  overall: overall ?? this.overall,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['centering'] = centering;
    map['edges'] = edges;
    map['surface'] = surface;
    map['corners'] = corners;
    map['overall'] = overall;
    return map;
  }

}