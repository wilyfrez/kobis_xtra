import 'package:get/get.dart';
import 'package:kobis_xtra/pages/food_pages/food_category.dart';
import 'package:kobis_xtra/pages/food_pages/food_category_detail.dart';
import 'package:kobis_xtra/pages/home_screen/main_food_page.dart';
import 'package:kobis_xtra/pages/food_pages/popular_food_detail.dart';
import 'package:kobis_xtra/pages/splash_screen.dart';


class AppRoutes {
  static const String initial = "/";
  static const String mainFood = '/main-food';
  static const String  popularFood = '/popular-food';
  static const String foodCategory = '/food-category';
  static const String foodCategoryDetail = '/foodCategory-detail';

  static String getInitial() => '$initial';
  static String getMainFood() => '$mainFood';
  static String getPopularFood(int pageId) => '$popularFood?pageId=$pageId';

  static String getFoodCategoryDetail(int listID) => '$foodCategoryDetail?listID=$listID';


  static List<GetPage> routes=[
    GetPage (name: "/", page:()=> SplashScreen()),
    GetPage (name: mainFood, page:()=> MainFoodPage()),

    GetPage (name: popularFood, page:() {
      var pageId = Get.parameters['pageId'];
      return PopularFoodDetail(pageId:int.parse(pageId!));
  },
      transition: Transition.fadeIn
    ),


    GetPage (name: foodCategoryDetail, page:() {
      var listID = Get.parameters['listID'];
      return FoodCategoryDetail(listID:int.parse(listID!),);
    },
        transition: Transition.fadeIn
    ),



  ];











  static const login = '/login';
  static const signup = '/signup';
  static const forgotPassword = '/forgotPassword';
  static const home = '/home';

}