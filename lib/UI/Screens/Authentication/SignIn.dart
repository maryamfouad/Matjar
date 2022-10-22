import 'package:flutter/material.dart';
import 'package:dna_graduation/UI/Screens/Authentication/SignUp.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key ? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController username = new TextEditingController();
  TextEditingController password = new TextEditingController();
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
                    padding: const EdgeInsets.only(bottom: 35, top: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Welcome Back",
                          style: TextStyle(
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 25),
                        ),
                        Text(
                          "Sign to continue",
                          style: TextStyle(
                              fontFamily: "Roboto",
                             //fontWeight: FontWeight.bold,
                              color: Colors.blueGrey,
                              fontSize: 18),
                        ),
                      ],
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
                  Padding(padding: EdgeInsets.only(bottom: 35)),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Login",
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
                        "Don't have an account ?",
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontFamily: "Roboto",
                        ),
                      ),
                      GestureDetector(
                        child: Text(
                          " Create a new account",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.bold),
                        ),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUp()));
                        },
                      ),
                    ],
                  )
                ])));
  }
}
