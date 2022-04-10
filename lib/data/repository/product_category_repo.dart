import 'package:get/get.dart';
import 'package:kobis_xtra/data/api/api_dart.dart';
import 'package:kobis_xtra/utils/app_constants.dart';


class ProductCategoryRepo extends GetxService{
  final ApiClient apiClient;



  ProductCategoryRepo({required this.apiClient,});


  Future <Response> getProductCategoryList() async {

    return await apiClient.getData(AppContants.PRODUCT_CATEGORY_URI);
}

}


