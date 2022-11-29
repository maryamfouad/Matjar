import 'package:dna_graduation/UI/buyerScreens/CategoryPage/items.dart';
import 'package:dna_graduation/data/apiData/urls.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  Map<String, IconData> iconsMap = {
    'flowers': Icons.spa_outlined,
    'accessories': Icons.diamond_outlined,
    'home': Icons.home_outlined,
    'handmade': Icons.volunteer_activism_outlined,
    'clothing': Icons.checkroom_outlined,
    'selfcare': Icons.self_improvement_outlined,
    'other': Icons.more_horiz_outlined,
    'sport': Icons.sports_basketball_outlined,
  };
  Map categoryResp = {};
  List categoryData = [];
  Future getData() async {
    var url = Uri.parse("$baseUrl/categories");
    Response response = await get(url);

    String body = response.body;
    Map list1 = json.decode(body);
    categoryData = list1["data"];
    return categoryData;
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
          "Categories",
          style: TextStyle(color: Colors.black, fontFamily: "Roboto"),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: getData(),
        builder: ((context, snapshot) {
          if (snapshot.hasError) {
            final error = snapshot.error;
            return Text('Error: $error');
          } else if (snapshot.hasData) {
            var data = snapshot.data;
            return BuildCategories(data);
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

  Widget BuildCategories(categoryData) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height - 60,
          child: ListView.builder(
            itemCount: categoryData.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              return Category(categoryData[index]["categoryName"],
                  categoryData[index]['id']);
            },
          ),
        ),
      ),
    );
  }

  Widget Category(String Type, categoryId) {
    return Column(
      children: [
        InkWell(
          onTap: () async {
            await Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    Items(categoryId: categoryId, categoryName: Type)));
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            height: 50,
            width: MediaQuery.of(context).size.width - 25,
            child: Center(
                child: ListTile(
              horizontalTitleGap: 10,
              title: Text(
                capitalize("$Type"),
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Roboto",
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              leading: Icon(
                iconsMap[Type],
                color: Colors.black,
              ),
              trailing: Icon(Icons.arrow_right),
            )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Divider(
            height: 3,
          ),
        )
      ],
    );
  }

  String capitalize(String s) =>
      s[0].toUpperCase() + s.substring(1).toLowerCase();
}
