import 'package:dna_graduation/UI/Screens/CategoryPage/Category.dart';
import 'package:dna_graduation/UI/Screens/CartPage/Cart.dart';
import 'package:dna_graduation/UI/Screens/ProfilePage/Profile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dna_graduation/UI/Screens/HomePage/Home.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
class BNB extends StatefulWidget {
  const BNB({Key? key}) : super(key: key);

  @override
  _BNBState createState() => _BNBState();
}

class _BNBState extends State<BNB> {
  int SelectedIndex = 0;
  List pages = [
    Home(),
    Categories(),
    Cart(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavigationBar(
        iconSize: 30.0,
        selectedColor: Color(0xff040307),
        strokeColor: Color(0x30040307),
        unSelectedColor: Color(0xffacacac),
        backgroundColor: Colors.white,
        items: [
          CustomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          CustomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text("Categories"),
          ),
          CustomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            title: Text("Cart"),
          ),

          CustomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text("Me"),
          ),
        ],
        currentIndex: SelectedIndex,
        onTap: (index) {
          setState(() {
            SelectedIndex = index;
          });
        },
      )
    ,
      body: pages[SelectedIndex],
    );
  }
}
