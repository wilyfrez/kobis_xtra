class productsCategory {
 late List<productsCategoryModel> products;

  productsCategory({required this.products});

  productsCategory.fromJson(Map<String, dynamic> json) {
    if (json['Products'] != null) {
      products = <productsCategoryModel>[];
      json['Products'].forEach((v) {
        products.add(productsCategoryModel.fromJson(v));
      });
    }
  }

}

class productsCategoryModel {
  String? id;
  String? productSKU;
  String? title;
  String? category;
  String? description;
  String? imageURL;
  String? price;
  String? listPrice;

  productsCategoryModel(
      {this.id,
        this.productSKU,
        this.title,
        this.category,
        this.description,
        this.imageURL,
        this.price,
        this.listPrice});

  productsCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productSKU = json['productSKU'];
    title = json['title'];
    category = json['category'];
    description = json['description'];
    imageURL = json['imageURL'];
    price = json['price'];
    listPrice = json['listPrice'];
  }


}