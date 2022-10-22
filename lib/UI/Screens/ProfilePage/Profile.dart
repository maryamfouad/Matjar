import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
          "Profile",
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
        child: Container(
          width: MediaQuery.of(context).size.width,
          height:MediaQuery.of(context).size.height ,
          child: Profile("images/5.jpg", "Maryam", "mary_23", "07726670004", "Baghdad"),
        ),
      ),
    );
  }
  Widget Profile (
      String img,
      String name,
      String username,
      String phonenumber,
      String location
      )
  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              //margin: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              height: 150,
              decoration: BoxDecoration(
                   gradient: LinearGradient(
                     colors: [
                       Colors.pink.shade400,
                       Colors.pink.shade500,
                       Colors.pink.shade600,
                       Colors.pink.shade700,
                       Colors.pink.shade800,
                       Colors.pink.shade900,

                     ]
                   )
              ),
            ),
                Positioned(
                  left: 20,
                  //top: 120,
                  bottom: -20,
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage("$img"),
                   // backgroundColor: Colors.white,
                  ),
                ),

          ],
        ),
        Padding(padding: EdgeInsets.only(bottom: 50 )),
        Padding(
          padding: const EdgeInsets.only(left: 40.0 , bottom: 10),
          child: Text("Your username :", style: TextStyle(
              color: Colors.grey,
              fontFamily: "Roboto"
          ),),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40.0 , bottom: 10),
          child: Text("$username", style: TextStyle(
              color: Colors.black,
              fontFamily: "Roboto"
          ),),
        ),
        //Padding(padding: EdgeInsets.only(bottom: 13)),
        Padding(
          padding: const EdgeInsets.only(left: 40.0 , bottom: 15),
          child: Container(
            height: 1,
            width: MediaQuery.of(context).size.width-250,
            color: Colors.grey[200],
          ),
        ),
       // Padding(padding: EdgeInsets.only(bottom: 13)),
        Padding(
          padding: const EdgeInsets.only(left: 40.0 , bottom: 15),
          child: Text("Your phone number :", style: TextStyle(
              color: Colors.grey,
              fontFamily: "Roboto"
          ),),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40.0 , bottom: 10),
          child: Text("$phonenumber", style: TextStyle(
              color: Colors.black,
              fontFamily: "Roboto"
          ),),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40.0 , bottom: 15),
          child: Container(
            height: 1,
            width: MediaQuery.of(context).size.width-250,
            color: Colors.grey[200],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40.0 , bottom: 15),
          child: Text("Your location :", style: TextStyle(
              color: Colors.grey,
              fontFamily: "Roboto"
          ),),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40.0 , bottom: 15),
          child: Text("$location", style: TextStyle(
              color: Colors.black,
              fontFamily: "Roboto"
          ),),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40.0 , bottom: 15 ),
          child: Container(
            height: 1,
            width: MediaQuery.of(context).size.width-250,
            color: Colors.grey[200],
          ),
        ),

      ],
    );
  }
}
