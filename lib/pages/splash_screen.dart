import 'dart:async';
import 'package:flutter/material.dart';
import 'home_screen/home_page.dart';
import 'home_screen/main_food_page.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key,}) : super(key: key);


  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  _SplashScreenState(){



    Timer(const Duration(milliseconds: 4000), (){
      setState(() {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => HomePage()), (route) => false);
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    return
        Container(
          color: Colors.white,
          child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 190,
                  width: 190,
                  child: FittedBox(
            child: Image.asset("assets/images/kobis icon.png"),
                    fit: BoxFit.contain
                  ),
                ),
        ],
          ),
        );
  }
  }
