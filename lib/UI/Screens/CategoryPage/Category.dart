import 'package:flutter/material.dart';
import 'package:dna_graduation/UI/Screens/BNB.dart';
import 'package:flutter/rendering.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
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
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height-60,
            child: ListView.builder(
              itemCount: 15,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return Category("Flowers");
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget Category(String Type) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20 , vertical: 5),
      height: 50,
      width: MediaQuery.of(context).size.width-100,
      child: Center(
        child: Text("$Type" , style: TextStyle(
          color: Colors.white,
          fontFamily: "Roboto",
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
     ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[400],
      ),
    );
  }
}
