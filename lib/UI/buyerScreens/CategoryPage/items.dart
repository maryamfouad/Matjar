import 'package:dna_graduation/UI/buyerScreens/CategoryPage/itemDetails.dart';
import 'package:dna_graduation/data/apiData/urls.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Items extends StatefulWidget {
  final int categoryId;
  final String categoryName;

  Items({
    required this.categoryId,
    required this.categoryName,
  });

  @override
  _ItemsState createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  getCategoryData() async {
    try {
      var url = Uri.parse("$baseUrl/category/${widget.categoryName}products/");

      Response response = await get(
        url,
      );
      String body1 = response.body;
      var data = jsonDecode(body1);
      var code = data["code"];

      if (code == 200) {
        return data["data"];
      } else {
        throw data;
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
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.7,
        bottomOpacity: 0.1,
        toolbarHeight: 40,
        backgroundColor: Colors.white,
        title: Text(
          "${widget.categoryName}",
          style: TextStyle(color: Colors.black, fontFamily: "Roboto"),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined),
          onPressed: () {
            Navigator.pop(context);
          },
          iconSize: 25,
          color: Colors.black,
        ),
      ),
      body: FutureBuilder(
        future: getCategoryData(),
        builder: ((context, snapshot) {
          if (snapshot.hasError) {
            final error = snapshot.error;
            return Text('Error: $error');
          } else if (snapshot.hasData) {
            var data = snapshot.data;
            print(data.toString());
            if (data.toString() == "[]") {
              return Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      "https://img.freepik.com/premium-vector/file-found-flat-illustration_418302-62.jpg?w=740",
                      height: 400,
                      width: 400,
                    ),
                    Text("No items found"),
                  ],
                ),
              );
            }
            return buildItems(data);
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

  Widget buildItems(data) {
    return ListView.builder(
      itemCount: data.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) {
        return Item(data[index], index);
      },
    );
  }

  Widget Item(Map itemdata, index) {
    String img = itemdata['productImage'];
    String name = itemdata['productName'];
    String price = "${itemdata['productPrice']}";
    String description = itemdata['productDescription'];

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
                        manageText(name, 15),
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

      return newString;
    } else {
      return text;
    }
  }
}
