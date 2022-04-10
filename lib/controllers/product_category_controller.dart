import 'package:get/get.dart';
import 'package:kobis_xtra/models/product_category_model.dart';

import '../data/repository/product_category_repo.dart';

class ProductCategoryController extends GetxController{

  final ProductCategoryRepo  productCategoryRepo;

  ProductCategoryController({required this.productCategoryRepo});

  List<dynamic> _productCategoryList =  [];
  List<dynamic> get productCategoryList => _productCategoryList;



  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future <void> getProductCategoryList() async{

    Response response = await productCategoryRepo.getProductCategoryList();
    if (response.statusCode == 200){
      _productCategoryList = [];
      _productCategoryList.addAll(productsCategory.fromJson(response.body).products);
     // print (getProductCategoryList().toString());
     // print ('got product list');
      _isLoaded = true;
      update();
    }else {

    }
  }
}