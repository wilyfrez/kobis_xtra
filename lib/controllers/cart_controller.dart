import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/colors.dart';
import '../data/repository/cart_repo.dart';
import '../models/cart_model.dart';
import '../models/product_category_model.dart';


class CartController extends GetxController{
 final CartRepo cartRepo;

 CartController({required this.cartRepo});

 Map <String, CartModel>  _items={};

 Map <String, CartModel> get items => _items;

 void addItem (productsCategoryModel productsCategory, int quantity){

   var totalQuantity=0;

   if (_items.containsKey(productsCategory.id)){
        _items.update(productsCategory.id!, (value) {

          totalQuantity= value.quantity!+ quantity;

          return CartModel(
            id: productsCategory.id,
            title: productsCategory.title,
            imageURL: productsCategory.imageURL,
            quantity: quantity,
            isExist: true,
            time: DateTime.now().toString(),
          );
        });

        if (totalQuantity<=0){
          _items.remove(productsCategory.id);
        }

   }else{
    if(quantity>0){
      _items.putIfAbsent( productsCategory.id!, () {
        return CartModel(
          id: productsCategory.id,
          title: productsCategory.title,
          imageURL: productsCategory.imageURL,
          quantity: quantity,
          isExist: true,
          time: DateTime.now().toString(),
        );
      });
    }else{
      Get.snackbar("item count", "You can't reduce more!",
        backgroundColor: Appcolors.mainColor,
        colorText: Colors.white,
      );
    }
   }

 }

 bool existInCart(productsCategoryModel productsCategory,){
    if (_items.containsKey(productsCategory.id,)){
      return true;
    }
    return false;
 }

 int getQuantity(productsCategoryModel productsCategory,){
      var quantity = 0;
      if (_items.containsKey(productsCategory.id,)){
        _items.forEach((key, value) {
          if (key == productsCategory.id){
            quantity = value.quantity!;
          }
        });
      }
      return quantity;
 }

 int get totalItems {
   var totalQuantity =0;
    _items.forEach((key, value) {
     totalQuantity += value.quantity!;
    });
   return totalQuantity;
 }



}