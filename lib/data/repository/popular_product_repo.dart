import 'package:get/get.dart';
import 'package:kobis_xtra/data/api/api_dart.dart';
import 'package:kobis_xtra/utils/app_constants.dart';

class PopularProductRepo extends GetxService{
  final ApiClient apiClient;
  PopularProductRepo({required this.apiClient});


  Future <Response> getPopularProductList() async {
     return await apiClient.getData(AppContants.POPULAR_PRODUCT_URI);
  }

}