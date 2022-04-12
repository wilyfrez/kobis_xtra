class foodCategory {
 late List<foodCategoryModel> categories;

  foodCategory({required this.categories});

  foodCategory.fromJson(Map<String, dynamic> json) {
    if (json['Categories'] != null) {
      categories = <foodCategoryModel>[];
      json['Categories'].forEach((v) {
        categories.add(new foodCategoryModel.fromJson(v));
      });
    }
  }

}

class foodCategoryModel {
  String? categoryID;
  String? categoryName;
  String? categoryScript;
  String? categoryImageURL;

  foodCategoryModel(
      {this.categoryID,
        this.categoryName,
        this.categoryScript,
        this.categoryImageURL});

  foodCategoryModel.fromJson(Map<String, dynamic> json) {
    categoryID = json['categoryID'];
    categoryName = json['categoryName'];
    categoryScript = json['categoryScript'];
    categoryImageURL = json['categoryImageURL'];
  }


}

























// class Category{
// final String categoryName;
// final String imagePath;
//
//
// Category({required this.categoryName, required this.imagePath, });
// }

// final categories = [
//   Category(
//       imagePath: "assets/images/burger.png",
//       categoryName: "Burger"
//   ),

  // Category(
  //
  //     imagePath: "assets/images/pizza.png",
  //     categoryName: "Pizza"
  // ),

  // Category(
  //
  //     imagePath: "assets/images/coffee-cup.png",
  //     categoryName: "Coffe Cup"
  // ),

  // Category(
  //
  //     imagePath: "assets/images/beer.png",
  //     categoryName: "Beer"
  // ),

  // Category(
  //
  //     imagePath: "assets/images/cheeseburger.png",
  //     categoryName: "Cheese Burger"
  // ),

  // Category(
  //
  //     imagePath: "assets/images/burger.png",
  //     categoryName: "Burger"
  // ),

  // Category(
  //
  //     imagePath: "assets/images/pizza.png",
  //     categoryName: "Pizza"
  // ),

  // Category(
  //
  //     imagePath: "assets/images/coffee-cup.png",
  //     categoryName: "Coffe Cup"
  // ),

  // Category(
  //
  //     imagePath: "assets/images/beer.png",
  //     categoryName: "Beer"
  // ),

  // Category(
  //
  //     imagePath: "assets/images/cheeseburger.png",
  //     categoryName: "Cheese Burger"
  // ),

  // Category(
  //
  //     imagePath: "assets/images/beer.png",
  //     categoryName: "Beer"
  // ),

  // Category(
  //
  //     imagePath: "assets/images/cheeseburger.png",
  //     categoryName: "Cheese Burger"
  // ),
// ];