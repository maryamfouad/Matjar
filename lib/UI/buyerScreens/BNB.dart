import 'package:dna_graduation/UI/buyerScreens/Authentication/SignIn.dart';
import 'package:dna_graduation/UI/buyerScreens/CategoryPage/Category.dart';
import 'package:dna_graduation/UI/buyerScreens/CartPage/Cart.dart';
import 'package:dna_graduation/UI/buyerScreens/ProfilePage/profileInfo.dart';
import 'package:flutter/material.dart';
import 'package:dna_graduation/UI/buyerScreens/HomePage/Home.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:dna_graduation/data/sharedPrefs/data.dart';

class BNB extends StatefulWidget {
  const BNB({Key? key}) : super(key: key);

  @override
  _BNBState createState() => _BNBState();
}

class _BNBState extends State<BNB> {
  int SelectedIndex = 0;
  var token;
  var pages;
  Future detPage(token) async {
    if (token != null) {
      pages = [
        Home(),
        Categories(),
        Cart(),
        profileInfo(),
      ];
    } else {
      pages = [
        Home(),
        Categories(),
        Cart(),
        SignIn(),
      ];
    }
  }

  @override
  void initState() {
    token = userSharedPrefs.getToken();
    print(token);
    super.initState();
    detPage(token);
  }

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
          ),
          CustomNavigationBarItem(
            icon: Icon(Icons.category),
          ),
          CustomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
          ),
          CustomNavigationBarItem(
            icon: Icon(Icons.account_circle),
          ),
        ],
        currentIndex: SelectedIndex,
        onTap: (index) {
          setState(() {
            SelectedIndex = index;
          });
        },
      ),
      body: pages[SelectedIndex],
    );
  }
}
