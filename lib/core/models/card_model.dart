class CardModel {
  int? id;
  String? title;
  int? price;
  double? rating;
  String? image;
  String? owner;
  String? ownerImage;

  CardModel({
    this.id,
    this.title,
    this.price,
    this.rating,
    this.image,
    this.owner,
    this.ownerImage,
  });

  CardModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    rating = json['rating'];
    image = json['image'];
    owner = json['owner'];
    ownerImage = json['ownerImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['rating'] = rating;
    data['image'] = image;
    data['owner'] = owner;
    data['ownerImage'] = ownerImage;
    return data;
  }
}
