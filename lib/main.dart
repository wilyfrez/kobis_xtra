import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:kobis_xtra/controllers/popular_product_controllers.dart';
import 'package:kobis_xtra/controllers/product_category_controller.dart';

import 'package:get/get.dart';
import 'package:kobis_xtra/helper/dependencies.dart' as dep;


import 'controllers/food_category_controller.dart';
import 'routes/approutes.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  await Firebase.initializeApp();
  runApp(KobisLoginUi());
}


class KobisLoginUi extends StatelessWidget {

  //Theme color
  final Color _primaryColor= HexColor('#76A30E');
  final Color _accentColor= HexColor('#C6F35E');



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    Get.find<PopularProductController>().getPopularProductList();
    //Get.find<FoodCategoryController>().getFoodCategoryList();

    Get.find<ProductCategoryController>().getProductCategoryList();


    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Kobis Xtra',
        theme: ThemeData(
          primaryColor: _primaryColor,
          scaffoldBackgroundColor: Colors.grey.shade100, colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey).copyWith(secondary: _accentColor),
        ),
        initialRoute: AppRoutes.getInitial(),
        getPages: AppRoutes.routes,
      );
  }
}
