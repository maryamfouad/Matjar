import 'package:flutter/material.dart';
import 'package:dna_graduation/data/sharedPrefs/data.dart';

import '../buyerScreens/BNB.dart';

class sellerbnbtest extends StatefulWidget {
  const sellerbnbtest({Key? key}) : super(key: key);

  @override
  State<sellerbnbtest> createState() => _sellerbnbtestState();
}

class _sellerbnbtestState extends State<sellerbnbtest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: GestureDetector(
            child: Text(
              "log out",
              style: TextStyle(color: Colors.red),
            ),
            onTap: (() {
              print(userSharedPrefs.getToken());
              userSharedPrefs.clearToken();
              userSharedPrefs.clearIsShop();
              print(userSharedPrefs.getToken());
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => BNB()));
            }),
          ),
        ),
      ),
    );
  }
}
