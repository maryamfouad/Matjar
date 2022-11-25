import 'dart:convert';

import 'package:dna_graduation/UI/buyerScreens/BNB.dart';
import 'package:dna_graduation/data/apiData/urls.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:dna_graduation/data/sharedPrefs/data.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController username = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController name = new TextEditingController();
  TextEditingController PhoneNumbe = new TextEditingController();
  TextEditingController location = new TextEditingController();
  bool? isShop = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.1,
          //bottomOpacity: 0.1,
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
        body: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20, top: 15),
                child: Text(
                  "Create New Account",
                  style: TextStyle(
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 22),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
                child: TextFormField(
                  controller: name,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: "Full Name",
                    labelStyle: TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Roboto"),
                    prefixIcon: Icon(
                      Icons.drive_file_rename_outline,
                      size: 20,
                      color: Colors.grey,
                    ),
                    enabled: true,
                    enabledBorder: OutlineInputBorder(
                      // borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.grey.shade100),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey.shade200, width: 2),
                      //  borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  style: TextStyle(
                      fontFamily: "Roboto", fontWeight: FontWeight.w500),
                  textInputAction: TextInputAction.next,
                  cursorColor: Colors.grey[600],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
                child: TextFormField(
                  controller: username,
                  decoration: InputDecoration(
                    labelText: "Username",
                    labelStyle: TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Roboto"),
                    prefixIcon: Icon(
                      Icons.person,
                      size: 20,
                      color: Colors.grey,
                    ),
                    enabled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade100),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey.shade200, width: 2),
                    ),
                  ),
                  style: TextStyle(
                      fontFamily: "Roboto", fontWeight: FontWeight.w500),
                  textInputAction: TextInputAction.next,
                  cursorColor: Colors.grey[600],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
                child: TextFormField(
                  controller: password,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Roboto"),
                    prefixIcon: Icon(
                      Icons.lock_rounded,
                      size: 20,
                      color: Colors.grey,
                    ),
                    enabled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade100),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey.shade200, width: 2),
                    ),
                  ),
                  style: TextStyle(
                      fontFamily: "Roboto", fontWeight: FontWeight.w500),
                  textInputAction: TextInputAction.next,
                  cursorColor: Colors.grey[600],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
                child: TextFormField(
                  controller: PhoneNumbe,
                  decoration: InputDecoration(
                    labelText: "Phone Number",
                    labelStyle: TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Roboto"),
                    prefixIcon: Icon(
                      Icons.phone_android,
                      size: 20,
                      color: Colors.grey,
                    ),
                    enabled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade100),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey.shade200, width: 2),
                    ),
                  ),
                  style: TextStyle(
                      fontFamily: "Roboto", fontWeight: FontWeight.w500),
                  textInputAction: TextInputAction.next,
                  cursorColor: Colors.grey[600],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
                child: TextFormField(
                  controller: location,
                  decoration: InputDecoration(
                    labelText: "Location",
                    labelStyle: TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Roboto"),
                    prefixIcon: Icon(
                      Icons.location_on,
                      size: 20,
                      color: Colors.grey,
                    ),
                    enabled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade100),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey.shade200, width: 2),
                    ),
                  ),
                  style: TextStyle(
                      fontFamily: "Roboto", fontWeight: FontWeight.w500),
                  textInputAction: TextInputAction.next,
                  cursorColor: Colors.grey[600],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 14),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade200)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.shopping_bag,
                            size: 20,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            'Are you a seller?',
                            style: TextStyle(
                                color: Colors.black45,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Roboto",
                                fontSize: 16),
                          ),
                        ],
                      ),
                      Checkbox(
                        checkColor: Colors.white,
                        activeColor: Colors.grey,
                        value: this.isShop,
                        onChanged: (bool? value) {
                          setState(() {
                            this.isShop = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 15)),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    await SignUp(username.text, password.text, PhoneNumbe.text,
                        isShop, name.text, location.text);
                  },
                  child: Text(
                    "Register",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    minimumSize: Size(250, 50),
                    padding: (EdgeInsets.all(10)),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account ?",
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontFamily: "Roboto",
                    ),
                  ),
                  GestureDetector(
                    child: Text(
                      " Click Here",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              )
            ])));
  }

  Future SignUp(
      username, password, number, isShop, displayName, location) async {
    try {
      var url = Uri.parse("$baseUrl/signup");
      Map<String, String> headers = {
        "Content-type": "application/json",
        "Access-Control-Allow-Origin": "*"
      };

      String json =
          '{"username": "$username", "password": "$password", "number": "$number", "isShop": "$isShop", "displayName": "$displayName","province": "$location"}';
      Response response = await post(
        url,
        headers: headers,
        body: json,
      );
      String body1 = response.body;
      print(body1);
      var data = jsonDecode(body1);
      print(data);
      var success = data["success"];

      if (success == "true") {
        var token = data['token'];
        userSharedPrefs.setToken(token);
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => BNB()));
      } else {
        throw data['message'];
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
}
