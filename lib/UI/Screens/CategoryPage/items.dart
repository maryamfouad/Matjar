import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Items extends StatefulWidget {
  const Items({Key? key}) : super(key: key);

  @override
  _ItemsState createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
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
          height:MediaQuery.of(context).size.height ,
          child: GridView.builder(
              scrollDirection: Axis.vertical,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2 , mainAxisSpacing: 10 , crossAxisSpacing: 10),
              itemCount: 10,
              itemBuilder: (BuildContext ctx, index) {
                return  Items("images/6.jpg", "Carolina Herrera", "190");

              }),
        ),
      ),
    );
  }

  Widget Items(String img, String name, String price) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Image.asset(
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
    );
  }
}
