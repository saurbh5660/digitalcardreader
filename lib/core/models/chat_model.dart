class ChatModel {
  int? id;
  String? sender;
  String? image;
  String? message;
  String? time;

  ChatModel({this.id, this.sender, this.image, this.message, this.time});

  ChatModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sender = json['sender'];
    image = json['image'];
    message = json['message'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sender'] = sender;
    data['image'] = image;
    data['message'] = message;
    data['time'] = time;
    return data;
  }
}
