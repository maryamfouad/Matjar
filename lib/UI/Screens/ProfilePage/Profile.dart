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
    );
  }
}
