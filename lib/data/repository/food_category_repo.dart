import 'package:get/get.dart';
import 'package:kobis_xtra/data/api/api_dart.dart';
import 'package:kobis_xtra/utils/app_constants.dart';

class FoodCategoryRepo extends GetxService{
  final ApiClient apiClient;
  FoodCategoryRepo({required this.apiClient});


  Future <Response> getFoodCategoryList() async {
    return await apiClient.getData(AppContants.FOOD_CATEGORY_URI);
  }

}