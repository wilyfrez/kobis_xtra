import 'package:get/get.dart';
import 'package:kobis_xtra/controllers/popular_product_controllers.dart';
import 'package:kobis_xtra/data/api/api_dart.dart';
import 'package:kobis_xtra/utils/app_constants.dart';


import '../controllers/cart_controller.dart';
import '../controllers/food_category_controller.dart';
import '../controllers/product_category_controller.dart';
import '../data/repository/cart_repo.dart';
import '../data/repository/food_category_repo.dart';
import '../data/repository/popular_product_repo.dart';
import '../data/repository/product_category_repo.dart';

Future <void> init()async {
   //apiclient 
  Get.lazyPut(() => ApiClient(appBaseUrl: AppContants.BASE_URL));
  
  //repos
  Get.lazyPut(() => PopularProductRepo(apiClient:Get.find()));
  //Get.lazyPut(() => FoodCategoryRepo(apiClient:Get.find()));
  Get.lazyPut(() => ProductCategoryRepo(apiClient:Get.find(),));
  Get.lazyPut(() => CartRepo());

  //Controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo:Get.find()));
  //Get.lazyPut(() => FoodCategoryController(foodCategoryRepo:Get.find()));
  Get.lazyPut(() => ProductCategoryController(productCategoryRepo:Get.find()));
  Get.lazyPut(() => CartController(cartRepo:Get.find()));
}