import 'dart:html';
import 'package:carousel_images/carousel_images.dart';
import 'package:flutter/material.dart';
import 'package:dna_graduation/UI/Screens/SplashScreen//Splash.dart';
import 'package:dna_graduation/UI/Screens/BNB.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> listImage = [
    "images/2.jpg",
    "images/2.jpg",
    "images/2.jpg",
    "images/2.jpg",
  ];
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
          "Home",
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.symmetric(vertical: 12)),
              CarouselImages(
                scaleFactor: 0.6,
                listImages: listImage,
                height: 240.0,
                borderRadius: 30.0,
                verticalAlignment: Alignment.topCenter,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text("Best Sales" , style:TextStyle(
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black,
                ),
                  textAlign: TextAlign.left,
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom :5)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Container(
                  height: 165,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Best_Sales("images/1.jpg", "Dior", "200");}),
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom :25)),
              Padding(
                padding: const EdgeInsets.only(left:10.0),
                child: Text("On Sales" ,
                  style:TextStyle(
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black,
                ),
                  textAlign: TextAlign.left,
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom :5)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Container(
                  height: 185,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Sales("images/3.jpg", "Versace", "200" , "150");}),
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom :10)),
            ],
          ),

        ),
      ),
    );
  }

  Widget Best_Sales(
    String img,
    String name,
    String price,
  ) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          height: 120,
          width: 100,
          decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(7),
              image: DecorationImage(
                  image: AssetImage("$img"), fit: BoxFit.cover)),
        ),
        Padding(padding: EdgeInsets.only(bottom: 5)),
        Text("$name"),
        Padding(padding: EdgeInsets.only(bottom :5)),
        Text("$price IQD"),
      ],
    );
  }
  Widget Sales(
      String img,
      String name,
      String Old_price,
      String New_price
      ) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          height: 120,
          width: 100,
          decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(7),
              image: DecorationImage(
                  image: AssetImage("$img"), fit: BoxFit.cover)),
        ),
        Padding(padding: EdgeInsets.only(bottom: 5)),
        Text("$name "),
        Padding(padding: EdgeInsets.only(bottom :5)),
        Text("$Old_price IQD" , style: TextStyle(
          color: Colors.red,
          fontSize: 11,
          decoration: TextDecoration.lineThrough
        ),),
        Padding(padding: EdgeInsets.only(bottom :5)),
        Text("$New_price IQD", style: TextStyle(
          fontSize: 15
        ),),
      ],
    );
  }
}
