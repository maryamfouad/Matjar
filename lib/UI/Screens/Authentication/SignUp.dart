import 'package:dna_graduation/UI/Screens/Authentication/SignIn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
            child:
                Column(
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
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
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
                  borderSide: BorderSide(color: Colors.grey.shade200, width: 2),
                  //  borderRadius: BorderRadius.circular(25),
                ),
              ),
              style:
                  TextStyle(fontFamily: "Roboto", fontWeight: FontWeight.w500),
              textInputAction: TextInputAction.next,
              cursorColor: Colors.grey[600],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
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
                  borderSide: BorderSide(color: Colors.grey.shade200, width: 2),
                ),
              ),
              style:
                  TextStyle(fontFamily: "Roboto", fontWeight: FontWeight.w500),
              textInputAction: TextInputAction.next,
              cursorColor: Colors.grey[600],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
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
                  borderSide: BorderSide(color: Colors.grey.shade200, width: 2),
                ),
              ),
              style:
                  TextStyle(fontFamily: "Roboto", fontWeight: FontWeight.w500),
              textInputAction: TextInputAction.next,
              cursorColor: Colors.grey[600],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
            child: TextFormField(
              controller: PhoneNumbe,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: "PhoneNumber",
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
                  borderSide: BorderSide(color: Colors.grey.shade200, width: 2),
                ),
              ),
              style:
                  TextStyle(fontFamily: "Roboto", fontWeight: FontWeight.w500),
              textInputAction: TextInputAction.go,
              cursorColor: Colors.grey[600],
            ),
          ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
                    child: TextFormField(
                      controller: PhoneNumbe,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hintText: "Location",
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
                          borderSide: BorderSide(color: Colors.grey.shade200, width: 2),
                        ),
                      ),
                      style:
                      TextStyle(fontFamily: "Roboto", fontWeight: FontWeight.w500),
                      textInputAction: TextInputAction.go,
                      cursorColor: Colors.grey[600],
                    ),
                  ),
          Padding(padding: EdgeInsets.only(bottom: 15)),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignIn()));
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
                primary: Colors.black,
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
                  Navigator.of(context).push(MaterialPageRoute(builder: (contexr)=> SignIn()));
                },
              ),
            ],
          )
        ])));
  }
}
