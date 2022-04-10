class CartModel {
  String? id;
  String? title;
  String? price;
  String? imageURL;
  int? quantity;
  bool? isExist;
  String? time;


  CartModel({
    this.id,
    this.title,
    this.price,
    this.imageURL,
    this.quantity,
    this.isExist,
    this.time,
   });

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    imageURL = json['imageURL'];
    price = json['price'];
    quantity = json['quantity'];
    isExist = json['isExist'];
    time = json['time'];

  }
}