class Detectproductapiresp {
  String? sId;
  String? name;
  int? quantity;
  int? price;
  String? image;
  int? iV;

  // Detectproductapiresp(
  //     {this.sId, this.name, this.quantity, this.price, this.image, this.iV});

  Detectproductapiresp.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    quantity = json['quantity'];
    price = json['price'];
    image = json['image'];
    iV = json['__v'];
  }
  // Detectproductapiresp.fromJson(Map<String, dynamic> json) {
  //   status = Parsing.boolFrom(json['status']);
  //   statusCode = Parsing.stringFrom(json['status_code']);
  //   message = Parsing.stringFrom(json['message']);
  // }
}
