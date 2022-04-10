import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kobis_xtra/controllers/cart_controller.dart';
import 'package:kobis_xtra/data/repository/popular_product_repo.dart';
import 'package:kobis_xtra/models/popular_products_model.dart';

import '../common/colors.dart';
import '../models/product_category_model.dart';

class PopularProductController extends GetxController{
  final PopularProductRepo  popularProductRepo;

  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList =  [];
  List<dynamic> get popularProductList => _popularProductList;
  late CartController _cart;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0;
  int get quantity => _quantity;

  int _inCartItems = 0;
  int get inCartItems => _inCartItems + _quantity;

  Future <void> getPopularProductList() async{
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200){
      _popularProductList = [];
     _popularProductList.addAll(popularProduct.fromJson(response.body).adverts);
     _isLoaded = true;
      update();
    }else {

    }
  }

  void setQuantity (bool isIncrement){
    if (isIncrement){
      _quantity = checkQuantity( _quantity + 1);
      print(_quantity.toString());
    }else {
      _quantity = checkQuantity (_quantity - 1);
      print(_quantity.toString());
    }
    update ();
  }
  int checkQuantity(int quantity){
    if (quantity <=1){
      Get.snackbar("item count", "You can't reduce more!",
        backgroundColor: Appcolors.mainColor,
        colorText: Colors.white,
      );
      if(_inCartItems>0){
        _quantity = - _inCartItems;
        return _quantity;
      }
      return 1;
    }else if (quantity >20){
      Get.snackbar("item count", "You can't increase more!",
        backgroundColor: Appcolors.mainColor,
        colorText: Colors.white,
      );
      return 20;
    }else{
      return quantity;
    }
  }

  void initProduct (productsCategoryModel productsCategory, CartController cart){
    _quantity = 1;
    _inCartItems =0;
    _cart = cart;
    var exist = false;
    exist = _cart.existInCart(productsCategory);
    if (exist){
      _inCartItems = _cart.getQuantity(productsCategory);
    }
  }

  void addItem (productsCategoryModel productsCategory,){

      _cart.addItem(productsCategory, _quantity);

      _quantity = 0;
      _inCartItems = _cart.getQuantity(productsCategory);
      print (_inCartItems.toString());

      _cart.items.forEach((key, value) {
       print('the id is '+ value.id.toString()+ 'the quantity is' + value.quantity.toString());
      });
      update();
  }

  int get totalItems{
    return _cart.totalItems;
  }
}