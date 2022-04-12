import 'package:get/get.dart';
import 'package:kobis_xtra/models/product_category_model.dart';

import '../data/repository/product_category_repo.dart';

class ProductCategoryController extends GetxController{

  final ProductCategoryRepo  productCategoryRepo;

  ProductCategoryController({required this.productCategoryRepo});

  List<dynamic> _productCategoryList =  [];
  List<dynamic> get productCategoryList => _productCategoryList;

  List<dynamic> _CategoryList =  [];
  List<dynamic> get CategoryList => _CategoryList;


  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _listID = 0;
  int get listID => _listID;


  Future <void> getProductCategoryList() async{

    Response response = await productCategoryRepo.getProductCategoryList();
    if (response.statusCode == 200){
      _productCategoryList = [];
      _productCategoryList.addAll(productsCategory.fromJson(response.body).products);
      _isLoaded = true;
      update();
    }else {

    }
  }
  Map <String, productsCategoryModel>  _items={};
  Map <String, productsCategoryModel> get items => _items;

  void category (productsCategoryModel productsCategory,){
      if (_items.containsValue(listID)){
      _items.update(productsCategory.id!, (value) {
     return productsCategoryModel(
             id: productsCategory.id,
             title: productsCategory.title,
             imageURL: productsCategory.imageURL,
             category: productsCategory.category,
             price: productsCategory.price
);
      });
      }

  }
  Future <void> getCategoryList() async{

    Response response = await productCategoryRepo.getProductCategoryList();
    if (response.statusCode == 200){
      _CategoryList = [];
      _CategoryList.add(items);
      _isLoaded = true;
      update();
    }else {

    }

}