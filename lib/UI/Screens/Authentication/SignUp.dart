import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key ? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  color: Colors.black,
                  height: 350,
                  width: MediaQuery.of(context).size.width,
                  child: Positioned
                    (top: 20,
                      left: 20,
                      child: Container(
                        height: 35,
                        width: 35,
                        child: IconButton(
                          icon: Icon(Icons.arrow_back_outlined),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          iconSize: 25,
                          color: Colors.black,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),

                        ),
                      )),
                ),
                Positioned(
                    top: 200,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                        color: Colors.white
                      ),
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
