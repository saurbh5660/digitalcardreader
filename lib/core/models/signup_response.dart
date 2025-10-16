class SignupResponse {
  SignupResponse({
      this.success, 
      this.code, 
      this.message, 
      this.body,});

  SignupResponse.fromJson(dynamic json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }
  bool? success;
  num? code;
  String? message;
  Body? body;
SignupResponse copyWith({  bool? success,
  num? code,
  String? message,
  Body? body,
}) => SignupResponse(  success: success ?? this.success,
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

class Body {
  Body({
      this.createdAt, 
      this.updatedAt, 
      this.id, 
      this.status, 
      this.name, 
      this.email, 
      this.password, 
      this.token,});

  Body.fromJson(dynamic json) {
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    id = json['id'];
    status = json['status'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    token = json['token'];
  }
  String? createdAt;
  String? updatedAt;
  String? id;
  num? status;
  String? name;
  String? email;
  String? password;
  String? token;
Body copyWith({  String? createdAt,
  String? updatedAt,
  String? id,
  num? status,
  String? name,
  String? email,
  String? password,
  String? token,
}) => Body(  createdAt: createdAt ?? this.createdAt,
  updatedAt: updatedAt ?? this.updatedAt,
  id: id ?? this.id,
  status: status ?? this.status,
  name: name ?? this.name,
  email: email ?? this.email,
  password: password ?? this.password,
  token: token ?? this.token,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['id'] = id;
    map['status'] = status;
    map['name'] = name;
    map['email'] = email;
    map['password'] = password;
    map['token'] = token;
    return map;
  }

}