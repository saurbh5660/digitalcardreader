class PaymentCardModel {
  int? number;
  String? expiry;
  int? cvv;
  String? type;
  String? card;
  String? name;
  String? bank;

  PaymentCardModel({
    this.number,
    this.expiry,
    this.cvv,
    this.type,
    this.card,
    this.name,
    this.bank,
  });

  PaymentCardModel.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    expiry = json['expiry'];
    cvv = json['cvv'];
    type = json['type'];
    card = json['card'];
    name = json['name'];
    bank = json['bank'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['number'] = number;
    data['expiry'] = expiry;
    data['cvv'] = cvv;
    data['type'] = type;
    data['card'] = card;
    data['name'] = name;
    data['bank'] = bank;
    return data;
  }
}
