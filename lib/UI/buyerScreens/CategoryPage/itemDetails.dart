import 'dart:convert';

import 'package:dna_graduation/data/apiData/urls.dart';
import 'package:flutter/material.dart';
import 'package:full_screen_image_null_safe/full_screen_image_null_safe.dart';
import 'package:http/http.dart';
import 'package:dna_graduation/data/sharedPrefs/data.dart';

class iteminfo extends StatefulWidget {
  final Map itemData;
  iteminfo({
    required this.itemData,
  });

  @override
  State<iteminfo> createState() => _iteminfoState();
}

class _iteminfoState extends State<iteminfo> {
  getRecommendedData() async {
    try {
      var url = Uri.parse("$baseUrl/category/recommendedProducts");

      Response response = await get(
        url,
      );
      String body = response.body;

      var data = jsonDecode(body);

      print(data);
      return data['data'];
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
    }
  }

  String varforradio = '';
  int number = 0;
  bool value1 = false;
  bool value2 = false;
  int imageheight = 250;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.7,
        bottomOpacity: 0.1,
        toolbarHeight: 40,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined),
          onPressed: () {
            Navigator.pop(context);
          },
          iconSize: 25,
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            FullScreenWidget(
              child: Hero(
                tag: widget.itemData["productName"],
                child: Container(
                  height: 220,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey, blurRadius: 3, spreadRadius: 3)
                      ],
                      image: DecorationImage(
                          image: NetworkImage(
                            "${widget.itemData['productImage']}",
                          ),
                          fit: BoxFit.cover),
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(30)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Container(
                height: MediaQuery.of(context).size.height / 1.5,
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.itemData['productName'],
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 22),
                        ),
                        Text(
                          "${widget.itemData['productPrice']} IQD",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 25),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CategoriesCards(widget.itemData['productCategory']
                        .replaceAll(' ', '')
                        .split(',')),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Recommended",
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    FutureBuilder(
                      future: getRecommendedData(),
                      builder: ((context, snapshot) {
                        if (snapshot.hasError) {
                          final error = snapshot.error;
                          return Text('Error: $error');
                        } else if (snapshot.hasData) {
                          var data = snapshot.data;
                          return buildRecommended(data);
                        } else {
                          return Center(
                            child: CircularProgressIndicator(
                              color: Colors.grey,
                            ),
                          );
                        }
                      }),
                    ),
                    Spacer(),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Description",
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Divider(
                      height: 10,
                      thickness: 2,
                      indent: 150,
                      endIndent: 150,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "${widget.itemData['productDescription']}",
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: ElevatedButton(
                        onPressed: () {
                          if (userSharedPrefs.getToken()?.isNotEmpty ?? false) {
                            var snackBar = SnackBar(
                              content: Text('Added to cart!'),
                            );
                            print(widget.itemData.runtimeType);
                            var cartBefore = userSharedPrefs.getCartMap();
                            cartBefore.add(widget.itemData);
                            userSharedPrefs.setCartMap(cartBefore);
                            print(userSharedPrefs.getCartMap());
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else {
                            var snackBar = SnackBar(
                              content: Text('Please login first.'),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.shopping_cart),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Add To Cart",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          minimumSize: Size(250, 50),
                          padding: (EdgeInsets.all(10)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildRecommended(data) {
    return Container(
      height: 280,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          itemCount: data.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.only(top: 5, right: 12, bottom: 10),
              child: itemCard(data[index]),
            );
          }),
    );
  }

  Widget itemCard(itemdata) {
    String img = itemdata['productImage'];
    String name = itemdata['productName'];
    String price = "${itemdata['productPrice']}";
    String description = itemdata['productDescription'];
    List categories =
        itemdata['productCategory'].replaceAll(' ', '').split(',');
    return InkWell(
      onTap: () async {
        await Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => iteminfo(
                  itemData: itemdata,
                )));
      },
      child: Container(
        width: 160,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(25)),
            border: Border.all(color: Colors.black),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade400, spreadRadius: 1, blurRadius: 5)
            ]),
        child: Column(
          children: [
            Container(
              height: 120,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: NetworkImage(img), fit: BoxFit.cover)),
            ),
            SizedBox(
              height: 15,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "$name",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                )),
            SizedBox(
              height: 5,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "$description",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 13),
                )),
            SizedBox(
              height: 5,
            ),
            CategoriesCards(categories),
            SizedBox(
              height: 15,
            ),
            Text(
              "$price IQD",
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  Widget CategoriesCards(List Categories) {
    if (Categories.contains("bestsales")) {
      Categories.remove("bestsales");
    }
    if (Categories.contains("recommended")) {
      Categories.remove("recommended");
    }
    return Container(
      height: 25,
      child: ListView.builder(
          itemCount: Categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 20,
              margin: EdgeInsets.only(right: 10),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  //boxShadow: [
                  //   BoxShadow(
                  //       spreadRadius: 1,
                  //       blurRadius: 3,
                  //       color: Colors.grey.shade400,
                  //       offset: Offset(1, 2))
                  // ],
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white),
              child: Center(child: Text("${Categories[index]}")),
            );
          }),
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
}
