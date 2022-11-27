import 'dart:convert';

import 'package:dna_graduation/UI/buyerScreens/CategoryPage/itemDetails.dart';
import 'package:dna_graduation/data/sharedPrefs/data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../../data/apiData/urls.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  late List cartItems;
  bool isLoading = false;
  @override
  void initState() {
    cartItems = userSharedPrefs.getCartMap();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: cartItems.isEmpty
          ? Container()
          : IgnorePointer(
              ignoring: isLoading,
              child: FloatingActionButton.extended(
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });
                  if (cartItems.isNotEmpty) {
                    var orderStatus =
                        await placeOrder(cartItems, userSharedPrefs.getToken());
                    print(orderStatus);
                    if (orderStatus == true) {
                      setState(() {
                        var snackBar = SnackBar(
                          content: Text('Placed Order!'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        var oldmap = userSharedPrefs.getCartMap();
                        oldmap.clear();
                        cartItems.clear();
                        userSharedPrefs.setCartMap(oldmap);
                      });
                    }
                  } else {
                    var snackBar = SnackBar(
                      content: Text('Cart is empty'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                  setState(() {
                    isLoading = false;
                  });
                },
                label: Text("Order Items"),
                icon: Icon(Icons.check_circle_outline),
              ),
            ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.7,
        bottomOpacity: 0.1,
        toolbarHeight: 40,
        backgroundColor: Colors.white,
        title: Text(
          "Cart",
          style: TextStyle(color: Colors.black, fontFamily: "Roboto"),
        ),
        centerTitle: true,
      ),
      body: cartItems.isEmpty
          ? Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("images/emptyCart.png"),
                  Text("Your cart is empty, Please add an item first.")
                ],
              ),
            )
          : ListView.builder(
              itemCount: cartItems.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return Item(cartItems[index], index);
              },
            ),
    );
  }

  Widget Item(Map itemdata, index) {
    String img = itemdata['productImage'];
    String name = itemdata['productName'];
    String price = "${itemdata['productPrice']}";
    String description = itemdata['productDescription'];
    List categories =
        itemdata['productCategory'].replaceAll(' ', '').split(',');
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () async {
          await Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => iteminfo(
                    itemData: itemdata,
                  )));
        },
        child: Container(
          width: 100,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(25)),
            // boxShadow: [
            //   BoxShadow(
            //       color: Colors.grey.shade400, spreadRadius: 2, blurRadius: 5)
            // ]
            border: Border.all(color: Colors.black),
          ),
          child: Row(
            children: [
              Container(
                width: 150,
                height: 100,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: NetworkImage(img), fit: BoxFit.cover)),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        manageText("$name", 10),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      manageText("$description", 17),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              // SizedBox(
              //   height: 10,
              // ),
              Spacer(),

              Text(
                "Price:\n$price IQD",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: 15,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    var oldmap = userSharedPrefs.getCartMap();
                    oldmap.removeAt(index);
                    cartItems.removeAt(index);
                    userSharedPrefs.setCartMap(oldmap);
                  });
                },
                child: Icon(
                  Icons.dangerous_rounded,
                  color: Colors.red,
                  size: 30,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String manageText(String text, int maxLength) {
    if (text.length > maxLength) {
      var rest = text.substring(maxLength, text.length);
      var newString = text.replaceAll(rest, "...");
      print(newString);
      print(text);

      return newString;
    } else {
      return text;
    }
  }

  Future placeOrder(cartitems, usertoken) async {
    try {
      int finalprice = 0;
      List productIds = [];
      cartItems.forEach((item) {
        productIds.add(item['id']);
        finalprice = (finalprice + item['productPrice']) as int;
      });
      print(finalprice);
      String stringProductList = productIds.join(",");

      var url = Uri.parse('$baseUrl/api/newOrder');
      Map<String, String> headers = {"Content-type": "application/json"};

      String json =
          '{"orderPrice": "$finalprice", "products": "$stringProductList", "ownerToken":"$usertoken"}';
      Response response = await post(url, headers: headers, body: json);
      String body1 = response.body;
      var data = jsonDecode(body1);
      var success = data["success"];
      if (success == "true") {
        return true;
      } else {
        throw data['data'];
      }
    } catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return SimpleDialog(
              title: Text("Error"),
              contentPadding: EdgeInsets.all(20),
              children: [Text(e.toString())],
            );
          });
      return false;
    }
  }
}
