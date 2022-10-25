import 'package:flutter/cupertino.dart';
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
  Map categoryResp = {};
  List categoryData = [];
  Future getData() async {
    var url = Uri.parse(
        "https://matjar-api.matjarteam.repl.co/category/${widget.categoryName}Products/");
    Response response = await get(url);

    String body = response.body;
    Map list1 = json.decode(body);

    return list1;
  }

  @override
  void initState() {
    super.initState();
    getData().then((value) {
      setState(() {
        categoryResp = value;
        if (categoryResp['code'] != 200) {
          print('error in getting data: ' + categoryResp['MSG']);
        }
        categoryData = categoryResp["data"];
        print(categoryData);
      });
    });
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
        /* title: Text(
          "بيجاتكم",
          style: TextStyle(color: Colors.black, fontFamily: "Roboto"),
        ),
        centerTitle: true, */
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined),
          onPressed: () {
            Navigator.pop(context);
          },
          iconSize: 25,
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: GridView.builder(
              scrollDirection: Axis.vertical,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
              itemCount: categoryData.length,
              itemBuilder: (BuildContext ctx, index) {
                return Items(
                    categoryData[index]['productImage'],
                    categoryData[index]['productName'],
                    categoryData[index]['productPrice']);
              }),
        ),
      ),
    );
  }

  Widget Items(String img, String name, String price) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(50)),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.network(
                  "$img",
                  fit: BoxFit.cover,
                ),
                height: 150,
                width: 150,
              ),
              Padding(padding: EdgeInsets.only(bottom: 5)),
              Text(
                "$name",
                style: TextStyle(color: Colors.black, fontFamily: "Roboto"),
              ),
              Padding(padding: EdgeInsets.only(bottom: 5)),
              Text(
                "$price IQD",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
