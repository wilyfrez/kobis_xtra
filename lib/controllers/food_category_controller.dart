import 'package:get/get.dart';
import 'package:kobis_xtra/models/food_category_model.dart';

import '../data/repository/food_category_repo.dart';

class FoodCategoryController extends GetxController{
  final FoodCategoryRepo  foodCategoryRepo;

  FoodCategoryController({required this.foodCategoryRepo});

  List<dynamic> _foodCategoryList =  [];
  List<dynamic> get foodCategoryList => _foodCategoryList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future <void> getFoodCategoryList() async{
    Response response = await foodCategoryRepo.getFoodCategoryList();
    if (response.statusCode == 200){
      _foodCategoryList = [];

      _isLoaded = true;
      update();
    }else {

    }
  }
}