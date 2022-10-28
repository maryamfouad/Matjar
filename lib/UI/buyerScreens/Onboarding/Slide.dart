import 'package:flutter/material.dart';

class Slide extends StatelessWidget {
  String image;
  String title;
  String subtitle;
  Slide({
    Key? key,
    required this.image,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //padding is used to adject the imnage so it doesn't overlapp the screen
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(image, height: 350, width: 350),
        ),
        Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
