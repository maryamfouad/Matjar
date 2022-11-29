import 'dart:convert';

import 'package:carousel_images/carousel_images.dart';
import 'package:dna_graduation/UI/buyerScreens/CategoryPage/itemDetails.dart';
import 'package:dna_graduation/data/apiData/urls.dart';
import 'package:flutter/material.dart';
import 'package:dna_graduation/data/sharedPrefs/data.dart';
import 'package:http/http.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var infolist;
  List<String> listImage = [
    'images/2.jpg',
    'images/3.jpg',
    'images/4.jpg',
  ];
  getHomeData() async {
    try {
      var url1 = Uri.parse("$baseUrl/category/recommendedproducts");

      Response response1 = await get(
        url1,
      );
      String body1 = response1.body;

      var data1 = jsonDecode(body1);

      var url2 = Uri.parse("$baseUrl/category/bestsalesproducts");

      Response response2 = await get(
        url2,
      );
      String body2 = response2.body;

      var data2 = jsonDecode(body2);

      var datas = [];
      print(data1['data']);
      print(data2['data']);
      datas.add(data1["data"]);
      datas.add(data2["data"]);
      print(datas);
      print('done return');
      return datas;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.2),
      appBar: AppBar(
        elevation: 0.7,
        bottomOpacity: 0.1,
        toolbarHeight: 40,
        backgroundColor: Colors.white,
        title: Text(
          "Home",
          style: TextStyle(color: Colors.black, fontFamily: "Roboto"),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: getHomeData(),
        builder: ((context, snapshot) {
          if (snapshot.hasError) {
            final error = snapshot.error;
            return Text('Error: $error');
          } else if (snapshot.hasData) {
            var data = snapshot.data;
            return homeBuild(data);
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.grey,
              ),
            );
          }
        }),
      ),
    );
  }

  Widget homeBuild(data) {
    var recommendedData = data[0];
    print(recommendedData.length);
    var salesData = data[1];
    print(salesData.length);
    print(salesData[0]['saleprecent']);
    print(salesData[0]['productPrice']);
    return Container(
      padding: const EdgeInsets.all(8.0),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        children: [
          Container(
            child: CarouselImages(
              scaleFactor: 0.6,
              listImages: listImage,
              height: 240.0,
              borderRadius: 30.0,
              verticalAlignment: Alignment.topCenter,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25, left: 10.0),
            child: Text(
              "Recommended",
              style: TextStyle(
                fontFamily: "Roboto",
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 5)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              height: 280,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  itemCount: recommendedData.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.only(top: 5, right: 12, bottom: 10),
                      child: itemCard(recommendedData[index]),
                    );
                  }),
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 25)),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              "Best Selling",
              style: TextStyle(
                fontFamily: "Roboto",
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 7)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              height: 280,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  itemCount: salesData.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.only(top: 5, right: 12, bottom: 10),
                      child: itemCard(salesData[index]),
                    );
                  }),
            ),
          ),
        ],
      ),
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
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade400, spreadRadius: 2, blurRadius: 5)
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

  // Widget Sales(itemdata) {
  //   String img = itemdata['productImage'];
  //   String name = itemdata['productName'];
  //   String Old_price = "${itemdata['productPrice']}";
  //   String New_price =
  //       "${itemdata['productPrice'] - itemdata['productPrice'] * itemdata['saleprecent']}";
  //   String description = itemdata['productDescription'];
  //   List categories =
  //       itemdata['productCategory'].replaceAll(' ', '').split(',');
  //   return InkWell(
  //     onTap: () async {
  //       await Navigator.of(context).push(MaterialPageRoute(
  //           builder: (context) => iteminfo(
  //                 itemData: itemdata,
  //               )));
  //     },
  //     child: Container(
  //       width: 160,
  //       padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
  //       decoration: BoxDecoration(
  //         color: Colors.white,
  //         borderRadius: BorderRadius.all(Radius.circular(25)),
  //         // boxShadow: [
  //         //   BoxShadow(
  //         //       color: Colors.grey.shade400, spreadRadius: 2, blurRadius: 5)
  //         // ]
  //         border: Border.all(color: Colors.grey),
  //       ),
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //         children: [
  //           Container(
  //             height: 120,
  //             decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(20),
  //                 image: DecorationImage(
  //                     image: NetworkImage(img), fit: BoxFit.cover)),
  //           ),
  //           Align(
  //               alignment: Alignment.centerLeft,
  //               child: Text(
  //                 "$name",
  //                 maxLines: 1,
  //                 overflow: TextOverflow.ellipsis,
  //                 softWrap: false,
  //                 style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
  //               )),
  //           SizedBox(
  //             height: 5,
  //           ),
  //           Flexible(
  //             child: Align(
  //                 alignment: Alignment.centerLeft,
  //                 child: Text(
  //                   "$description",
  //                   style: TextStyle(fontSize: 13),
  //                   maxLines: 1,
  //                   overflow: TextOverflow.fade,
  //                   softWrap: false,
  //                 )),
  //           ),
  //           SizedBox(
  //             height: 10,
  //           ),
  //           CategoriesCards(categories),
  //           SizedBox(
  //             height: 15,
  //           ),
  //           Text(
  //             "$Old_price IQD",
  //             style: TextStyle(
  //                 color: Colors.red,
  //                 fontSize: 13,
  //                 decoration: TextDecoration.lineThrough),
  //           ),
  //           Text(
  //             "$New_price IQD",
  //             style: TextStyle(fontSize: 12),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

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
