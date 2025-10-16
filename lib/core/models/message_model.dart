class MessageModel {
  final String? id;
  final String? message;
  final String? senderImage;
  final String? senderId;

  MessageModel({this.id, this.message, this.senderImage, this.senderId});

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json['id'],
      message: json['message'],
      senderImage: json['senderImage'],
      senderId: json['senderId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'message': message,
      'senderImage': senderImage,
      'senderId': senderId,
    };
  }
}
