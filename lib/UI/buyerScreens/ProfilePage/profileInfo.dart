import 'dart:convert';

import 'package:dna_graduation/UI/buyerScreens/BNB.dart';
import 'package:dna_graduation/UI/buyerScreens/ProfilePage/orderDetails.dart';
import 'package:dna_graduation/data/apiData/urls.dart';
import 'package:flutter/material.dart';
import 'package:dna_graduation/data/sharedPrefs/data.dart';
import 'package:http/http.dart';
import 'dart:math' as math;

class profileInfo extends StatefulWidget {
  const profileInfo({Key? key}) : super(key: key);

  @override
  _profileInfoState createState() => _profileInfoState();
}

class _profileInfoState extends State<profileInfo> {
  var myordersList;
  int ordersCount = 0;
  getProfileData() async {
    try {
      var url = Uri.parse("$baseUrl/myProfile");

      Map<String, String> headers = {
        "Content-type": "application/json",
        "Access-Control-Allow-Origin": "*"
      };

      String json = '{"token": "${userSharedPrefs.getToken()}"}';
      Response response = await post(
        url,
        headers: headers,
        body: json,
      );
      String body1 = response.body;
      var data = jsonDecode(body1);
      var success = data["success"];

      if (success == "true") {
        return data["data"][0];
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
          leading: // import this

              Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(math.pi),
            child: IconButton(
              icon: Icon(Icons.logout_outlined),
              onPressed: () {
                userSharedPrefs.clearToken();
                userSharedPrefs.clearIsShop();
                userSharedPrefs.clearCart();
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => BNB()));
              },
              iconSize: 25,
              color: Colors.black,
            ),
          )),
      body: FutureBuilder(
        future: getProfileData(),
        builder: ((context, snapshot) {
          if (snapshot.hasError) {
            final error = snapshot.error;
            return Text('Error: $error');
          } else if (snapshot.hasData) {
            var data = snapshot.data;
            return profile(data);
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

  Widget profile(data) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey.withOpacity(.3),
                radius: 62.0,
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/emptypfp.jpeg'),
                  radius: 60.0,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "${data['displayName']}",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                    fontSize: 17),
              ),
              SizedBox(
                height: 7,
              ),
              Text(
                "@${data['username']}",
                style: TextStyle(
                    fontWeight: FontWeight.w200,
                    fontFamily: 'Roboto',
                    fontSize: 12),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                width: 350,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(.35),
                        blurRadius: 20,
                        spreadRadius: 10,
                      )
                    ]),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.location_on),
                        SizedBox(
                          height: 5,
                        ),
                        Icon(Icons.phone_android)
                      ],
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data['province']),
                        SizedBox(
                          height: 15,
                        ),
                        Text(data['number']),
                      ],
                    ),
                    Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.date_range),
                        SizedBox(
                          height: 5,
                        ),
                        Icon(Icons.check_circle_outline)
                      ],
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data['timeJoined']),
                        SizedBox(
                          height: 15,
                        ),
                        Text("23"),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(.35),
                          blurRadius: 20,
                          spreadRadius: 10,
                        )
                      ]),
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  child: Column(children: [
                    Text(
                      "Orders",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                    ),
                    Container(
                      height: 500,
                      padding: EdgeInsets.all(10),
                      child: FutureBuilder(
                        future: getMyOrders(userSharedPrefs.getToken()),
                        builder: ((context, snapshot) {
                          if (snapshot.hasError) {
                            final error = snapshot.error;
                            return Text('Error: $error');
                          } else if (snapshot.hasData) {
                            var data = snapshot.data;
                            return myOrdersBuild(data);
                          } else {
                            return Center(
                              child: CircularProgressIndicator(
                                color: Colors.grey,
                              ),
                            );
                          }
                        }),
                      ),
                    ),
                  ]))
            ],
          ),
        ),
      ),
    );
  }

  Widget IconText(IconData icon, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          icon,
          color: Colors.black,
          size: 22,
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          child: Text(
            text,
            style: TextStyle(color: Colors.black),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            softWrap: false,
          ),
        )
      ],
    );
  }

  Widget myOrdersBuild(data) {
    return GridView.builder(
      itemCount: data.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 15, mainAxisSpacing: 15.0),
      itemBuilder: (BuildContext context, int index) {
        print(data[index]);
        return InkWell(
          onTap: () async {
            await Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ordersDetails(orderData: data[index])));
          },
          child: Container(
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.only(top: 5),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(25)),
            child: Column(
              children: [
                Text(
                  "Order #${data[index][0]["orderid"]}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text("${data[index].length} Products"),
                Text("Status ${data[index][0]["status"]}"),
                Text("Date ${data[index][0]["orderDate"]}"),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "${data[index][0]["orderPrice"]} IQD",
                    style: TextStyle(color: Colors.white),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.black),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future getMyOrders(usertoken) async {
    try {
      var url = Uri.parse('$baseUrl/myOrders');
      Map<String, String> headers = {"Content-type": "application/json"};

      String json = '{"ownerToken":"$usertoken"}';
      Response response = await post(url, headers: headers, body: json);
      String body1 = response.body;
      var data = jsonDecode(body1);
      var success = data["success"];
      if (success == "true") {
        List orders = data["orders"];
        orders.removeWhere((value) => value == null);

        int ordersAmount = orders.length;

        return orders;
      } else {
        throw data['data'];
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
      return false;
    }
  }
}
