import 'package:flutter/material.dart';
import 'package:kobis_xtra/common/colors.dart';
import 'package:kobis_xtra/pages/cart/cart_page.dart';
import 'package:kobis_xtra/pages/food_pages/main_menu.dart';
import 'package:kobis_xtra/pages/home_screen/main_food_page.dart';
import 'package:kobis_xtra/pages/more_page.dart';
import 'package:kobis_xtra/pages/track_my_order.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
int _selectedIndex = 0;

  List pages = [
    MainFoodPage(),
    MainMenu(),
    CartPage(),
    TrackMyOrder(),
    MorePage(),
  ];

  void onTapNav(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Appcolors.mainColor,
        unselectedItemColor: Colors.grey,
        currentIndex:_selectedIndex ,
        //showSelectedLabels: false,
       // showUnselectedLabels: false,
        onTap: onTapNav,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "Store"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.menu_book_outlined),
              label: "Menu"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              label: "My cart"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.bus_alert),
              label: "Track myOrder"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.format_list_numbered_outlined),
              label: "More"
          ),
        ],),
    );
  }
}
